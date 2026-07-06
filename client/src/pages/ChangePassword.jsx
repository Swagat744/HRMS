import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Lock, AlertCircle, KeyRound } from 'lucide-react';
import * as authService from '../services/authService';
import Input from '../components/ui/Input.jsx';
import Button from '../components/ui/Button.jsx';

export default function ChangePassword() {
  const [currentPassword, setCurrentPassword] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      await authService.changePassword({ currentPassword, newPassword });
      navigate('/signin');
    } catch (err) {
      setError(err.response?.data?.message || 'Could not change password');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="glass-card p-8">
      <div className="w-12 h-12 rounded-xl bg-primary-50 flex items-center justify-center mb-4">
        <KeyRound className="w-6 h-6 text-primary-600" />
      </div>
      <h2 className="text-2xl font-bold text-foreground mb-1">Set a new password</h2>
      <p className="text-sm text-muted-foreground mb-6">
        This is your first sign-in. Please replace your temporary password to continue.
      </p>
      <form onSubmit={handleSubmit}>
        <Input
          label="Temporary / Current Password"
          icon={Lock}
          type="password"
          value={currentPassword}
          onChange={(e) => setCurrentPassword(e.target.value)}
          required
        />
        <Input
          label="New Password"
          icon={Lock}
          type="password"
          value={newPassword}
          onChange={(e) => setNewPassword(e.target.value)}
          required
        />
        {error && (
          <div className="flex items-start gap-2 text-sm text-danger-700 bg-danger-50 border border-danger-100 rounded-xl px-3.5 py-3 mb-4">
            <AlertCircle className="w-4 h-4 mt-0.5 flex-shrink-0" />
            <span>{error}</span>
          </div>
        )}
        <Button type="submit" className="w-full" disabled={loading}>
          {loading ? 'Updating...' : 'Update Password'}
        </Button>
      </form>
    </div >
  );
}
