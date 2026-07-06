const asyncHandler = require('../utils/asyncHandler');
const attendanceService = require('../services/attendanceService');

const checkIn = asyncHandler(async (req, res) => {
  const record = await attendanceService.checkIn(req.user.employeeId);
  res.json({ success: true, message: 'Checked in successfully', data: record });
});

const checkOut = asyncHandler(async (req, res) => {
  const record = await attendanceService.checkOut(req.user.employeeId);
  res.json({ success: true, message: 'Checked out successfully', data: record });
});

const getToday = asyncHandler(async (req, res) => {
  const record = await attendanceService.getToday(req.user.employeeId);
  res.json({ success: true, data: record });
});

const getMyHistory = asyncHandler(async (req, res) => {
  const history = await attendanceService.getHistory(req.user.employeeId, req.query);
  res.json({ success: true, data: history });
});

const getEmployeeHistory = asyncHandler(async (req, res) => {
  const history = await attendanceService.getHistory(req.params.employeeId, req.query);
  res.json({ success: true, data: history });
});

const getCompanyAttendance = asyncHandler(async (req, res) => {
  const records = await attendanceService.getCompanyAttendance(req.user.companyId, req.query);
  res.json({ success: true, data: records });
});

const getMonthlySummary = asyncHandler(async (req, res) => {
  const { year, month } = req.query;
  const summary = await attendanceService.getMonthlySummary(
    req.params.employeeId || req.user.employeeId,
    year || new Date().getFullYear(),
    month || new Date().getMonth() + 1
  );
  res.json({ success: true, data: summary });
});

module.exports = { checkIn, checkOut, getToday, getMyHistory, getEmployeeHistory, getCompanyAttendance, getMonthlySummary };
