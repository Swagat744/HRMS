export default function Loader({ label = 'Loading...' }) {
  return (
    <div className="flex flex-col items-center justify-center py-20 text-ink-400 gap-3">
      <span className="w-6 h-6 border-2 border-ink-200 border-t-primary-600 rounded-full animate-spin" />
      <span className="text-sm">{label}</span>
    </div>
  );
}
