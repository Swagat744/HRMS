# HRMS REST API Reference

Base URL: `http://localhost:5000/api`

All protected routes require:
```
Authorization: Bearer <JWT_TOKEN>
```

Standard response shape:
```json
{ "success": true, "message": "...", "data": {} }
```
Errors:
```json
{ "success": false, "message": "..." }
```

---

## Auth — `/auth`

| Method | Endpoint                       | Access | Description |
|--------|---------------------------------|--------|--------------|
| POST   | `/signup`                       | Public | Registers a new company + its first Admin/HR user |
| GET    | `/verify-email/:token`          | Public | Verifies email via token |
| POST   | `/signin`                       | Public | Sign in with `loginId` (or email) + `password` |
| POST   | `/forgot-password`              | Public | Requests a password reset token (emailed in production) |
| POST   | `/reset-password`               | Public | Resets password using `token` + `newPassword` |
| POST   | `/change-password`              | Auth   | Changes password; clears `is_temp_password` flag |
| POST   | `/logout`                       | Auth   | Logs the sign-out activity (JWT is stateless — client discards token) |
| GET    | `/me`                           | Auth   | Returns the decoded JWT payload |

**Sign Up body**
```json
{
  "companyName": "Odoo India",
  "firstName": "Jo",
  "lastName": "Doe",
  "email": "jo@company.com",
  "phone": "9999999999",
  "password": "Passw0rd!",
  "confirmPassword": "Passw0rd!"
}
```

**Sign In body**
```json
{ "loginId": "OIJODO20260001", "password": "Passw0rd!" }
```

---

## Employees — `/employees` (Admin/HR unless noted)

| Method | Endpoint                          | Access        | Description |
|--------|------------------------------------|---------------|--------------|
| GET    | `/`                                 | Admin/HR      | List employees — query: `search`, `department`, `page`, `limit` |
| POST   | `/`                                  | Admin/HR      | Create employee (auto login ID + temp password) |
| GET    | `/:id`                              | Auth          | Get a single employee record |
| PUT    | `/:id`                              | Admin/HR      | Update employee fields |
| DELETE | `/:id`                              | Admin/HR      | Delete employee (cascades) |
| POST   | `/:id/profile-picture`              | Auth          | Upload avatar (`multipart/form-data`, field `avatar`) |

**Create Employee body**
```json
{
  "firstName": "Aisha",
  "lastName": "Khan",
  "email": "aisha@company.com",
  "phone": "9998887777",
  "jobPosition": "Software Engineer",
  "department": "Engineering",
  "managerId": 1,
  "location": "Mumbai, India"
}
```

---

## Attendance — `/attendance`

| Method | Endpoint                              | Access    | Description |
|--------|-----------------------------------------|-----------|--------------|
| POST   | `/check-in`                             | Employee  | Marks check-in for today |
| POST   | `/check-out`                            | Employee  | Marks check-out; computes work/extra hours |
| GET    | `/today`                                | Employee  | Today's attendance record |
| GET    | `/me`                                   | Employee  | Own history — query: `from`, `to` |
| GET    | `/summary`                              | Employee  | Monthly status summary — query: `year`, `month` |
| GET    | `/company`                              | Admin/HR  | Company-wide attendance for a date — query: `date`, `search` |
| GET    | `/employee/:employeeId`                 | Admin/HR  | A specific employee's history |
| GET    | `/employee/:employeeId/summary`         | Admin/HR  | A specific employee's monthly summary |

---

## Leave — `/leave`

| Method | Endpoint             | Access    | Description |
|--------|------------------------|-----------|--------------|
| POST   | `/`                    | Employee  | Apply for leave |
| GET    | `/balance`             | Employee  | Paid/Sick leave balance |
| GET    | `/me`                  | Employee  | Own leave requests |
| GET    | `/company`             | Admin/HR  | All leave requests — query: `status` |
| PATCH  | `/:id/review`          | Admin/HR  | Approve/reject — body: `{ "status": "approved", "comment": "" }` |

**Apply Leave body**
```json
{
  "leaveType": "paid",
  "startDate": "2026-08-01",
  "endDate": "2026-08-02",
  "remarks": "Family function"
}
```

---

## Payroll — `/payroll`

| Method | Endpoint                          | Access    | Description |
|--------|-------------------------------------|-----------|--------------|
| GET    | `/me`                                | Employee  | Own salary structure (read-only) |
| GET    | `/me/slip`                           | Employee  | Own salary slip — query: `year`, `month` |
| GET    | `/employee/:employeeId`              | Admin/HR  | Any employee's salary structure |
| PUT    | `/employee/:employeeId`              | Admin/HR  | Update salary structure |
| GET    | `/employee/:employeeId/slip`         | Admin/HR  | Any employee's salary slip |

**Update Salary body**
```json
{
  "monthlyWage": 60000,
  "workingDaysPerWeek": 5,
  "breakHours": 1,
  "employeePfPercent": 12,
  "employerPfPercent": 12,
  "professionalTax": 200,
  "components": [
    { "componentName": "basic", "computationType": "percentage", "value": 50 },
    { "componentName": "hra", "computationType": "percentage", "value": 50 },
    { "componentName": "standard_allowance", "computationType": "percentage", "value": 16.67 },
    { "componentName": "performance_bonus", "computationType": "percentage", "value": 8.33 },
    { "componentName": "leave_travel_allowance", "computationType": "percentage", "value": 8.33 }
  ]
}
```
> `fixed_allowance` is computed automatically as the remainder of the wage.

---

## Profile — `/profile`

| Method | Endpoint                                     | Access    | Description |
|--------|------------------------------------------------|-----------|--------------|
| GET    | `/me`                                            | Employee  | Full profile (resume + private info + bank details) |
| PUT    | `/me/resume`                                     | Employee  | Update About/Skills/Certifications/Experience |
| PUT    | `/me/private-info`                               | Employee  | Update limited fields (address, personal email) |
| PUT    | `/me/bank-details`                               | Admin/HR  | Update bank details |
| GET    | `/employee/:employeeId`                          | Admin/HR  | Any employee's full profile |
| PUT    | `/employee/:employeeId/resume`                   | Admin/HR  | Update any employee's resume |
| PUT    | `/employee/:employeeId/private-info`             | Admin/HR  | Update any employee's private info (all fields) |
| PUT    | `/employee/:employeeId/bank-details`             | Admin/HR  | Update any employee's bank details |

---

## Dashboard — `/dashboard`

| Method | Endpoint     | Access    | Description |
|--------|---------------|-----------|--------------|
| GET    | `/employee`   | Employee  | Attendance today, leave balances, recent activity, notifications |
| GET    | `/admin`      | Admin/HR  | Company stats: headcount, present/on-leave today, pending leave, payroll total, department breakdown |

---

## Notifications — `/notifications`

| Method | Endpoint       | Access | Description |
|--------|-----------------|--------|--------------|
| GET    | `/`             | Auth   | Latest 30 notifications for the logged-in user |
| PATCH  | `/:id/read`     | Auth   | Marks a notification as read |

---

## Status Codes

| Code | Meaning |
|------|---------|
| 200  | OK |
| 201  | Created |
| 400  | Validation error |
| 401  | Missing/invalid/expired token |
| 403  | Insufficient role permissions |
| 404  | Resource not found |
| 409  | Duplicate entry (e.g. email already exists) |
| 500  | Internal server error |
