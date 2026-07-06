const bcrypt = require('bcryptjs');
const db = require('../config/db');
const ApiError = require('../utils/ApiError');
const generateLoginId = require('../utils/generateEmployeeId');
const generateTempPassword = require('../utils/generatePassword');

const SALT_ROUNDS = 10;

async function createEmployee(companyId, payload) {
  const { firstName, lastName, email, phone, jobPosition, department, managerId, location } = payload;
  const connection = await db.getConnection();
  try {
    await connection.beginTransaction();

    const [existing] = await connection.query('SELECT id FROM users WHERE email = ?', [email]);
    if (existing.length) throw new ApiError(409, 'An account with this email already exists');

    const [companyRows] = await connection.query('SELECT prefix FROM companies WHERE id = ?', [companyId]);
    if (!companyRows.length) throw new ApiError(404, 'Company not found');
    const prefix = companyRows[0].prefix;

    const joiningYear = new Date().getFullYear();
    const [countRows] = await connection.query(
      `SELECT COUNT(*) AS cnt FROM employees e JOIN users u ON u.id = e.user_id
       WHERE e.company_id = ? AND YEAR(e.date_of_joining) = ?`,
      [companyId, joiningYear]
    );
    const runningNumber = countRows[0].cnt + 1;

    const loginId = generateLoginId({ companyPrefix: prefix, firstName, lastName, joiningYear, runningNumber });
    const tempPassword = generateTempPassword();
    const passwordHash = await bcrypt.hash(tempPassword, SALT_ROUNDS);

    const [userResult] = await connection.query(
      `INSERT INTO users (login_id, email, password_hash, role, is_email_verified, is_temp_password, company_id)
       VALUES (?, ?, ?, 'employee', TRUE, TRUE, ?)`,
      [loginId, email, passwordHash, companyId]
    );
    const userId = userResult.insertId;

    const employeeCode = `EMP${String(runningNumber).padStart(4, '0')}`;

    const [empResult] = await connection.query(
      `INSERT INTO employees (user_id, company_id, first_name, last_name, phone, job_position, department, manager_id, location, date_of_joining, employee_code)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, CURDATE(), ?)`,
      [userId, companyId, firstName, lastName, phone, jobPosition || null, department || null, managerId || null, location || null, employeeCode]
    );
    const employeeId = empResult.insertId;

    await connection.query('INSERT INTO employee_resume (employee_id) VALUES (?)', [employeeId]);
    await connection.query('INSERT INTO employee_private_information (employee_id) VALUES (?)', [employeeId]);
    await connection.query('INSERT INTO employee_bank_details (employee_id) VALUES (?)', [employeeId]);

    const [salaryResult] = await connection.query(
      'INSERT INTO salary (employee_id, monthly_wage, yearly_wage) VALUES (?, 0, 0)',
      [employeeId]
    );
    const salaryId = salaryResult.insertId;
    const defaultComponents = [
      ['basic', 'percentage', 50],
      ['hra', 'percentage', 50],
      ['standard_allowance', 'percentage', 16.67],
      ['performance_bonus', 'percentage', 8.33],
      ['leave_travel_allowance', 'percentage', 8.33],
      ['fixed_allowance', 'percentage', 11.67],
    ];
    for (const [name, type, value] of defaultComponents) {
      await connection.query(
        'INSERT INTO salary_components (salary_id, component_name, computation_type, value, computed_amount) VALUES (?, ?, ?, ?, 0)',
        [salaryId, name, type, value]
      );
    }

    await connection.query('INSERT INTO activity_logs (user_id, action, details) VALUES (?, ?, ?)', [
      userId,
      'EMPLOYEE_CREATED',
      `Employee ${firstName} ${lastName} (${loginId}) created`,
    ]);

    await connection.commit();
    return { employeeId, loginId, tempPassword, employeeCode };
  } catch (err) {
    await connection.rollback();
    throw err;
  } finally {
    connection.release();
  }
}

async function listEmployees(companyId, { search, department, page = 1, limit = 20 }) {
  const offset = (page - 1) * limit;
  const params = [companyId];
  let where = 'WHERE e.company_id = ?';

  if (search) {
    where += ' AND (e.first_name LIKE ? OR e.last_name LIKE ? OR u.email LIKE ? OR u.login_id LIKE ?)';
    const like = `%${search}%`;
    params.push(like, like, like, like);
  }
  if (department) {
    where += ' AND e.department = ?';
    params.push(department);
  }

  const [rows] = await db.query(
    `SELECT e.id, e.first_name, e.last_name, e.job_position, e.department, e.profile_picture_url,
            u.login_id, u.email, u.account_status,
            (SELECT status FROM attendance a WHERE a.employee_id = e.id AND a.work_date = CURDATE()) AS today_status
     FROM employees e
     JOIN users u ON u.id = e.user_id
     ${where}
     ORDER BY e.created_at DESC
     LIMIT ? OFFSET ?`,
    [...params, Number(limit), Number(offset)]
  );

  const [countRows] = await db.query(
    `SELECT COUNT(*) AS total FROM employees e JOIN users u ON u.id = e.user_id ${where}`,
    params
  );

  return { employees: rows, total: countRows[0].total, page: Number(page), limit: Number(limit) };
}

async function getEmployeeById(employeeId) {
  const [rows] = await db.query(
    `SELECT e.*, u.login_id, u.email, u.role, u.account_status, u.last_login
     FROM employees e JOIN users u ON u.id = e.user_id WHERE e.id = ?`,
    [employeeId]
  );
  if (!rows.length) throw new ApiError(404, 'Employee not found');
  return rows[0];
}

async function updateEmployee(employeeId, payload) {
  const connection = await db.getConnection();

  try {
    await connection.beginTransaction();

    const allowedFields = [
      'first_name',
      'last_name',
      'phone',
      'job_position',
      'department',
      'manager_id',
      'location',
      'profile_picture_url',
    ];

    const fieldMap = {
      firstName: 'first_name',
      lastName: 'last_name',
      phone: 'phone',
      jobPosition: 'job_position',
      department: 'department',
      managerId: 'manager_id',
      location: 'location',
      profilePictureUrl: 'profile_picture_url',
    };

    const updates = [];
    const values = [];

    for (const [key, value] of Object.entries(payload)) {
      const column = fieldMap[key];

      if (column && allowedFields.includes(column)) {
        updates.push(`${column} = ?`);
        values.push(value);
      }
    }

    if (updates.length) {
      values.push(employeeId);

      await connection.query(
        `UPDATE employees SET ${updates.join(', ')} WHERE id = ?`,
        values
      );
    }

    // Update email in users table
    if (payload.email) {
      await connection.query(
        `UPDATE users u
         JOIN employees e ON e.user_id = u.id
         SET u.email = ?
         WHERE e.id = ?`,
        [payload.email, employeeId]
      );
    }

    await connection.commit();

    return getEmployeeById(employeeId);

  } catch (err) {
    await connection.rollback();
    throw err;
  } finally {
    connection.release();
  }
}

async function deleteEmployee(employeeId) {
  const [rows] = await db.query('SELECT user_id FROM employees WHERE id = ?', [employeeId]);
  if (!rows.length) throw new ApiError(404, 'Employee not found');
  await db.query('DELETE FROM users WHERE id = ?', [rows[0].user_id]); // cascades to employees + related
  return true;
}

module.exports = { createEmployee, listEmployees, getEmployeeById, updateEmployee, deleteEmployee };
