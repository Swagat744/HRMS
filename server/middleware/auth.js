const ApiError = require('../utils/ApiError');
const { verifyToken } = require('../utils/jwt');

// Verifies JWT from Authorization header and attaches decoded payload to req.user
function authenticate(req, res, next) {
  try {
    const header = req.headers.authorization;
    if (!header || !header.startsWith('Bearer ')) {
      throw new ApiError(401, 'Authentication token missing');
    }
    const token = header.split(' ')[1];
    const decoded = verifyToken(token);
    req.user = decoded; // { userId, employeeId, role, companyId }
    next();
  } catch (err) {
    next(new ApiError(401, 'Invalid or expired token'));
  }
}

module.exports = authenticate;
