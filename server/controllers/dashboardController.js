const asyncHandler = require('../utils/asyncHandler');
const dashboardService = require('../services/dashboardService');

const getEmployeeDashboard = asyncHandler(async (req, res) => {
  const data = await dashboardService.getEmployeeDashboard(req.user.employeeId);
  res.json({ success: true, data });
});

const getAdminDashboard = asyncHandler(async (req, res) => {
  const data = await dashboardService.getAdminDashboard(req.user.companyId);
  res.json({ success: true, data });
});

module.exports = { getEmployeeDashboard, getAdminDashboard };
