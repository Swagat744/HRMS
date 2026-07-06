import { useId, useState } from 'react';
import { Eye, EyeOff } from 'lucide-react';

export default function Input({
  label,
  error,
  icon: Icon,
  className = '',
  type = 'text',
  id,
  ...props
}) {
  const generatedId = useId();
  const inputId = id || generatedId;

  const [showPassword, setShowPassword] = useState(false);

  const isPassword = type === 'password';
  const resolvedType = isPassword
    ? showPassword
      ? 'text'
      : 'password'
    : type;

  return (
    <div className="mb-4">
      {label && (
        <label htmlFor={inputId} className="label">
          {label}
        </label>
      )}

      <div className="relative">
        {Icon && (
          <Icon
            className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground pointer-events-none"
          />
        )}

        <input
          id={inputId}
          type={resolvedType}
          className={`input-field ${Icon ? '!pl-10' : ''} ${isPassword ? '!pr-10' : ''
            } ${className}`}
          {...props}
        />

        {isPassword && (
          <button
            type="button"
            tabIndex={-1}
            aria-label={showPassword ? 'Hide password' : 'Show password'}
            onClick={() => setShowPassword((prev) => !prev)}
            className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground transition-colors"
          >
            {showPassword ? (
              <EyeOff className="h-4 w-4" />
            ) : (
              <Eye className="h-4 w-4" />
            )}
          </button>
        )}
      </div>

      {error && (
        <p className="mt-1 text-xs text-danger-600">
          {error}
        </p>
      )}
    </div>
  );
}