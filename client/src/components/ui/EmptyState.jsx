export default function EmptyState({ icon: Icon, title = 'Nothing here yet', description }) {
  return (
    <div className="text-center py-16 text-ink-400">
      {Icon && <Icon className="w-10 h-10 mx-auto mb-3 text-ink-300" />}
      <p className="font-medium text-ink-600">{title}</p>
      {description && <p className="text-sm mt-1">{description}</p>}
    </div>
  );
}
