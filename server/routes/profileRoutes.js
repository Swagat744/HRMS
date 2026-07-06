const router = require('express').Router();
const profileController = require('../controllers/profileController');
const authenticate = require('../middleware/auth');
const roleCheck = require('../middleware/roleCheck');

router.use(authenticate);

router.get('/me', profileController.getMyProfile);
router.put('/me/resume', profileController.updateResume);
router.put('/me/private-info', profileController.updatePrivateInfo);
router.put('/me/bank-details', roleCheck('admin', 'hr'), profileController.updateBankDetails);

router.get('/employee/:employeeId', roleCheck('admin', 'hr'), profileController.getEmployeeProfile);
router.put('/employee/:employeeId/resume', roleCheck('admin', 'hr'), profileController.updateResume);
router.put('/employee/:employeeId/private-info', roleCheck('admin', 'hr'), profileController.updatePrivateInfo);
router.put('/employee/:employeeId/bank-details', roleCheck('admin', 'hr'), profileController.updateBankDetails);

module.exports = router;
