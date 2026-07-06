import { createContext, useContext, useEffect, useState } from 'react';
import * as authService from '../services/authService';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [user, setUser] = useState(() => {
    const stored = localStorage.getItem('hrms_user');
    return stored ? JSON.parse(stored) : null;
  });
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (user) {
      localStorage.setItem('hrms_user', JSON.stringify(user));
    } else {
      localStorage.removeItem('hrms_user');
    }
  }, [user]);

  const login = async (loginId, password) => {
    setLoading(true);
    try {
      const { data } = await authService.signIn({ loginId, password });
      localStorage.setItem('hrms_token', data.token);
      setUser(data.user);
      return data.user;
    } finally {
      setLoading(false);
    }
  };

  const register = async (payload) => {
    setLoading(true);
    try {
      return await authService.signUp(payload);
    } finally {
      setLoading(false);
    }
  };

  const logoutUser = async () => {
    try {
      await authService.logout();
    } catch (e) {
      // ignore network errors on logout
    }
    localStorage.removeItem('hrms_token');
    setUser(null);
  };

  const isAdmin = user?.role === 'admin' || user?.role === 'hr';

  return (
    <AuthContext.Provider value={{ user, setUser, login, register, logout: logoutUser, isAdmin, loading }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used within AuthProvider');
  return ctx;
}
