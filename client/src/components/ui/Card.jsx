export default function Card({
  className = '',
  padding = 'p-6',
  children,
  ...props
}) {
  return (
    <div
      className={`card ${padding} ${className}`.trim()}
      {...props}
    >
      {children}
    </div>
  );
}