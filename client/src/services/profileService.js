import api from './api';

export const getMyProfile = () => api.get('/profile/me').then((r) => r.data);
export const getEmployeeProfile = (employeeId) => api.get(`/profile/employee/${employeeId}`).then((r) => r.data);
export const updateResume = (payload, employeeId) =>
  api.put(employeeId ? `/profile/employee/${employeeId}/resume` : '/profile/me/resume', payload).then((r) => r.data);
export const updatePrivateInfo = (payload, employeeId) =>
  api
    .put(employeeId ? `/profile/employee/${employeeId}/private-info` : '/profile/me/private-info', payload)
    .then((r) => r.data);
export const updateBankDetails = (payload, employeeId) =>
  api
    .put(employeeId ? `/profile/employee/${employeeId}/bank-details` : '/profile/me/bank-details', payload)
    .then((r) => r.data);
