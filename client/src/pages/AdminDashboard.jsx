import { useEffect, useState } from 'react';
import {
  Users,
  UserCheck,
  Palmtree,
  ClipboardList,
  Wallet,
  Activity,
} from 'lucide-react';

import * as dashboardService from '../services/dashboardService';

import Card from '../components/ui/Card.jsx';
import StatCard from '../components/ui/StatCard.jsx';
import Loader from '../components/ui/Loader.jsx';
import EmptyState from '../components/ui/EmptyState.jsx';

export default function AdminDashboard() {
  const [data, setData] = useState(null);

  useEffect(() => {
    dashboardService
      .getAdminDashboard()
      .then((res) => setData(res.data));
  }, []);

  if (!data) return <Loader />;

  const maxDept = Math.max(
    ...data.departmentBreakdown.map((d) => d.count),
    1
  );

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <h2 className="text-2xl font-bold text-foreground">
          Company Overview
        </h2>

        <p className="mt-1 text-sm text-muted-foreground">
          Real-time snapshot of your organization.
        </p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-2 gap-4 md:grid-cols-5">
        <StatCard
          label="Total Employees"
          value={data.totalEmployees}
          icon={Users}
          tint="primary"
        />

        <StatCard
          label="Present Today"
          value={data.presentToday}
          icon={UserCheck}
          tint="success"
        />

        <StatCard
          label="On Leave Today"
          value={data.onLeaveToday}
          icon={Palmtree}
          tint="info"
        />

        <StatCard
          label="Pending Requests"
          value={data.pendingLeaveRequests}
          icon={ClipboardList}
          tint="warning"
        />

        <StatCard
          label="Monthly Payroll"
          value={`₹${Number(data.totalMonthlyPayroll).toLocaleString(
            'en-IN'
          )}`}
          icon={Wallet}
          tint="danger"
        />
      </div>

      {/* Bottom Grid */}
      <div className="grid grid-cols-1 gap-6 md:grid-cols-2">
        {/* Department Breakdown */}
        <Card>
          <h3 className="mb-4 text-lg font-semibold text-foreground">
            Department Breakdown
          </h3>

          {data.departmentBreakdown.length === 0 ? (
            <EmptyState title="No department data" />
          ) : (
            <div className="space-y-4">
              {data.departmentBreakdown.map((d, i) => (
                <div key={i}>
                  <div className="mb-2 flex items-center justify-between text-sm">
                    <span className="text-muted-foreground">
                      {d.department || 'Unassigned'}
                    </span>

                    <span className="font-semibold text-foreground">
                      {d.count}
                    </span>
                  </div>

                  <div className="h-2 overflow-hidden rounded-full bg-muted">
                    <div
                      className="h-full rounded-full bg-gradient-to-r from-primary-500 via-primary-600 to-deep-500 transition-all duration-500"
                      style={{
                        width: `${(d.count / maxDept) * 100}%`,
                      }}
                    />
                  </div>
                </div>
              ))}
            </div>
          )}
        </Card>

        {/* Recent Activity */}
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
                  <p className="text-sm font-medium text-foreground">
                    {a.action.replace(/_/g, ' ')}
                  </p>

                  {a.details && (
                    <p className="mt-1 text-sm text-muted-foreground">
                      {a.details}
                    </p>
                  )}

                  <p className="mt-1 text-xs text-muted-foreground">
                    {new Date(a.created_at).toLocaleString()}
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