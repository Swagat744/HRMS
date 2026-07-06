const db = require('../config/db');
const ApiError = require('../utils/ApiError');

const LEAVE_BALANCE = { paid: 24, sick: 7 }; // days available per year, per wireframe

function countDays(start, end) {
  const s = new Date(start);
  const e = new Date(end);
  return Math.round((e - s) / (1000 * 60 * 60 * 24)) + 1;
}

async function applyLeave(employeeId, { leaveType, startDate, endDate, remarks, attachmentUrl }) {
  if (new Date(endDate) < new Date(startDate)) {
    throw new ApiError(400, 'End date cannot be before start date');
  }

  if (leaveType !== 'unpaid') {
    const usedDays = await getUsedDays(employeeId, leaveType);
    const requestedDays = countDays(startDate, endDate);
    if (usedDays + requestedDays > LEAVE_BALANCE[leaveType]) {
      throw new ApiError(400, `Insufficient ${leaveType} leave balance`);
    }
  }

  const [result] = await db.query(
    `INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, remarks, attachment_url, status)
     VALUES (?, ?, ?, ?, ?, ?, 'pending')`,
    [employeeId, leaveType, startDate, endDate, remarks || null, attachmentUrl || null]
  );
  return getLeaveById(result.insertId);
}

async function getUsedDays(employeeId, leaveType) {
  const [rows] = await db.query(
    `SELECT start_date, end_date FROM leave_requests
     WHERE employee_id = ? AND leave_type = ? AND status IN ('approved','pending') AND YEAR(start_date) = YEAR(CURDATE())`,
    [employeeId, leaveType]
  );
  return rows.reduce((sum, r) => sum + countDays(r.start_date, r.end_date), 0);
}

async function getBalance(employeeId) {
  const paidUsed = await getUsedDays(employeeId, 'paid');
  const sickUsed = await getUsedDays(employeeId, 'sick');
  return {
    paid: { total: LEAVE_BALANCE.paid, used: paidUsed, available: LEAVE_BALANCE.paid - paidUsed },
    sick: { total: LEAVE_BALANCE.sick, used: sickUsed, available: LEAVE_BALANCE.sick - sickUsed },
  };
}

async function getLeaveById(id) {
  const [rows] = await db.query('SELECT * FROM leave_requests WHERE id = ?', [id]);
  if (!rows.length) throw new ApiError(404, 'Leave request not found');
  return rows[0];
}

async function getEmployeeLeaves(employeeId) {
  const [rows] = await db.query(
    'SELECT * FROM leave_requests WHERE employee_id = ? ORDER BY created_at DESC',
    [employeeId]
  );
  return rows;
}

async function getCompanyLeaves(companyId, { status }) {
  const params = [companyId];
  let where = 'WHERE e.company_id = ?';
  if (status) {
    where += ' AND lr.status = ?';
    params.push(status);
  }
  const [rows] = await db.query(
    `SELECT lr.*, e.first_name, e.last_name, e.profile_picture_url
     FROM leave_requests lr JOIN employees e ON e.id = lr.employee_id
     ${where} ORDER BY lr.created_at DESC`,
    params
  );
  return rows;
}

async function reviewLeave(leaveId, reviewerId, status, comment) {
  if (!['approved', 'rejected'].includes(status)) {
    throw new ApiError(400, 'Status must be approved or rejected');
  }
  const leave = await getLeaveById(leaveId);
  if (leave.status !== 'pending') {
    throw new ApiError(400, 'This leave request has already been reviewed');
  }

  await db.query(
    'UPDATE leave_requests SET status = ?, reviewed_by = ?, review_comment = ? WHERE id = ?',
    [status, reviewerId, comment || null, leaveId]
  );

  if (status === 'approved') {
    // Mark attendance for the leave date range as "leave"
    const dates = [];
    let cursor = new Date(leave.start_date);
    const end = new Date(leave.end_date);
    while (cursor <= end) {
      dates.push(cursor.toISOString().slice(0, 10));
      cursor.setDate(cursor.getDate() + 1);
    }
    for (const date of dates) {
      await db.query(
        `INSERT INTO attendance (employee_id, work_date, status) VALUES (?, ?, 'leave')
         ON DUPLICATE KEY UPDATE status = 'leave'`,
        [leave.employee_id, date]
      );
    }
  }

  await db.query('INSERT INTO notifications (user_id, title, message) SELECT user_id, ?, ? FROM employees WHERE id = ?', [
    `Leave request ${status}`,
    `Your ${leave.leave_type} leave from ${leave.start_date} to ${leave.end_date} has been ${status}.`,
    leave.employee_id,
  ]);

  return getLeaveById(leaveId);
}

module.exports = { applyLeave, getBalance, getEmployeeLeaves, getCompanyLeaves, reviewLeave, getLeaveById };
