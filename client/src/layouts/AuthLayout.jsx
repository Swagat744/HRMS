import { Outlet } from 'react-router-dom';
import { CalendarCheck, ShieldCheck, Wallet, Users } from 'lucide-react';

const highlights = [
  { icon: Users, text: 'Manage your entire team from one clean dashboard' },
  { icon: CalendarCheck, text: 'Real-time attendance, check-in/out & leave tracking' },
  { icon: Wallet, text: 'Automated, transparent payroll for every employee' },
  { icon: ShieldCheck, text: 'Role-based access keeps sensitive data secure' },
];

export default function AuthLayout() {
  return (
    <div className="min-h-screen flex relative overflow-hidden">
      {/* ---------- Left: branded gradient panel with floating 3D orbs ---------- */}
      <div
        className="hidden lg:flex lg:w-1/2 relative overflow-hidden flex-col justify-between p-12 text-white"
        style={{ background: 'linear-gradient(160deg, #016E77 0%, #0A516D 55%, #063441 100%)' }}
      >
        {/* Floating glass orbs — the "3D" decorative elements */}
        <div className="orb w-80 h-80 -top-16 -left-16 bg-primary-400/40 animate-float-slow" />
        <div className="orb w-72 h-72 top-1/3 -right-20 bg-accent-500/35 animate-float" />
        <div className="orb w-56 h-56 bottom-10 left-10 bg-accent-300/25 animate-float-delayed" />
        <div className="orb w-40 h-40 bottom-1/4 right-1/4 bg-background/10 animate-float" />

        <div className="relative z-10 flex items-center gap-2.5">
          <div className="w-9 h-9 rounded-2xl bg-background/15 border border-white/20 flex items-center justify-center backdrop-blur-md shadow-glass">
            <ShieldCheck className="w-5 h-5" />
          </div>
          <span className="font-bold text-xl tracking-tight">HRMS</span>
        </div>

        <div className="relative z-10 max-w-md">
          <h1 className="text-4xl font-bold leading-tight mb-4">Every workday, perfectly aligned.</h1>
          <p className="text-white/80 text-base mb-10">
            One workspace for attendance, leave, payroll, and people — built for modern teams.
          </p>
          <div className="space-y-4">
            {highlights.map((h, i) => (
              <div
                key={i}
                className="flex items-center gap-3 bg-background/10 border border-white/15 rounded-2xl px-4 py-3 backdrop-blur-md"
              >
                <div className="w-9 h-9 rounded-xl bg-background/15 flex items-center justify-center flex-shrink-0">
                  <h.icon className="w-4.5 h-4.5" />
                </div>
                <p className="text-sm text-white/90">{h.text}</p>
              </div>
            ))}
          </div>
        </div>

        <p className="relative z-10 text-xs text-white/50">© 2026 HRMS. Built for modern workplaces.</p>
      </div>

      {/* ---------- Right: glass form panel over the ambient page background ---------- */}
      <div className="flex-1 flex items-center justify-center px-6 py-12 relative">
        <div className="orb w-72 h-72 top-10 right-10 bg-primary-200/50 animate-float-slow hidden lg:block" />
        <div className="orb w-56 h-56 bottom-16 left-8 bg-accent-200/40 animate-float hidden lg:block" />

        <div className="w-full max-w-md relative z-10">
          <div className="lg:hidden flex items-center justify-center gap-2.5 mb-8">
            <div
              className="w-9 h-9 rounded-2xl flex items-center justify-center"
              style={{ background: 'linear-gradient(135deg, #018790, #0A516D)' }}
            >
              <ShieldCheck className="w-5 h-5 text-white" />
            </div>
            <span className="font-bold text-xl text-foreground">HRMS</span>
          </div>
          <Outlet />
        </div>
      </div>
    </div>
  );
}
