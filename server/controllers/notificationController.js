const asyncHandler = require('../utils/asyncHandler');
const db = require('../config/db');

const getMyNotifications = asyncHandler(async (req, res) => {
  const [rows] = await db.query(
    'SELECT * FROM notifications WHERE user_id = ? ORDER BY created_at DESC LIMIT 30',
    [req.user.userId]
  );
  res.json({ success: true, data: rows });
});

const markAsRead = asyncHandler(async (req, res) => {
  await db.query('UPDATE notifications SET is_read = TRUE WHERE id = ? AND user_id = ?', [
    req.params.id,
    req.user.userId,
  ]);
  res.json({ success: true, message: 'Notification marked as read' });
});

module.exports = { getMyNotifications, markAsRead };
