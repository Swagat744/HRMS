const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const db = require('../config/db');
const ApiError = require('../utils/ApiError');
const { signToken } = require('../utils/jwt');
const generateLoginId = require('../utils/generateEmployeeId');

const SALT_ROUNDS = 10;

/**
 * Sign up flow (per PDF + wireframe):
 * A brand new company is registered along with its first Admin/HR user.
 * Regular employees are never self-registered -- they are created by
 * an Admin/HR user via employeeService.createEmployee (auto login id +
 * temp password), which satisfies the wireframe's "Note" requirement.
 */
async function signUp({ companyName, firstName, lastName, email, phone, password, logoUrl }) {
  const connection = await db.getConnection();
  try {
    await connection.beginTransaction();

    const [existing] = await connection.query('SELECT id FROM users WHERE email = ?', [email]);
    if (existing.length) throw new ApiError(409, 'An account with this email already exists');

    const prefix = companyName
      .split(' ')
      .map((w) => w[0])
      .join('')
      .substring(0, 3)
      .toUpperCase();

    const [companyResult] = await connection.query(
      'INSERT INTO companies (name, prefix, logo_url) VALUES (?, ?, ?)',
      [companyName, prefix, logoUrl || null]
    );
    const companyId = companyResult.insertId;

    const joiningYear = new Date().getFullYear();
    const loginId = generateLoginId({
      companyPrefix: prefix,
      firstName,
      lastName,
      joiningYear,
      runningNumber: 1,
    });

    const passwordHash = await bcrypt.hash(password, SALT_ROUNDS);

    const [userResult] = await connection.query(
      `INSERT INTO users (login_id, email, password_hash, role, is_email_verified, is_temp_password, company_id)
       VALUES (?, ?, ?, 'admin', FALSE, FALSE, ?)`,
      [loginId, email, passwordHash, companyId]
    );
    const userId = userResult.insertId;

    await connection.query(
      `INSERT INTO employees (user_id, company_id, first_name, last_name, phone, job_position, date_of_joining, employee_code)
       VALUES (?, ?, ?, ?, ?, 'Administrator', CURDATE(), ?)`,
      [userId, companyId, firstName, lastName, phone, `EMP0001`]
    );

    const verificationToken = crypto.randomBytes(32).toString('hex');
    const expiresAt = new Date(Date.now() + 24 * 60 * 60 * 1000);
    await connection.query(
      'INSERT INTO email_verification_tokens (user_id, token, expires_at) VALUES (?, ?, ?)',
      [userId, verificationToken, expiresAt]
    );

    await connection.query('INSERT INTO activity_logs (user_id, action, details) VALUES (?, ?, ?)', [
      userId,
      'SIGN_UP',
      `Company "${companyName}" registered`,
    ]);

    await connection.commit();

    // In production this token would be emailed. Returned here so the
    // hackathon demo can verify without a live SMTP server.
    return { userId, loginId, verificationToken };
  } catch (err) {
    await connection.rollback();
    throw err;
  } finally {
    connection.release();
  }
}

async function verifyEmail(token) {
  const [rows] = await db.query(
    'SELECT * FROM email_verification_tokens WHERE token = ? AND expires_at > NOW()',
    [token]
  );
  if (!rows.length) throw new ApiError(400, 'Invalid or expired verification token');

  await db.query('UPDATE users SET is_email_verified = TRUE WHERE id = ?', [rows[0].user_id]);
  await db.query('DELETE FROM email_verification_tokens WHERE id = ?', [rows[0].id]);
  return true;
}

async function signIn({ loginId, password }) {
  const [rows] = await db.query(
    `SELECT u.*, e.id AS employee_id, e.first_name, e.last_name, e.profile_picture_url
     FROM users u
     JOIN employees e ON e.user_id = u.id
     WHERE u.login_id = ? OR u.email = ?`,
    [loginId, loginId]
  );

  if (!rows.length) throw new ApiError(401, 'Invalid credentials');
  const user = rows[0];

  if (user.account_status !== 'active') {
    throw new ApiError(403, 'Your account is not active. Please contact HR.');
  }

  const match = await bcrypt.compare(password, user.password_hash);
  if (!match) throw new ApiError(401, 'Invalid credentials');

  await db.query('UPDATE users SET last_login = NOW() WHERE id = ?', [user.id]);
  await db.query('INSERT INTO activity_logs (user_id, action) VALUES (?, ?)', [user.id, 'SIGN_IN']);

  const token = signToken({
    userId: user.id,
    employeeId: user.employee_id,
    role: user.role,
    companyId: user.company_id,
  });

  return {
    token,
    user: {
      id: user.id,
      employeeId: user.employee_id,
      loginId: user.login_id,
      email: user.email,
      role: user.role,
      firstName: user.first_name,
      lastName: user.last_name,
      profilePictureUrl: user.profile_picture_url,
      forcePasswordChange: !!user.is_temp_password,
    },
  };
}

async function changePassword(userId, currentPassword, newPassword) {
  const [rows] = await db.query('SELECT password_hash FROM users WHERE id = ?', [userId]);
  if (!rows.length) throw new ApiError(404, 'User not found');

  const match = await bcrypt.compare(currentPassword, rows[0].password_hash);
  if (!match) throw new ApiError(400, 'Current password is incorrect');

  const newHash = await bcrypt.hash(newPassword, SALT_ROUNDS);
  await db.query('UPDATE users SET password_hash = ?, is_temp_password = FALSE WHERE id = ?', [
    newHash,
    userId,
  ]);
  return true;
}

async function requestPasswordReset(email) {
  const [rows] = await db.query('SELECT id FROM users WHERE email = ?', [email]);
  if (!rows.length) return null; // do not leak whether email exists

  const token = crypto.randomBytes(32).toString('hex');
  const expiresAt = new Date(Date.now() + 60 * 60 * 1000);
  await db.query('INSERT INTO password_reset_tokens (user_id, token, expires_at) VALUES (?, ?, ?)', [
    rows[0].id,
    token,
    expiresAt,
  ]);
  return token;
}

async function resetPassword(token, newPassword) {
  const [rows] = await db.query(
    'SELECT * FROM password_reset_tokens WHERE token = ? AND expires_at > NOW()',
    [token]
  );
  if (!rows.length) throw new ApiError(400, 'Invalid or expired reset token');

  const newHash = await bcrypt.hash(newPassword, SALT_ROUNDS);
  await db.query('UPDATE users SET password_hash = ?, is_temp_password = FALSE WHERE id = ?', [
    newHash,
    rows[0].user_id,
  ]);
  await db.query('DELETE FROM password_reset_tokens WHERE id = ?', [rows[0].id]);
  return true;
}

module.exports = {
  signUp,
  verifyEmail,
  signIn,
  changePassword,
  requestPasswordReset,
  resetPassword,
};
