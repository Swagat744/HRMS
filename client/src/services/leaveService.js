import api from './api';

export const applyLeave = (payload) => api.post('/leave', payload).then((r) => r.data);
export const getBalance = () => api.get('/leave/balance').then((r) => r.data);
export const getMyLeaves = () => api.get('/leave/me').then((r) => r.data);
export const getCompanyLeaves = (params) => api.get('/leave/company', { params }).then((r) => r.data);
export const reviewLeave = (id, payload) => api.patch(`/leave/${id}/review`, payload).then((r) => r.data);
