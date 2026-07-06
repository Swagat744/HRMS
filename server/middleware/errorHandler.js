// Centralized error handler. All controllers forward errors here via
// asyncHandler / next(err) instead of handling responses inline.
const ApiError = require('../utils/ApiError');

// eslint-disable-next-line no-unused-vars
function errorHandler(err, req, res, next) {
  if (process.env.NODE_ENV !== 'production') {
    console.error(err);
  }

  if (err instanceof ApiError) {
    return res.status(err.statusCode).json({
      success: false,
      message: err.message,
      details: err.details || undefined,
    });
  }

  if (err.code === 'ER_DUP_ENTRY') {
    return res.status(409).json({ success: false, message: 'Duplicate entry. Record already exists.' });
  }

  return res.status(500).json({
    success: false,
    message: 'Internal server error',
  });
}

function notFound(req, res) {
  res.status(404).json({ success: false, message: `Route ${req.originalUrl} not found` });
}

module.exports = { errorHandler, notFound };
