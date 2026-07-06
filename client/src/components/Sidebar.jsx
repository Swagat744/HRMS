import { NavLink } from 'react-router-dom';
import {
  LayoutGrid,
  Users,
  CalendarCheck,
  Palmtree,
  Wallet,
  UserCircle,
  Building2,
} from 'lucide-react';
import { useAuth } from '../context/AuthContext.jsx';

export default function Sidebar() {
  const { isAdmin } = useAuth();

  const links = [
    {
      to: isAdmin ? '/admin' : '/employee',
      label: 'Dashboard',
      icon: LayoutGrid,
      end: true,
    },
    ...(isAdmin
      ? [{ to: '/employees', label: 'Employees', icon: Users }]
      : []),
    { to: '/attendance', label: 'Attendance', icon: CalendarCheck },
    { to: '/leave', label: 'Time Off', icon: Palmtree },
    { to: '/payroll', label: 'Payroll', icon: Wallet },
    { to: '/profile', label: 'My Profile', icon: UserCircle },
  ];

  return (
    <aside className="sticky top-0 flex h-screen w-64 flex-shrink-0 flex-col border-r border-border bg-background/80 backdrop-blur-xl transition-colors">
      {/* Logo */}
      <div className="flex h-16 items-center gap-3 border-b border-border px-6">
        <div
          className="flex h-10 w-10 items-center justify-center rounded-xl shadow-glow"
          style={{
            background: 'linear-gradient(135deg, #018790 0%, #0A516D 100%)',
          }}
        >
          <Building2 className="h-5 w-5 text-white" strokeWidth={2.4} />
        </div>

        <span className="text-lg font-bold tracking-tight text-foreground">
          HRMS
        </span>
      </div>

      {/* Navigation */}
      <nav className="flex-1 space-y-1 overflow-y-auto px-3 py-5">
        {links.map((link) => (
          <NavLink
            key={link.to}
            to={link.to}
            end={link.end}
            className={({ isActive }) =>
              `nav-link ${isActive ? 'nav-link-active' : 'nav-link-inactive'
              }`
            }
          >
            <link.icon
              className="h-[18px] w-[18px] flex-shrink-0"
              strokeWidth={2}
            />

            <span>{link.label}</span>
          </NavLink>
        ))}
      </nav>

      {/* Bottom Card */}
      <div className="border-t border-border p-4">
        <div className="rounded-2xl border border-accent-200/40 bg-gradient-to-br from-accent-50 to-primary-50 p-4 dark:from-accent-900/20 dark:to-primary-900/20 dark:border-accent-800/40 transition-colors">
          <p className="text-xs font-semibold text-accent-700 dark:text-accent-300">
            {isAdmin ? 'Admin Portal' : 'Employee Portal'}
          </p>

          <p className="mt-1 text-xs text-muted-foreground">
            {isAdmin
              ? 'Full workspace access'
              : 'View your workspace'}
          </p>
        </div>
      </div>
    </aside>
  );
}