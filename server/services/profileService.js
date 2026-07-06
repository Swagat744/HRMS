const db = require('../config/db');
const ApiError = require('../utils/ApiError');

async function getFullProfile(employeeId) {
  const [empRows] = await db.query(
    `SELECT e.*, u.login_id, u.email, u.role, u.account_status, u.last_login, u.is_temp_password
     FROM employees e JOIN users u ON u.id = e.user_id WHERE e.id = ?`,
    [employeeId]
  );
  if (!empRows.length) throw new ApiError(404, 'Employee not found');

  const [resumeRows] = await db.query('SELECT * FROM employee_resume WHERE employee_id = ?', [employeeId]);
  const [privateRows] = await db.query('SELECT * FROM employee_private_information WHERE employee_id = ?', [employeeId]);
  const [bankRows] = await db.query('SELECT * FROM employee_bank_details WHERE employee_id = ?', [employeeId]);

  return {
    employee: empRows[0],
    resume: resumeRows[0] || {},
    privateInformation: privateRows[0] || {},
    bankDetails: bankRows[0] || {},
  };
}

async function updateResume(employeeId, payload) {
  const { about, whatILove, interests, skills, certifications, experience } = payload;
  await db.query(
    `UPDATE employee_resume SET about = ?, what_i_love = ?, interests = ?, skills = ?, certifications = ?, experience = ?
     WHERE employee_id = ?`,
    [
      about,
      whatILove,
      interests,
      JSON.stringify(skills || []),
      JSON.stringify(certifications || []),
      JSON.stringify(experience || []),
      employeeId,
    ]
  );
  const [rows] = await db.query('SELECT * FROM employee_resume WHERE employee_id = ?', [employeeId]);
  return rows[0];
}

// Employees may only edit a limited set of fields (address, phone, avatar);
// Admin can edit everything via employeeService.updateEmployee + this.
async function updatePrivateInformation(employeeId, payload, isAdmin) {
  const fieldMap = {
    dateOfBirth: 'date_of_birth', gender: 'gender', nationality: 'nationality',
    address: 'address', personalEmail: 'personal_email', maritalStatus: 'marital_status',
    panNo: 'pan_no', uanNo: 'uan_no',
  };
  const employeeEditableFields = ['address', 'personalEmail'];

  const updates = [];
  const values = [];
  for (const [key, value] of Object.entries(payload)) {
    if (!isAdmin && !employeeEditableFields.includes(key)) continue;
    const column = fieldMap[key];
    if (column) {
      updates.push(`${column} = ?`);
      values.push(value);
    }
  }
  if (!updates.length) throw new ApiError(400, 'No valid or permitted fields to update');
  values.push(employeeId);
  await db.query(`UPDATE employee_private_information SET ${updates.join(', ')} WHERE employee_id = ?`, values);
  const [rows] = await db.query('SELECT * FROM employee_private_information WHERE employee_id = ?', [employeeId]);
  return rows[0];
}

async function updateBankDetails(employeeId, payload) {
  const { bankName, accountNumber, ifscCode } = payload;
  await db.query(
    'UPDATE employee_bank_details SET bank_name = ?, account_number = ?, ifsc_code = ? WHERE employee_id = ?',
    [bankName, accountNumber, ifscCode, employeeId]
  );
  const [rows] = await db.query('SELECT * FROM employee_bank_details WHERE employee_id = ?', [employeeId]);
  return rows[0];
}

module.exports = { getFullProfile, updateResume, updatePrivateInformation, updateBankDetails };
