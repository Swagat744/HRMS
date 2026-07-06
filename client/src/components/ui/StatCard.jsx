export default function StatCard({ label, value, icon: Icon, tint = 'primary' }) {
  const tints = {
    primary: 'bg-primary-50 text-primary-600',
    success: 'bg-success-50 text-success-600',
    warning: 'bg-warning-50 text-warning-600',
    info: 'bg-info-50 text-info-600',
    danger: 'bg-danger-50 text-danger-600',
  };
  return (
    <div className="card p-5 flex items-start justify-between">
      <div>
        <p className="text-xs font-semibold uppercase tracking-wide text-ink-400">{label}</p>
        <p className="text-2xl font-bold text-foreground mt-1.5">{value}</p>
      </div>
      {Icon && (
        <div className={`w-10 h-10 rounded-xl flex items-center justify-center ${tints[tint]}`}>
          <Icon className="w-5 h-5" />
        </div>
      )}
    </div>
  );
}
