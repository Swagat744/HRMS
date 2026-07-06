const router = require('express').Router();
const attendanceController = require('../controllers/attendanceController');
const authenticate = require('../middleware/auth');
const roleCheck = require('../middleware/roleCheck');

router.use(authenticate);

router.post('/check-in', attendanceController.checkIn);
router.post('/check-out', attendanceController.checkOut);
router.get('/today', attendanceController.getToday);
router.get('/me', attendanceController.getMyHistory);
router.get('/summary', attendanceController.getMonthlySummary);
router.get('/company', roleCheck('admin', 'hr'), attendanceController.getCompanyAttendance);
router.get('/employee/:employeeId', roleCheck('admin', 'hr'), attendanceController.getEmployeeHistory);
router.get('/employee/:employeeId/summary', roleCheck('admin', 'hr'), attendanceController.getMonthlySummary);

module.exports = router;
