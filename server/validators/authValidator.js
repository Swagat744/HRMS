const ApiError = require('../utils/ApiError');

const passwordRules = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/;

function validateSignUp(req, res, next) {
  const { companyName, firstName, lastName, email, phone, password, confirmPassword } = req.body;
  if (!companyName || !firstName || !lastName || !email || !phone || !password) {
    return next(new ApiError(400, 'All fields are required'));
  }
  if (password !== confirmPassword) {
    return next(new ApiError(400, 'Passwords do not match'));
  }
  if (!passwordRules.test(password)) {
    return next(
      new ApiError(
        400,
        'Password must be at least 8 characters and include uppercase, lowercase, a number, and a special character'
      )
    );
  }
  next();
}

function validateSignIn(req, res, next) {
  const { loginId, password } = req.body;
  if (!loginId || !password) {
    return next(new ApiError(400, 'Login ID/Email and password are required'));
  }
  next();
}

function validateCreateEmployee(req, res, next) {
  const { firstName, lastName, email, phone } = req.body;
  if (!firstName || !lastName || !email || !phone) {
    return next(new ApiError(400, 'First name, last name, email and phone are required'));
  }
  next();
}

module.exports = { validateSignUp, validateSignIn, validateCreateEmployee, passwordRules };
