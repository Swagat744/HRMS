import { Routes, Route, Navigate } from 'react-router-dom';
import AuthLayout from '../layouts/AuthLayout.jsx';
import MainLayout from '../layouts/MainLayout.jsx';
import ProtectedRoute from './ProtectedRoute.jsx';

import SignIn from '../pages/SignIn.jsx';
import SignUp from '../pages/SignUp.jsx';
import ChangePassword from '../pages/ChangePassword.jsx';
import EmployeeDashboard from '../pages/EmployeeDashboard.jsx';
import AdminDashboard from '../pages/AdminDashboard.jsx';
import Employees from '../pages/Employees.jsx';
import EmployeeDetail from '../pages/EmployeeDetail.jsx';
import Profile from '../pages/Profile.jsx';
import Attendance from '../pages/Attendance.jsx';
import Leave from '../pages/Leave.jsx';
import Payroll from '../pages/Payroll.jsx';

export default function AppRoutes() {
  return (
    <Routes>
      <Route element={<AuthLayout />}>
        <Route path="/signin" element={<SignIn />} />
        <Route path="/signup" element={<SignUp />} />
        <Route path="/change-password" element={<ChangePassword />} />
      </Route>

      <Route element={<ProtectedRoute />}>
        <Route element={<MainLayout />}>
          <Route path="/employee" element={<EmployeeDashboard />} />
          <Route path="/profile" element={<Profile />} />
          <Route path="/attendance" element={<Attendance />} />
          <Route path="/leave" element={<Leave />} />
          <Route path="/payroll" element={<Payroll />} />
        </Route>
      </Route>

      <Route element={<ProtectedRoute adminOnly />}>
        <Route element={<MainLayout />}>
          <Route path="/admin" element={<AdminDashboard />} />
          <Route path="/employees" element={<Employees />} />
          <Route path="/employees/:id" element={<EmployeeDetail />} />
        </Route>
      </Route>

      <Route path="/" element={<Navigate to="/signin" replace />} />
      <Route path="*" element={<Navigate to="/signin" replace />} />
    </Routes>
  );
}
