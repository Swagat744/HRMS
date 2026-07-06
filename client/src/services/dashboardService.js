import api from './api';

export const getEmployeeDashboard = () => api.get('/dashboard/employee').then((r) => r.data);
export const getAdminDashboard = () => api.get('/dashboard/admin').then((r) => r.data);
