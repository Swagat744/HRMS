export const ROLES = {
  ADMIN: 'admin',
  HR: 'hr',
  EMPLOYEE: 'employee',
};

export const ATTENDANCE_STATUS_COLORS = {
  present: 'bg-emerald-100 text-emerald-700',
  absent: 'bg-red-100 text-red-700',
  half_day: 'bg-amber-100 text-amber-700',
  leave: 'bg-blue-100 text-blue-700',
  late: 'bg-orange-100 text-orange-700',
};

export const LEAVE_STATUS_COLORS = {
  pending: 'bg-amber-100 text-amber-700',
  approved: 'bg-emerald-100 text-emerald-700',
  rejected: 'bg-red-100 text-red-700',
};

export const LEAVE_TYPES = [
  { value: 'paid', label: 'Paid Time Off' },
  { value: 'sick', label: 'Sick Leave' },
  { value: 'unpaid', label: 'Unpaid Leave' },
];
