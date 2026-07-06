import api from './api';

export const listEmployees = (params) => api.get('/employees', { params }).then((r) => r.data);
export const getEmployee = (id) => api.get(`/employees/${id}`).then((r) => r.data);
export const createEmployee = (payload) => api.post('/employees', payload).then((r) => r.data);
export const updateEmployee = (id, payload) => api.put(`/employees/${id}`, payload).then((r) => r.data);
export const deleteEmployee = (id) => api.delete(`/employees/${id}`).then((r) => r.data);
export const uploadProfilePicture = (id, formData) =>
  api
    .post(`/employees/${id}/profile-picture`, formData, {
      headers: { 'Content-Type': 'multipart/form-data' },
    })
    .then((r) => r.data);
