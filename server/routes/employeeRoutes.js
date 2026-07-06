const router = require('express').Router();
const employeeController = require('../controllers/employeeController');
const authenticate = require('../middleware/auth');
const roleCheck = require('../middleware/roleCheck');
const upload = require('../middleware/upload');
const { validateCreateEmployee } = require('../validators/authValidator');

router.use(authenticate);

router.get('/', roleCheck('admin', 'hr'), employeeController.listEmployees);
router.post('/', roleCheck('admin', 'hr'), validateCreateEmployee, employeeController.createEmployee);
router.get('/:id', employeeController.getEmployee);
router.put('/:id', roleCheck('admin', 'hr'), employeeController.updateEmployee);
router.delete('/:id', roleCheck('admin', 'hr'), employeeController.deleteEmployee);
router.post('/:id/profile-picture', upload.single('avatar'), employeeController.uploadProfilePicture);

module.exports = router;
