require('dotenv').config();
const app = require('./app');
const db = require('./config/db');

const PORT = process.env.PORT || 5000;

async function start() {
  try {
    const connection = await db.getConnection();
    console.log('Connected to MySQL database successfully.');
    connection.release();

    app.listen(PORT, () => {
      console.log(`HRMS server running on http://localhost:${PORT}`);
    });
  } catch (err) {
    console.error('Failed to connect to the database:', err.message);
    process.exit(1);
  }
}

start();
