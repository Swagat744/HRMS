const asyncHandler = require('../utils/asyncHandler');
const employeeService = require('../services/employeeService');

const createEmployee = asyncHandler(async (req, res) => {
  const result = await employeeService.createEmployee(req.user.companyId, req.body);
  res.status(201).json({
    success: true,
    message: 'Employee created. Share the login ID and temporary password securely.',
    data: result,
  });
});

const listEmployees = asyncHandler(async (req, res) => {
  const result = await employeeService.listEmployees(req.user.companyId, req.query);
  res.json({ success: true, data: result });
});

const getEmployee = asyncHandler(async (req, res) => {
  const employee = await employeeService.getEmployeeById(req.params.id);
  res.json({ success: true, data: employee });
});

const updateEmployee = asyncHandler(async (req, res) => {
  const employee = await employeeService.updateEmployee(req.params.id, req.body);
  res.json({ success: true, message: 'Employee updated', data: employee });
});

const deleteEmployee = asyncHandler(async (req, res) => {
  await employeeService.deleteEmployee(req.params.id);
  res.json({ success: true, message: 'Employee deleted' });
});

const uploadProfilePicture = asyncHandler(async (req, res) => {
  if (!req.file) return res.status(400).json({ success: false, message: 'No file uploaded' });
  const url = `/uploads/${req.file.filename}`;
  const employee = await employeeService.updateEmployee(req.params.id, { profilePictureUrl: url });
  res.json({ success: true, message: 'Profile picture updated', data: employee });
});

module.exports = { createEmployee, listEmployees, getEmployee, updateEmployee, deleteEmployee, uploadProfilePicture };
