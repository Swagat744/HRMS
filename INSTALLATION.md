# Installation Guide

## Prerequisites
- Node.js 18+
- MySQL 8.0+ (recommended) or MariaDB 10.5+

## 1. Set up the database
```bash
mysql -u root -p < database/schema.sql
mysql -u root -p < database/seed.sql
```
This loads a realistic dataset: 1 company, 1 Admin, 1 HR Officer, 36
employees across 8 departments, ~460 attendance records, and 18 sample
leave requests. See `docs/SEED_CREDENTIALS.md` for every employee's login ID.

## 2. Backend
```bash
cd server
cp .env.example .env
# edit .env: set DB_PASSWORD to your MySQL password, and a strong JWT_SECRET
npm install
npm run dev
```
Server runs at http://localhost:5000 — check http://localhost:5000/api/health

## 3. Frontend
```bash
cd client
cp .env.example .env
npm install
npm run dev
```
App runs at http://localhost:5173

## 4. Log in

| Role  | Login ID / Email | Password |
|-------|-------------------|----------|
| Admin | `admin@hrms.com` | `Admin@123` |
| HR    | `hr.officer@company.com` | `Hr@12345` |
| Any seeded employee | see `docs/SEED_CREDENTIALS.md` | `Welcome@123` |

Employees signing in with the shared temporary password will be prompted
to set a new one immediately (this is enforced by the backend, not just
the UI).

From the Admin/HR account, use **Employees → New Employee** to create more
staff — each gets a freshly auto-generated Login ID and temporary password
shown once on screen.

## Troubleshooting
- **`ECONNREFUSED 127.0.0.1:3306`** — MySQL isn't running, or `DB_HOST`/`DB_PORT` in `.env` are wrong.
- **`Access denied for user 'root'@'localhost'`** — `DB_PASSWORD` in `.env` doesn't match your actual MySQL root password.
- **"Sign in failed" with correct credentials** — almost always means the backend isn't actually running (check the terminal running `npm run dev` in `server/` for a crash). The frontend can't distinguish "wrong password" from "server unreachable" and shows a generic message either way.
- **CORS errors in the browser** — make sure `CLIENT_URL` in `server/.env` matches the URL you're loading the frontend from.
- **Blank page after clicking into a profile** — make sure you're on the latest code; earlier drafts of this project had a JSON-parsing bug here that's now fixed defensively for both MySQL and MariaDB.
