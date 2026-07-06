import { useNavigate } from 'react-router-dom';
import { Plane } from 'lucide-react';
import Avatar from './ui/Avatar.jsx';

const statusDot = {
  present: 'bg-success-500',
  late: 'bg-warning-500',
  half_day: 'bg-warning-400',
  absent: 'bg-ink-300',
};

export default function EmployeeCard({ employee }) {
  const navigate = useNavigate();
  const name = `${employee.first_name} ${employee.last_name}`;
  const status = employee.today_status;

  return (
    <button
      onClick={() => navigate(`/employees/${employee.id}`)}
      className="card p-5 text-left hover:shadow-popover hover:-translate-y-0.5 transition-all duration-150 relative group"
    >
      <span className="absolute top-4 right-4" title={status || 'absent'}>
        {status === 'leave' ? (
          <Plane className="w-4 h-4 text-info-500" />
        ) : (
          <span className={`block w-2.5 h-2.5 rounded-full ${statusDot[status] || statusDot.absent}`} />
        )}
      </span>
      <Avatar name={name} src={employee.profile_picture_url} size={48} />
      <p className="mt-3 font-semibold text-foreground text-sm group-hover:text-primary-700 transition-colors">{name}</p>
      <p className="text-xs text-muted-foreground mt-0.5">{employee.job_position || 'Employee'}</p>
      <p className="text-[11px] text-ink-400 mt-2 font-mono">{employee.login_id}</p>
    </button>
  );
}
