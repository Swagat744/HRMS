const asyncHandler = require('../utils/asyncHandler');
const leaveService = require('../services/leaveService');

const applyLeave = asyncHandler(async (req, res) => {
  const leave = await leaveService.applyLeave(req.user.employeeId, req.body);
  res.status(201).json({ success: true, message: 'Leave request submitted', data: leave });
});

const getBalance = asyncHandler(async (req, res) => {
  const balance = await leaveService.getBalance(req.user.employeeId);
  res.json({ success: true, data: balance });
});

const getMyLeaves = asyncHandler(async (req, res) => {
  const leaves = await leaveService.getEmployeeLeaves(req.user.employeeId);
  res.json({ success: true, data: leaves });
});

const getCompanyLeaves = asyncHandler(async (req, res) => {
  const leaves = await leaveService.getCompanyLeaves(req.user.companyId, req.query);
  res.json({ success: true, data: leaves });
});

const reviewLeave = asyncHandler(async (req, res) => {
  const { status, comment } = req.body;
  const leave = await leaveService.reviewLeave(req.params.id, req.user.employeeId, status, comment);
  res.json({ success: true, message: `Leave request ${status}`, data: leave });
});

module.exports = { applyLeave, getBalance, getMyLeaves, getCompanyLeaves, reviewLeave };
