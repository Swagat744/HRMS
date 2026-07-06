const router = require('express').Router();
const authController = require('../controllers/authController');
const authenticate = require('../middleware/auth');
const { validateSignUp, validateSignIn } = require('../validators/authValidator');

router.post('/signup', validateSignUp, authController.signUp);
router.get('/verify-email/:token', authController.verifyEmail);
router.post('/signin', validateSignIn, authController.signIn);
router.post('/forgot-password', authController.forgotPassword);
router.post('/reset-password', authController.resetPassword);
router.post('/change-password', authenticate, authController.changePassword);
router.post('/logout', authenticate, authController.logout);
router.get('/me', authenticate, authController.me);

module.exports = router;
