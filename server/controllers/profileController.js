const asyncHandler = require('../utils/asyncHandler');
const profileService = require('../services/profileService');

const getMyProfile = asyncHandler(async (req, res) => {
  const profile = await profileService.getFullProfile(req.user.employeeId);
  res.json({ success: true, data: profile });
});

const getEmployeeProfile = asyncHandler(async (req, res) => {
  const profile = await profileService.getFullProfile(req.params.employeeId);
  res.json({ success: true, data: profile });
});

const updateResume = asyncHandler(async (req, res) => {
  const employeeId = req.params.employeeId || req.user.employeeId;
  const resume = await profileService.updateResume(employeeId, req.body);
  res.json({ success: true, message: 'Resume updated', data: resume });
});

const updatePrivateInfo = asyncHandler(async (req, res) => {
  const employeeId = req.params.employeeId || req.user.employeeId;
  const isAdmin = req.user.role === 'admin' || req.user.role === 'hr';
  const info = await profileService.updatePrivateInformation(employeeId, req.body, isAdmin);
  res.json({ success: true, message: 'Private information updated', data: info });
});

const updateBankDetails = asyncHandler(async (req, res) => {
  const employeeId = req.params.employeeId || req.user.employeeId;
  const details = await profileService.updateBankDetails(employeeId, req.body);
  res.json({ success: true, message: 'Bank details updated', data: details });
});

module.exports = { getMyProfile, getEmployeeProfile, updateResume, updatePrivateInfo, updateBankDetails };
