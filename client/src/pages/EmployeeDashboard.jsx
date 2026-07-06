import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {
  UserCircle,
  CalendarCheck,
  Palmtree,
  Wallet,
  LogIn,
  LogOut,
  Bell,
  Activity,
} from 'lucide-react';

import * as dashboardService from '../services/dashboardService';
import * as attendanceService from '../services/attendanceService';

import Card from '../components/ui/Card.jsx';
import Button from '../components/ui/Button.jsx';
import Loader from '../components/ui/Loader.jsx';
import EmptyState from '../components/ui/EmptyState.jsx';

import { useAuth } from '../context/AuthContext.jsx';
import { formatHoursMinutes } from '../utils/format';

export default function EmployeeDashboard() {
  const { user } = useAuth();

  const [data, setData] = useState(null);
  const [today, setToday] = useState(null);
  const [loading, setLoading] = useState(true);
  const [actionLoading, setActionLoading] = useState(false);

  const load = async () => {
    const [dashRes, todayRes] = await Promise.all([
      dashboardService.getEmployeeDashboard(),
      attendanceService.getToday(),
    ]);

    setData(dashRes.data);
    setToday(todayRes.data);
    setLoading(false);
  };

  useEffect(() => {
    load();
  }, []);

  const handleCheckIn = async () => {
    setActionLoading(true);

    try {
      await attendanceService.checkIn();
      await load();
    } finally {
      setActionLoading(false);
    }
  };

  const handleCheckOut = async () => {
    setActionLoading(true);

    try {
      await attendanceService.checkOut();
      await load();
    } finally {
      setActionLoading(false);
    }
  };

  if (loading) return <Loader />;

  const quickLinks = [
    {
      to: '/profile',
      label: 'Profile',
      icon: UserCircle,
      tint: 'bg-primary-50 text-primary-700',
    },
    {
      to: '/attendance',
      label: 'Attendance',
      icon: CalendarCheck,
      tint: 'bg-info-50 text-info-700',
    },
    {
      to: '/leave',
      label: 'Leave Requests',
      icon: Palmtree,
      tint: 'bg-success-50 text-success-700',
    },
    {
      to: '/payroll',
      label: 'Payroll',
      icon: Wallet,
      tint: 'bg-warning-50 text-warning-700',
    },
  ];

  return (
    <div className="space-y-6">
      {/* Header */}

      <div>
        <h2 className="text-2xl font-bold text-foreground">
          Welcome back, {user?.firstName} 👋
        </h2>

        <p className="mt-1 text-sm text-muted-foreground">
          Here's what's happening today.
        </p>
      </div>

      {/* Quick Links */}

      <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
        {quickLinks.map((link) => (
          <Link key={link.to} to={link.to}>
            <div className="card p-5 transition-all duration-300 hover:-translate-y-1 hover:shadow-popover">
              <div
                className={`mb-3 flex h-10 w-10 items-center justify-center rounded-xl ${link.tint}`}
              >
                <link.icon className="h-5 w-5" />
              </div>

              <p className="text-sm font-semibold text-foreground">
                {link.label}
              </p>
            </div>
          </Link>
        ))}
      </div>

      {/* Attendance */}

      <Card>
        <h3 className="mb-4 flex items-center gap-2 text-lg font-semibold text-foreground">
          <CalendarCheck className="h-5 w-5 text-muted-foreground" />
          Today's Attendance
        </h3>

        {today?.check_in && today?.check_out ? (
          <div className="rounded-xl border border-success-500/30 bg-success-50 px-4 py-3 text-success-700 dark:border-success-700/40 dark:bg-success-950/60 dark:text-success-100">
            You worked{' '}
            <span className="font-semibold">
              {formatHoursMinutes(today.work_hours)}
            </span>{' '}
            today (
            {new Date(today.check_in).toLocaleTimeString()} –{' '}
            {new Date(today.check_out).toLocaleTimeString()})
          </div>
        ) : today?.check_in ? (
          <div className="flex items-center justify-between rounded-xl border border-info-500/20 bg-info-50 px-4 py-3 dark:bg-info-500/10">
            <p className="text-sm text-info-700 dark:text-info-300">
              Checked in since{' '}
              <span className="font-semibold">
                {new Date(today.check_in).toLocaleTimeString()}
              </span>
            </p>

            <Button
              onClick={handleCheckOut}
              disabled={actionLoading}
            >
              <LogOut className="h-4 w-4" />
              Check Out
            </Button>
          </div>
        ) : (
          <div className="flex items-center justify-between rounded-xl border border-border bg-muted px-4 py-3">
            <p className="text-sm text-muted-foreground">
              You haven't checked in yet.
            </p>

            <Button
              onClick={handleCheckIn}
              disabled={actionLoading}
            >
              <LogIn className="h-4 w-4" />
              Check In
            </Button>
          </div>
        )}
      </Card>

      {/* Bottom */}

      <div className="grid grid-cols-1 gap-6 md:grid-cols-2">
        <Card>
          <h3 className="mb-4 flex items-center gap-2 text-lg font-semibold text-foreground">
            <Activity className="h-5 w-5 text-muted-foreground" />
            Recent Activity
          </h3>

          {data.recentActivity.length === 0 ? (
            <EmptyState title="No recent activity" />
          ) : (
            <ul className="max-h-72 space-y-3 overflow-y-auto">
              {data.recentActivity.map((a, i) => (
                <li
                  key={i}
                  className="border-b border-border pb-3 last:border-0"
                >
                  <span className="font-medium text-foreground">
                    {a.action.replace(/_/g, ' ')}
                  </span>

                  {a.details && (
                    <span className="text-muted-foreground">
                      {' '}
                      - {a.details}
                    </span>
                  )}

                  <div className="mt-1 text-xs text-muted-foreground">
                    {new Date(a.created_at).toLocaleString()}
                  </div>
                </li>
              ))}
            </ul>
          )}
        </Card>

        <Card>
          <h3 className="mb-4 flex items-center gap-2 text-lg font-semibold text-foreground">
            <Bell className="h-5 w-5 text-muted-foreground" />
            Notifications
          </h3>

          {data.notifications.length === 0 ? (
            <EmptyState title="No new notifications" />
          ) : (
            <ul className="max-h-72 space-y-3 overflow-y-auto">
              {data.notifications.map((n) => (
                <li
                  key={n.id}
                  className="border-b border-border pb-3 last:border-0"
                >
                  <p className="font-medium text-foreground">
                    {n.title}
                  </p>

                  <p className="text-muted-foreground">
                    {n.message}
                  </p>
                </li>
              ))}
            </ul>
          )}
        </Card>
      </div>
    </div>
  );
}