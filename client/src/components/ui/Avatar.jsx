const palette = ['#4F46E5', '#0EA5E9', '#F59E0B', '#10B981', '#EC4899', '#8B5CF6'];

function colorFor(name) {
  let hash = 0;
  for (let i = 0; i < name.length; i++) hash = name.charCodeAt(i) + ((hash << 5) - hash);
  return palette[Math.abs(hash) % palette.length];
}

export default function Avatar({ name = '', src, size = 40 }) {
  const initials = name
    .split(' ')
    .filter(Boolean)
    .map((n) => n[0])
    .join('')
    .substring(0, 2)
    .toUpperCase();

  if (src) {
    return (
      <img
        src={src.startsWith('http') ? src : src}
        alt={name}
        style={{ width: size, height: size }}
        className="rounded-full object-cover border border-ink-200 flex-shrink-0"
      />
    );
  }
  return (
    <div
      style={{ width: size, height: size, backgroundColor: colorFor(name || '?') }}
      className="rounded-full text-white flex items-center justify-center font-semibold flex-shrink-0"
    >
      <span style={{ fontSize: size * 0.38 }}>{initials || '?'}</span>
    </div>
  );
}
