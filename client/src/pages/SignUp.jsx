import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Building2, Mail, Phone, Lock, User, CheckCircle2, AlertCircle } from 'lucide-react';
import { useAuth } from '../context/AuthContext.jsx';
import Input from '../components/ui/Input.jsx';
import Button from '../components/ui/Button.jsx';

export default function SignUp() {
  const [form, setForm] = useState({
    companyName: '',
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    password: '',
    confirmPassword: '',
  });
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [loading, setLoading] = useState(false);
  const { register } = useAuth();
  const navigate = useNavigate();

  const update = (field) => (e) => setForm({ ...form, [field]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      await register(form);
      setSuccess('Account created! Please check your email to verify your account, then sign in.');
      setTimeout(() => navigate('/signin'), 2500);
    } catch (err) {
      setError(err.response?.data?.message || 'We could not create your account.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="glass-card p-8">
      <h2 className="text-2xl font-bold text-foreground mb-1">Set up your company</h2>
      <p className="text-sm text-muted-foreground mb-6">Creates your workspace and your Admin account.</p>

      <form onSubmit={handleSubmit}>
        <Input label="Company Name" icon={Building2} value={form.companyName} onChange={update('companyName')} required />
        <div className="grid grid-cols-2 gap-3">
          <Input label="First Name" icon={User} value={form.firstName} onChange={update('firstName')} required />
          <Input label="Last Name" value={form.lastName} onChange={update('lastName')} required />
        </div>
        <Input label="Email" icon={Mail} type="email" value={form.email} onChange={update('email')} required />
        <Input label="Phone" icon={Phone} value={form.phone} onChange={update('phone')} required />
        <Input label="Password" icon={Lock} type="password" value={form.password} onChange={update('password')} required />
        <Input
          label="Confirm Password"
          icon={Lock}
          type="password"
          value={form.confirmPassword}
          onChange={update('confirmPassword')}
          required
        />

        {error && (
          <div className="flex items-start gap-2 text-sm text-danger-700 bg-danger-50 border border-danger-100 rounded-xl px-3.5 py-3 mb-4">
            <AlertCircle className="w-4 h-4 mt-0.5 flex-shrink-0" />
            <span>{error}</span>
          </div>
        )}
        {success && (
          <div className="flex items-start gap-2 text-sm text-success-700 bg-success-50 border border-success-100 rounded-xl px-3.5 py-3 mb-4">
            <CheckCircle2 className="w-4 h-4 mt-0.5 flex-shrink-0" />
            <span>{success}</span>
          </div>
        )}

        <Button type="submit" className="w-full" disabled={loading}>
          {loading ? 'Creating account...' : 'Sign Up'}
        </Button>
      </form>

      <p className="text-center text-sm text-muted-foreground mt-6">
        Already have an account?{' '}
        <Link to="/signin" className="text-primary-600 font-semibold hover:text-primary-700">
          Sign In
        </Link>
      </p>
    </div>
  );
}
