const router = require('express').Router();

router.use('/auth', require('./authRoutes'));
router.use('/employees', require('./employeeRoutes'));
router.use('/attendance', require('./attendanceRoutes'));
router.use('/leave', require('./leaveRoutes'));
router.use('/payroll', require('./payrollRoutes'));
router.use('/profile', require('./profileRoutes'));
router.use('/dashboard', require('./dashboardRoutes'));
router.use('/notifications', require('./notificationRoutes'));

module.exports = router;
