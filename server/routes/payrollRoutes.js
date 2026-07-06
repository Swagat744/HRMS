const router = require('express').Router();
const payrollController = require('../controllers/payrollController');
const authenticate = require('../middleware/auth');
const roleCheck = require('../middleware/roleCheck');

router.use(authenticate);

router.get('/me', payrollController.getMySalary);
router.get('/me/slip', payrollController.getSalarySlip);
router.get('/employee/:employeeId', roleCheck('admin', 'hr'), payrollController.getEmployeeSalary);
router.get('/employee/:employeeId/slip', roleCheck('admin', 'hr'), payrollController.getSalarySlip);
router.put('/employee/:employeeId', roleCheck('admin', 'hr'), payrollController.updateSalary);

module.exports = router;
