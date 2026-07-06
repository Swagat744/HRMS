import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Mail, Lock, ShieldCheck, User, AlertCircle } from 'lucide-react';
import { useAuth } from '../context/AuthContext.jsx';
import Input from '../components/ui/Input.jsx';
import Button from '../components/ui/Button.jsx';

export default function SignIn() {
  const [portal, setPortal] = useState('admin'); // UI-only toggle; actual role is determined by the server from credentials
  const [loginId, setLoginId] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const { login } = useAuth();
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      const user = await login(loginId, password);
      if (user.forcePasswordChange) {
        navigate('/change-password');
      } else if (user.role === 'admin' || user.role === 'hr') {
        navigate('/admin');
      } else {
        navigate('/employee');
      }
    } catch (err) {
      setError(err.response?.data?.message || 'We could not sign you in with those credentials.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="glass-card p-8">
      <h2 className="text-2xl font-bold text-foreground mb-1">Welcome back</h2>
      <p className="text-sm text-muted-foreground mb-6">Sign in to continue to your workspace.</p>

      <div className="grid grid-cols-2 gap-2 p-1 bg-background/40 border border-white/50 backdrop-blur rounded-xl mb-6">
        <button
          type="button"
          onClick={() => setPortal('admin')}
          className={`flex items-center justify-center gap-2 py-2 rounded-lg text-sm font-semibold transition-all ${portal === 'admin' ? 'bg-background text-primary-700 shadow-sm' : 'text-muted-foreground'
            }`}
        >
          <ShieldCheck className="w-4 h-4" /> Admin
        </button>
        <button
          type="button"
          onClick={() => setPortal('employee')}
          className={`flex items-center justify-center gap-2 py-2 rounded-lg text-sm font-semibold transition-all ${portal === 'employee' ? 'bg-background text-primary-700 shadow-sm' : 'text-muted-foreground'
            }`}
        >
          <User className="w-4 h-4" /> Employee
        </button>
      </div>

      <form onSubmit={handleSubmit}>
        <Input
          label="Login ID / Email"
          icon={Mail}
          value={loginId}
          onChange={(e) => setLoginId(e.target.value)}
          placeholder={portal === 'admin' ? 'admin@yourcompany.com' : 'e.g. OIJODO20260001'}
          required
        />
        <Input
          label="Password"
          icon={Lock}
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="••••••••"
          required
        />

        {error && (
          <div className="flex items-start gap-2 text-sm text-danger-700 bg-danger-50 border border-danger-100 rounded-xl px-3.5 py-3 mb-4">
            <AlertCircle className="w-4 h-4 mt-0.5 flex-shrink-0" />
            <span>{error}</span>
          </div>
        )}

        <Button type="submit" className="w-full" disabled={loading}>
          {loading ? 'Signing in...' : 'Sign In'}
        </Button>
      </form>

      {portal === 'admin' ? (
        <p className="text-center text-sm text-muted-foreground mt-6">
          Setting up your company for the first time?{' '}
          <Link to="/signup" className="text-primary-600 font-semibold hover:text-primary-700">
            Sign Up
          </Link>
        </p>
      ) : (
        <p className="text-center text-sm text-muted-foreground mt-6">
          Don't have a login ID? Ask your HR/Admin to create your account.
        </p>
      )}
    </div>
  );
}
