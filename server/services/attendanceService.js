const db = require('../config/db');
const ApiError = require('../utils/ApiError');

async function checkIn(employeeId) {
  const today = new Date().toISOString().slice(0, 10);
  const [existing] = await db.query(
    'SELECT * FROM attendance WHERE employee_id = ? AND work_date = ?',
    [employeeId, today]
  );
  if (existing.length && existing[0].check_in) {
    throw new ApiError(400, 'You have already checked in today');
  }

  if (existing.length) {
    await db.query(
      `UPDATE attendance SET check_in = NOW(), status = 'present' WHERE id = ?`,
      [existing[0].id]
    );
  } else {
    await db.query(
      `INSERT INTO attendance (employee_id, work_date, check_in, status) VALUES (?, ?, NOW(), 'present')`,
      [employeeId, today]
    );
  }
  return getToday(employeeId);
}

async function checkOut(employeeId) {
  const today = new Date().toISOString().slice(0, 10);
  const [rows] = await db.query('SELECT * FROM attendance WHERE employee_id = ? AND work_date = ?', [
    employeeId,
    today,
  ]);
  if (!rows.length || !rows[0].check_in) {
    throw new ApiError(400, 'You must check in before checking out');
  }
  if (rows[0].check_out) {
    throw new ApiError(400, 'You have already checked out today');
  }

  const checkInTime = new Date(rows[0].check_in);
  const checkOutTime = new Date();
  const totalHours = (checkOutTime - checkInTime) / 1000 / 60 / 60;

  const workHours = totalHours.toFixed(2);
  const extraHours = Math.max(totalHours - 9, 0).toFixed(2);
  const status = totalHours < 4.5 ? 'half_day' : 'present';

  await db.query(
    `UPDATE attendance SET check_out = NOW(), work_hours = ?, extra_hours = ?, status = ? WHERE id = ?`,
    [workHours, extraHours, status, rows[0].id]
  );
  return getToday(employeeId);
}

async function getToday(employeeId) {
  const today = new Date().toISOString().slice(0, 10);
  const [rows] = await db.query('SELECT * FROM attendance WHERE employee_id = ? AND work_date = ?', [
    employeeId,
    today,
  ]);
  return rows[0] || null;
}

async function getHistory(employeeId, { from, to }) {
  const params = [employeeId];
  let where = 'WHERE employee_id = ?';
  if (from) {
    where += ' AND work_date >= ?';
    params.push(from);
  }
  if (to) {
    where += ' AND work_date <= ?';
    params.push(to);
  }
  const [rows] = await db.query(
    `SELECT * FROM attendance ${where} ORDER BY work_date DESC`,
    params
  );
  return rows;
}

async function getCompanyAttendance(companyId, { date, search }) {
  const params = [companyId, date || new Date().toISOString().slice(0, 10)];
  let where = 'WHERE e.company_id = ? AND a.work_date = ?';
  if (search) {
    where += ' AND (e.first_name LIKE ? OR e.last_name LIKE ?)';
    params.push(`%${search}%`, `%${search}%`);
  }
  const [rows] = await db.query(
    `SELECT a.*, e.first_name, e.last_name, e.profile_picture_url
     FROM attendance a JOIN employees e ON e.id = a.employee_id
     ${where} ORDER BY e.first_name`,
    params
  );
  return rows;
}

async function getMonthlySummary(employeeId, year, month) {
  const [rows] = await db.query(
    `SELECT status, COUNT(*) AS count FROM attendance
     WHERE employee_id = ? AND YEAR(work_date) = ? AND MONTH(work_date) = ?
     GROUP BY status`,
    [employeeId, year, month]
  );
  return rows;
}

module.exports = { checkIn, checkOut, getToday, getHistory, getCompanyAttendance, getMonthlySummary };
