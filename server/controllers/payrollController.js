const asyncHandler = require('../utils/asyncHandler');
const payrollService = require('../services/payrollService');

const getMySalary = asyncHandler(async (req, res) => {
  const structure = await payrollService.getSalaryStructure(req.user.employeeId);
  res.json({ success: true, data: structure });
});

const getEmployeeSalary = asyncHandler(async (req, res) => {
  const structure = await payrollService.getSalaryStructure(req.params.employeeId);
  res.json({ success: true, data: structure });
});

const updateSalary = asyncHandler(async (req, res) => {
  const structure = await payrollService.updateSalaryStructure(req.params.employeeId, req.body);
  res.json({ success: true, message: 'Salary structure updated', data: structure });
});

const getSalarySlip = asyncHandler(async (req, res) => {
  const { year, month } = req.query;
  const employeeId = req.params.employeeId || req.user.employeeId;
  const slip = await payrollService.generateSalarySlip(
    employeeId,
    Number(year) || new Date().getFullYear(),
    Number(month) || new Date().getMonth() + 1
  );
  res.json({ success: true, data: slip });
});

module.exports = { getMySalary, getEmployeeSalary, updateSalary, getSalarySlip };
