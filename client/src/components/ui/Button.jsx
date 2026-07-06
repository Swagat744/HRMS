import { forwardRef } from 'react';

const Button = forwardRef(
  (
    {
      variant = 'primary',
      type = 'button',
      className = '',
      children,
      ...props
    },
    ref
  ) => {
    const variants = {
      primary: 'btn-primary',
      secondary: 'btn-secondary',
      accent: 'btn-accent',
      danger: 'btn-danger',
      ghost: 'btn-ghost',
    };

    return (
      <button
        ref={ref}
        type={type}
        className={`${variants[variant] ?? variants.primary} ${className}`.trim()}
        {...props}
      >
        {children}
      </button>
    );
  }
);

Button.displayName = 'Button';

export default Button;