import { useEffect, useRef } from 'react';

export default function Modal({
  open,
  onClose,
  title,
  children,
  footer,
}) {
  const modalRef = useRef(null);

  useEffect(() => {
    if (!open) return;

    const handleKeyDown = (e) => {
      if (e.key === 'Escape') {
        onClose?.();
      }
    };

    document.body.style.overflow = 'hidden';
    window.addEventListener('keydown', handleKeyDown);

    return () => {
      document.body.style.overflow = '';
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, [open, onClose]);

  if (!open) return null;

  const handleBackdropClick = (e) => {
    if (e.target === e.currentTarget) {
      onClose?.();
    }
  };

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center p-4 animate-fade-in bg-black/40 backdrop-blur-sm"
      onClick={handleBackdropClick}
    >
      <div
        ref={modalRef}
        role="dialog"
        aria-modal="true"
        aria-labelledby="modal-title"
        className="card w-full max-w-lg max-h-[90vh] overflow-y-auto animate-slide-up"
      >
        <div className="sticky top-0 flex items-center justify-between rounded-t-2xl border-b border-border bg-background px-6 py-4">
          <h3
            id="modal-title"
            className="text-lg font-semibold text-foreground"
          >
            {title}
          </h3>

          <button
            type="button"
            onClick={onClose}
            aria-label="Close modal"
            className="flex h-8 w-8 items-center justify-center rounded-lg text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
          >
            &times;
          </button>
        </div>

        <div className="p-6">
          {children}
        </div>

        {footer && (
          <div className="flex justify-end gap-2 border-t border-border px-6 py-4">
            {footer}
          </div>
        )}
      </div>
    </div>
  );
}