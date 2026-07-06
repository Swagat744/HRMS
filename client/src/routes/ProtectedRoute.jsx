import { Navigate, Outlet } from 'react-router-dom';
import { useAuth } from '../context/AuthContext.jsx';

export default function ProtectedRoute({ adminOnly = false }) {
  const { user, isAdmin } = useAuth();

  if (!user) return <Navigate to="/signin" replace />;
  if (adminOnly && !isAdmin) return <Navigate to="/employee" replace />;

  return <Outlet />;
}
