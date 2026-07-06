import api from './api';

export const signUp = (payload) => api.post('/auth/signup', payload).then((r) => r.data);
export const signIn = (payload) => api.post('/auth/signin', payload).then((r) => r.data);
export const changePassword = (payload) => api.post('/auth/change-password', payload).then((r) => r.data);
export const forgotPassword = (email) => api.post('/auth/forgot-password', { email }).then((r) => r.data);
export const resetPassword = (payload) => api.post('/auth/reset-password', payload).then((r) => r.data);
export const logout = () => api.post('/auth/logout').then((r) => r.data);
