const asyncHandler = require('../utils/asyncHandler');
const authService = require('../services/authService');

const signUp = asyncHandler(async (req, res) => {
  const result = await authService.signUp(req.body);
  res.status(201).json({
    success: true,
    message: 'Account created. Please verify your email before signing in.',
    data: result,
  });
});

const verifyEmail = asyncHandler(async (req, res) => {
  await authService.verifyEmail(req.params.token);
  res.json({ success: true, message: 'Email verified successfully' });
});

const signIn = asyncHandler(async (req, res) => {
  const result = await authService.signIn(req.body);
  res.json({ success: true, message: 'Signed in successfully', data: result });
});

const changePassword = asyncHandler(async (req, res) => {
  const { currentPassword, newPassword } = req.body;
  await authService.changePassword(req.user.userId, currentPassword, newPassword);
  res.json({ success: true, message: 'Password changed successfully' });
});

const forgotPassword = asyncHandler(async (req, res) => {
  const token = await authService.requestPasswordReset(req.body.email);
  res.json({
    success: true,
    message: 'If that email exists, a reset link has been sent.',
    data: process.env.NODE_ENV !== 'production' ? { token } : undefined,
  });
});

const resetPassword = asyncHandler(async (req, res) => {
  await authService.resetPassword(req.body.token, req.body.newPassword);
  res.json({ success: true, message: 'Password reset successfully' });
});

const logout = asyncHandler(async (req, res) => {
  // Stateless JWT: client discards the token. Endpoint kept for symmetry / activity logging.
  res.json({ success: true, message: 'Logged out successfully' });
});

const me = asyncHandler(async (req, res) => {
  res.json({ success: true, data: req.user });
});

module.exports = { signUp, verifyEmail, signIn, changePassword, forgotPassword, resetPassword, logout, me };
