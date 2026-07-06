import api from './api';

export const getMySalary = () => api.get('/payroll/me').then((r) => r.data);
export const getMySalarySlip = (params) => api.get('/payroll/me/slip', { params }).then((r) => r.data);
export const getEmployeeSalary = (employeeId) => api.get(`/payroll/employee/${employeeId}`).then((r) => r.data);
export const updateSalary = (employeeId, payload) =>
  api.put(`/payroll/employee/${employeeId}`, payload).then((r) => r.data);
export const getEmployeeSalarySlip = (employeeId, params) =>
  api.get(`/payroll/employee/${employeeId}/slip`, { params }).then((r) => r.data);
