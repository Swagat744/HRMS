const db = require('../config/db');

async function getEmployeeDashboard(employeeId) {
  const today = new Date().toISOString().slice(0, 10);

  const [attendanceToday] = await db.query(
    'SELECT * FROM attendance WHERE employee_id = ? AND work_date = ?',
    [employeeId, today]
  );

  const [leaveBalanceUsed] = await db.query(
    `SELECT leave_type, SUM(DATEDIFF(end_date, start_date) + 1) AS used
     FROM leave_requests WHERE employee_id = ? AND status = 'approved' AND YEAR(start_date) = YEAR(CURDATE())
     GROUP BY leave_type`,
    [employeeId]
  );

  const [pendingLeaves] = await db.query(
    `SELECT COUNT(*) AS count FROM leave_requests WHERE employee_id = ? AND status = 'pending'`,
    [employeeId]
  );

  const [recentActivity] = await db.query(
    `SELECT al.action, al.details, al.created_at FROM activity_logs al
     JOIN employees e ON e.user_id = al.user_id
     WHERE e.id = ? ORDER BY al.created_at DESC LIMIT 10`,
    [employeeId]
  );

  const [notifications] = await db.query(
    `SELECT n.* FROM notifications n JOIN employees e ON e.user_id = n.user_id
     WHERE e.id = ? ORDER BY n.created_at DESC LIMIT 10`,
    [employeeId]
  );

  return {
    attendanceToday: attendanceToday[0] || null,
    leaveBalanceUsed,
    pendingLeaves: pendingLeaves[0].count,
    recentActivity,
    notifications,
  };
}

async function getAdminDashboard(companyId) {
  const today = new Date().toISOString().slice(0, 10);

  const [totalEmployees] = await db.query('SELECT COUNT(*) AS count FROM employees WHERE company_id = ?', [companyId]);

  const [presentToday] = await db.query(
    `SELECT COUNT(*) AS count FROM attendance a JOIN employees e ON e.id = a.employee_id
     WHERE e.company_id = ? AND a.work_date = ? AND a.status IN ('present','late')`,
    [companyId, today]
  );

  const [onLeaveToday] = await db.query(
    `SELECT COUNT(*) AS count FROM attendance a JOIN employees e ON e.id = a.employee_id
     WHERE e.company_id = ? AND a.work_date = ? AND a.status = 'leave'`,
    [companyId, today]
  );

  const [pendingLeaveRequests] = await db.query(
    `SELECT COUNT(*) AS count FROM leave_requests lr JOIN employees e ON e.id = lr.employee_id
     WHERE e.company_id = ? AND lr.status = 'pending'`,
    [companyId]
  );

  const [totalPayroll] = await db.query(
    `SELECT SUM(s.monthly_wage) AS total FROM salary s JOIN employees e ON e.id = s.employee_id
     WHERE e.company_id = ?`,
    [companyId]
  );

  const [recentActivity] = await db.query(
    `SELECT al.action, al.details, al.created_at FROM activity_logs al
     JOIN users u ON u.id = al.user_id
     WHERE u.company_id = ? ORDER BY al.created_at DESC LIMIT 15`,
    [companyId]
  );

  const [departmentBreakdown] = await db.query(
    `SELECT department, COUNT(*) AS count FROM employees WHERE company_id = ? GROUP BY department`,
    [companyId]
  );

  return {
    totalEmployees: totalEmployees[0].count,
    presentToday: presentToday[0].count,
    onLeaveToday: onLeaveToday[0].count,
    pendingLeaveRequests: pendingLeaveRequests[0].count,
    totalMonthlyPayroll: totalPayroll[0].total || 0,
    departmentBreakdown,
    recentActivity,
  };
}

module.exports = { getEmployeeDashboard, getAdminDashboard };
