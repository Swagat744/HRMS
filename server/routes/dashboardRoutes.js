const router = require('express').Router();
const dashboardController = require('../controllers/dashboardController');
const authenticate = require('../middleware/auth');
const roleCheck = require('../middleware/roleCheck');

router.use(authenticate);

router.get('/employee', dashboardController.getEmployeeDashboard);
router.get('/admin', roleCheck('admin', 'hr'), dashboardController.getAdminDashboard);

module.exports = router;
