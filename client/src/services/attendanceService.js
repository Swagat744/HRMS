import api from './api';

export const checkIn = () => api.post('/attendance/check-in').then((r) => r.data);
export const checkOut = () => api.post('/attendance/check-out').then((r) => r.data);
export const getToday = () => api.get('/attendance/today').then((r) => r.data);
export const getMyHistory = (params) => api.get('/attendance/me', { params }).then((r) => r.data);
export const getMonthlySummary = (params) => api.get('/attendance/summary', { params }).then((r) => r.data);
export const getCompanyAttendance = (params) => api.get('/attendance/company', { params }).then((r) => r.data);
export const getEmployeeHistory = (employeeId, params) =>
  api.get(`/attendance/employee/${employeeId}`, { params }).then((r) => r.data);
