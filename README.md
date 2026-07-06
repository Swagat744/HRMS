# HRMS — Human Resource Management System

*Every workday, perfectly aligned.*

A full-stack HRMS built for a hackathon: React (Vite) + Tailwind CSS frontend,
Node.js/Express backend, and MySQL database — following a strict
**Route → Controller → Service → Database** architecture.

---

## Features

- **Authentication & Authorization** — company sign-up, JWT sign-in, email
  verification tokens, forced password change on first login, password
  reset flow, role-based access (`admin` / `hr` / `employee`).
- **Auto-generated Login IDs** — format `[CompanyPrefix][Initials][JoiningYear][RunningNumber]`
  (e.g. `OIJODO20260001`), with an auto-generated temporary password for
  every employee created by HR/Admin.
- **Employee Management** — create, update, delete, search, filter, and
  upload profile pictures.
- **Employee Profile** — Resume (about, skills, certifications,
  experience), Private Information (DOB, address, bank details, PAN, UAN),
  Salary Info (Admin-only), Security (account status, last login).
- **Attendance** — check-in / check-out, daily/weekly/monthly views,
  automatic work-hours & extra-hours calculation, status indicators
  (present, absent, half-day, leave, late).
- **Leave & Time-Off** — apply for paid/sick/unpaid leave, monthly calendar
  view, admin approve/reject workflow that immediately updates attendance
  records.
- **Payroll** — configurable salary components (Basic, HRA, Standard
  Allowance, Performance Bonus, LTA, Fixed Allowance) computed
  automatically from wage percentages, PF & professional tax deductions,
  and a salary slip generator where absent days reduce payable salary.
- **Dashboards** — separate Employee and Admin/HR dashboards with quick
  links, recent activity, notifications, and company-wide statistics.
- **Design** — a sidebar-based enterprise SaaS layout (in the style of
  Linear/Notion/Vercel dashboards), a split-screen branded sign-in/sign-up
  experience with an Admin/Employee portal toggle, and a consistent
  component design system (cards, badges, tables, modals) built on Tailwind.

---

## Tech Stack

| Layer     | Technology                                                        |
|-----------|--------------------------------------------------------------------|
| Frontend  | React (Vite), Tailwind CSS, React Router DOM, Axios, Context API   |
| Backend   | Node.js, Express.js, JWT, bcryptjs, mysql2, Helmet, Morgan, CORS   |
| Database  | MySQL (relational schema with PK/FK constraints & indexes)         |

---

## Project Structure

```
HRMS/
├── client/                # React frontend
│   └── src/
│       ├── components/    # Reusable UI + feature components
│       ├── context/       # AuthContext (Context API)
│       ├── layouts/       # Auth / Main layouts
│       ├── pages/         # Route-level pages
│       ├── routes/        # AppRoutes, ProtectedRoute
│       └── services/      # Axios API clients
├── server/                # Express backend
│   ├── config/            # MySQL pool
│   ├── controllers/       # Thin HTTP layer
│   ├── services/          # Business logic
│   ├── routes/            # REST route definitions
│   ├── middleware/        # auth, roleCheck, error handler, upload
│   ├── validators/        # Request validation
│   └── utils/             # JWT, ID/password generators, ApiError
├── database/
│   ├── schema.sql         # Full relational schema
│   └── seed.sql           # Seed data (default admin account)
└── docs/
    └── API.md             # REST API reference
```

---

## Getting Started

### 1. Database

```bash
mysql -u root -p < database/schema.sql
mysql -u root -p < database/seed.sql
```

This seeds a **realistic dataset** so the app looks and behaves like a real
company from the first login — no mock/hardcoded data anywhere in the
frontend, everything you see is fetched from MySQL:

- 1 company, 1 Admin, 1 HR Officer, and **36 employees** across 8 departments
  (Engineering, HR, Sales, Marketing, Finance, Design, Operations, Support)
- **~460 real attendance records** over the last 12 days (present/late/half-day/absent)
- **18 sample leave requests** in pending/approved/rejected states
- Full resumes, private info, bank details, and salary structures for every employee

**Default login credentials:**

| Role  | Login ID / Email | Password |
|-------|-------------------|----------|
| Admin | `admin@hrms.com` | `Admin@123` |
| HR    | `hr.officer@company.com` | `Hr@12345` |
| Employees (all 36) | see `docs/SEED_CREDENTIALS.md` | `Welcome@123` (forces password change on first login) |

### 2. Backend

```bash
cd server
cp .env.example .env       # then edit DB credentials & JWT_SECRET
npm install
npm run dev                # http://localhost:5000
```

### 3. Frontend

```bash
cd client
cp .env.example .env       # defaults already point to localhost:5000
npm install
npm run dev                # http://localhost:5173
```

Sign in with the default admin account above, or use **Sign Up** to
register a brand-new company (this creates its first Admin/HR account).
Admins then create employee accounts from **Employees → New Employee**,
which auto-generates each employee's login ID and temporary password.

---

## Business Rules Implemented

- Regular employees cannot self-register; only Admin/HR can create
  employee accounts (Sign Up creates a new **company + its first admin**).
- Every new employee gets a system-generated Login ID and temporary
  password; `is_temp_password` forces a password change on first sign-in.
- The **Salary Info** tab is visible only to Admin/HR; employees see a
  read-only payroll view.
- Salary components are calculated automatically as a percentage of the
  monthly wage; `fixed_allowance` absorbs the remainder so components
  always sum to the wage.
- Approved leave requests automatically mark the corresponding attendance
  days as `leave`, and absent/half days reduce the employee's payable
  salary days in the slip calculation.
- Employees may edit only limited profile fields (e.g. address); Admin/HR
  can edit all fields.
- The Admin/Employee toggle on the sign-in screen is a UI convenience
  (adjusts placeholder text) — actual role and access are always
  determined server-side from the account's credentials, never from the
  toggle itself.

See `docs/API.md` for the full REST API reference.
