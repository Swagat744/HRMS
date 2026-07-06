const router = require('express').Router();
const leaveController = require('../controllers/leaveController');
const authenticate = require('../middleware/auth');
const roleCheck = require('../middleware/roleCheck');

router.use(authenticate);

router.post('/', leaveController.applyLeave);
router.get('/balance', leaveController.getBalance);
router.get('/me', leaveController.getMyLeaves);
router.get('/company', roleCheck('admin', 'hr'), leaveController.getCompanyLeaves);
router.patch('/:id/review', roleCheck('admin', 'hr'), leaveController.reviewLeave);

module.exports = router;
