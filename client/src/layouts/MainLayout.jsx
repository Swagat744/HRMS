import { Outlet, useLocation } from 'react-router-dom';
import Sidebar from '../components/Sidebar.jsx';
import Topbar from '../components/Topbar.jsx';

const TITLES = {
  '/admin': 'Company Overview',
  '/employee': 'Dashboard',
  '/employees': 'Employee Directory',
  '/attendance': 'Attendance',
  '/leave': 'Time Off',
  '/payroll': 'Payroll',
  '/profile': 'My Profile',
};

function resolveTitle(pathname) {
  if (TITLES[pathname]) return TITLES[pathname];
  if (pathname.startsWith('/employees/')) return 'Employee Profile';
  return 'HRMS';
}

export default function MainLayout() {
  const location = useLocation();

  return (
    <div className="min-h-screen flex">
      <Sidebar />
      <div className="flex-1 min-w-0">
        <Topbar title={resolveTitle(location.pathname)} />
        <main className="max-w-7xl mx-auto px-8 py-8 animate-fade-in">
          <Outlet />
        </main>
      </div>
    </div>
  );
}
