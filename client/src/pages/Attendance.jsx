import { useEffect, useState } from 'react';
import {
  ChevronLeft,
  ChevronRight,
  Search,
  CalendarCheck,
} from 'lucide-react';

import * as attendanceService from '../services/attendanceService';
import { useAuth } from '../context/AuthContext.jsx';

import Table from '../components/ui/Table.jsx';
import Badge from '../components/ui/Badge.jsx';
import Loader from '../components/ui/Loader.jsx';

import { ATTENDANCE_STATUS_COLORS } from '../constants';
import { formatHoursMinutes } from '../utils/format';

function shiftDate(dateStr, days) {
  const d = new Date(dateStr);
  d.setDate(d.getDate() + days);
  return d.toISOString().slice(0, 10);
}

export default function Attendance() {
  const { isAdmin } = useAuth();

  const [records, setRecords] = useState([]);
  const [date, setDate] = useState(
    new Date().toISOString().slice(0, 10)
  );
  const [search, setSearch] = useState('');
  const [loading, setLoading] = useState(true);

  const load = async () => {
    setLoading(true);

    if (isAdmin) {
      const res =
        await attendanceService.getCompanyAttendance({
          date,
          search,
        });

      setRecords(res.data);
    } else {
      const res =
        await attendanceService.getMyHistory({});

      setRecords(res.data);
    }

    setLoading(false);
  };

  useEffect(() => {
    load();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [date]);

  const columns = [
    ...(isAdmin
      ? [
        {
          key: 'name',
          header: 'Employee',
          render: (r) =>
            `${r.first_name} ${r.last_name}`,
        },
      ]
      : [
        {
          key: 'work_date',
          header: 'Date',
        },
      ]),

    {
      key: 'check_in',
      header: 'Check In',
      render: (r) =>
        r.check_in
          ? new Date(r.check_in).toLocaleTimeString([], {
            hour: '2-digit',
            minute: '2-digit',
          })
          : '—',
    },

    {
      key: 'check_out',
      header: 'Check Out',
      render: (r) =>
        r.check_out
          ? new Date(r.check_out).toLocaleTimeString([], {
            hour: '2-digit',
            minute: '2-digit',
          })
          : '—',
    },

    {
      key: 'work_hours',
      header: 'Work Hours',
      render: (r) => formatHoursMinutes(r.work_hours),
    },

    {
      key: 'extra_hours',
      header: 'Extra Hours',
      render: (r) => formatHoursMinutes(r.extra_hours),
    },

    {
      key: 'status',
      header: 'Status',
      render: (r) => (
        <Badge className={ATTENDANCE_STATUS_COLORS[r.status]}>
          {r.status.replace('_', ' ')}
        </Badge>
      ),
    },
  ];

  return (
    <div className="space-y-6">

      {/* Header */}

      <div className="flex flex-wrap items-center justify-between gap-4">

        <div>

          <h2 className="text-2xl font-bold text-foreground">
            Attendance
          </h2>

          <p className="mt-1 text-sm text-muted-foreground">
            {isAdmin
              ? 'Company-wide daily attendance'
              : 'Your attendance history'}
          </p>

        </div>

        <div className="flex flex-wrap items-center gap-3">

          {isAdmin && (
            <div className="relative">

              <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />

              <input
                className="input-field w-56 pl-10"
                placeholder="Search employee..."
                value={search}
                onChange={(e) =>
                  setSearch(e.target.value)
                }
                onKeyDown={(e) =>
                  e.key === 'Enter' && load()
                }
              />

            </div>
          )}

          {isAdmin && (

            <div className="flex items-center rounded-xl border border-border bg-card px-2 py-1 shadow-soft transition-colors">

              <button
                onClick={() =>
                  setDate((d) => shiftDate(d, -1))
                }
                className="rounded-lg p-2 text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
              >
                <ChevronLeft className="h-4 w-4" />
              </button>

              <div className="relative flex items-center">

                <CalendarCheck className="pointer-events-none absolute left-3 h-4 w-4 text-muted-foreground" />

                <input
                  type="date"
                  value={date}
                  onChange={(e) =>
                    setDate(e.target.value)
                  }
                  className="rounded-lg bg-transparent py-2 pl-10 pr-2 text-sm text-foreground outline-none"
                />

              </div>

              <button
                onClick={() =>
                  setDate((d) => shiftDate(d, 1))
                }
                className="rounded-lg p-2 text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
              >
                <ChevronRight className="h-4 w-4" />
              </button>

            </div>

          )}
        </div>
      </div>

      {/* Attendance Table */}

      <div className="card overflow-hidden border border-border">

        <div className="pt-2">

          {loading ? (

            <Loader />

          ) : (

            <Table
              columns={columns}
              data={records}
              emptyText="No attendance records for this selection"
            />

          )}

        </div>

      </div>

    </div>
  );
}