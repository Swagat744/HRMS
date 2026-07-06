![React](https://img.shields.io/badge/React-19-blue?logo=react)
![Node.js](https://img.shields.io/badge/Node.js-Express-green?logo=node.js)
![MySQL](https://img.shields.io/badge/MySQL-Database-orange?logo=mysql)
# HRMS - Human Resource Management System

A modern Full Stack Human Resource Management System (HRMS) built using React, Node.js, Express, MySQL, and Tailwind CSS.

This application provides a complete solution for managing employees, attendance, leave requests, payroll, employee profiles, and company administration through role-based access.

---

## Features

### Authentication

- Secure Login
- JWT Authentication
- Role-Based Authorization
- Admin & Employee Portals

---

## Admin Features

- Dashboard with company overview
- Employee Management
  - Add Employee
  - View Employee
  - Edit Employee Information
  - Delete Employee
- Attendance Management
- Leave Request Management
- Payroll Management
- Employee Profile Management
- Company Statistics
- Notifications

---

## Employee Features

- Personal Dashboard
- Check In / Check Out
- Attendance History
- Apply for Leave
- View Leave Status
- View Payroll
- View Salary Slip
- View Profile
- Update Personal Address

---

## Employee Profile

Admin can edit:

- First Name
- Last Name
- Email
- Phone Number
- Department
- Job Position
- Location

Employee can view profile details securely.

---

## Attendance

- Daily Attendance
- Check In
- Check Out
- Work Hours Calculation
- Extra Hours
- Attendance History
- Attendance Status

---

## Leave Management

- Apply Leave
- Leave Approval
- Leave Rejection
- Leave History
- Pending Requests

---

## Payroll

- Monthly Salary
- Yearly Salary
- Salary Components
- Salary Slip
- Gross Salary
- Net Salary

---

## Dark Mode

Supports

- Light Theme
- Dark Theme
- System Theme

Theme preference is automatically saved in Local Storage.

---

## Tech Stack

### Frontend

- React.js
- React Router
- Tailwind CSS
- Axios
- Lucide React

### Backend

- Node.js
- Express.js
- JWT Authentication
- Multer

### Database

- MySQL

---

## Project Structure

```
HRMS/
│
├── client/
│   ├── src/
│   ├── public/
│   └── package.json
│
├── server/
│   ├── controllers/
│   ├── routes/
│   ├── middleware/
│   ├── services/
│   ├── validators/
│   └── package.json
│
├── database/
│
├── docs/
│
└── README.md
```

---

## Installation

### Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/HRMS.git
```

---

### Frontend

```bash
cd client
npm install
npm run dev
```

---

### Backend

```bash
cd server
npm install
npm start
```

---

### Database

Import the SQL file into MySQL and update the database credentials in:

```
server/config/db.js
```

---

## Screenshots

You can add screenshots here.

Example:

- Login Page
- Admin Dashboard
- Employee Dashboard
- Attendance
- Employee Directory
- Payroll
- Employee Profile
- Dark Theme

---

## Future Improvements

- Resume Editing
- Salary Editing
- Audit Logs
- Activity Tracking
- Employee Profile Picture Upload
- Email Notifications
- Reports & Analytics
- PDF Salary Slip Export

---

## Learning Outcomes

This project demonstrates:

- Full Stack Web Development
- REST API Development
- Authentication & Authorization
- CRUD Operations
- MySQL Database Design
- Role-Based Access Control
- State Management in React
- Responsive UI Design
- Modern Dashboard Development

---

## Author

**Swagat Patil**

GitHub: https://github.com/Swagat744
