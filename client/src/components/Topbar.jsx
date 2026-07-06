import { useEffect, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Bell,
  ChevronDown,
  LogOut,
  User,
  Sun,
  Moon,
  Monitor,
} from 'lucide-react';

import { useAuth } from '../context/AuthContext.jsx';
import { useTheme } from '../context/ThemeContext.jsx';

import Avatar from './ui/Avatar.jsx';
import * as dashboardService from '../services/dashboardService';

export default function Topbar({ title }) {
  const { user, logout, isAdmin } = useAuth();
  const { theme, setTheme } = useTheme();

  const [menuOpen, setMenuOpen] = useState(false);
  const [notifOpen, setNotifOpen] = useState(false);
  const [notifications, setNotifications] = useState([]);

  const navigate = useNavigate();

  const menuRef = useRef(null);
  const notifRef = useRef(null);

  useEffect(() => {
    if (!isAdmin) {
      dashboardService
        .getEmployeeDashboard()
        .then((res) =>
          setNotifications(res.data.notifications || [])
        )
        .catch(() => { });
    }
  }, [isAdmin]);

  useEffect(() => {
    const handler = (e) => {
      if (
        menuRef.current &&
        !menuRef.current.contains(e.target)
      ) {
        setMenuOpen(false);
      }

      if (
        notifRef.current &&
        !notifRef.current.contains(e.target)
      ) {
        setNotifOpen(false);
      }
    };

    document.addEventListener('mousedown', handler);

    return () =>
      document.removeEventListener('mousedown', handler);
  }, []);

  const handleLogout = async () => {
    await logout();
    navigate('/signin');
  };

  const name = `${user?.firstName || ''} ${user?.lastName || ''}`;

  return (
    <header className="sticky top-0 z-30 flex h-16 items-center justify-between border-b border-border bg-card/80 px-8 backdrop-blur-xl">

      <h1 className="text-xl font-semibold text-foreground">
        {title}
      </h1>

      <div className="flex items-center gap-3">

        {/* Theme Switcher */}

        <div className="flex items-center rounded-xl border border-border bg-background p-1 shadow-soft">

          <button
            onClick={() => setTheme('light')}
            className={`flex items-center gap-1 rounded-lg px-3 py-1.5 text-xs font-medium transition-all ${theme === 'light'
              ? 'bg-primary-600 text-white shadow'
              : 'text-muted-foreground hover:bg-muted'
              }`}
          >
            <Sun className="h-4 w-4" />
            <span className="hidden lg:inline">
              Light
            </span>
          </button>

          <button
            onClick={() => setTheme('system')}
            className={`flex items-center gap-1 rounded-lg px-3 py-1.5 text-xs font-medium transition-all ${theme === 'system'
              ? 'bg-primary-600 text-white shadow'
              : 'text-muted-foreground hover:bg-muted'
              }`}
          >
            <Monitor className="h-4 w-4" />
            <span className="hidden lg:inline">
              System
            </span>
          </button>

          <button
            onClick={() => setTheme('dark')}
            className={`flex items-center gap-1 rounded-lg px-3 py-1.5 text-xs font-medium transition-all ${theme === 'dark'
              ? 'bg-primary-600 text-white shadow'
              : 'text-muted-foreground hover:bg-muted'
              }`}
          >
            <Moon className="h-4 w-4" />
            <span className="hidden lg:inline">
              Dark
            </span>
          </button>

        </div>

        {/* Notifications */}

        <div
          className="relative"
          ref={notifRef}
        >
          <button
            onClick={() => setNotifOpen((v) => !v)}
            className="relative flex h-10 w-10 items-center justify-center rounded-xl text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
          >
            <Bell className="h-5 w-5" />

            {notifications.length > 0 && (
              <span className="absolute right-2 top-2 h-2 w-2 rounded-full bg-danger-500" />
            )}
          </button>

          {notifOpen && (
            <div className="absolute right-0 mt-3 w-80 overflow-hidden rounded-2xl border border-border bg-card shadow-popover animate-slide-up">

              <div className="border-b border-border px-4 py-3">

                <p className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                  Notifications
                </p>

              </div>

              {notifications.length === 0 ? (

                <div className="px-6 py-8 text-center text-sm text-muted-foreground">

                  You're all caught up 🎉

                </div>

              ) : (

                notifications.slice(0, 6).map((n) => (
                  <div
                    key={n.id}
                    className="border-b border-border px-4 py-3 last:border-0 hover:bg-muted transition-colors"
                  >
                    <p className="text-sm font-semibold text-foreground">
                      {n.title}
                    </p>

                    <p className="mt-1 text-xs text-muted-foreground">
                      {n.message}
                    </p>

                  </div>
                ))

              )}

            </div>
          )}

        </div>
        {/* Profile Menu */}

        <div
          className="relative"
          ref={menuRef}
        >
          <button
            onClick={() => setMenuOpen((v) => !v)}
            className="flex items-center gap-2 rounded-xl px-2 py-1.5 transition-colors hover:bg-muted"
          >
            <Avatar
              name={name}
              src={user?.profilePictureUrl}
              size={36}
            />

            <div className="hidden text-left md:block">
              <p className="text-sm font-semibold text-foreground">
                {name}
              </p>

              <p className="text-xs capitalize text-muted-foreground">
                {isAdmin ? "Administrator" : "Employee"}
              </p>
            </div>

            <ChevronDown
              className={`h-4 w-4 text-muted-foreground transition-transform ${menuOpen ? "rotate-180" : ""
                }`}
            />
          </button>

          {menuOpen && (
            <div className="absolute right-0 mt-3 w-60 overflow-hidden rounded-2xl border border-border bg-card shadow-popover animate-slide-up">

              <div className="border-b border-border px-5 py-4">

                <div className="flex items-center gap-3">

                  <Avatar
                    name={name}
                    src={user?.profilePictureUrl}
                    size={46}
                  />

                  <div>

                    <p className="font-semibold text-foreground">
                      {name}
                    </p>

                    <p className="text-xs text-muted-foreground">
                      {user?.email}
                    </p>

                  </div>

                </div>

              </div>

              <button
                onClick={() => {
                  setMenuOpen(false);
                  navigate("/profile");
                }}
                className="flex w-full items-center gap-3 px-5 py-3 text-sm text-foreground transition-colors hover:bg-muted"
              >
                <User className="h-4 w-4" />

                My Profile
              </button>

              <button
                onClick={handleLogout}
                className="flex w-full items-center gap-3 px-5 py-3 text-sm text-danger-600 transition-colors hover:bg-danger-50 dark:hover:bg-danger-900/20"
              >
                <LogOut className="h-4 w-4" />

                Log Out
              </button>

            </div>
          )}
        </div>

      </div>

    </header>
  );
}