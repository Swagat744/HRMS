import { useEffect, useState } from 'react';
import { Plus, Check, X } from 'lucide-react';
import * as leaveService from '../services/leaveService';
import { useAuth } from '../context/AuthContext.jsx';
import Card from '../components/ui/Card.jsx';
import Table from '../components/ui/Table.jsx';
import Badge from '../components/ui/Badge.jsx';
import Button from '../components/ui/Button.jsx';
import Modal from '../components/ui/Modal.jsx';
import Input from '../components/ui/Input.jsx';
import Loader from '../components/ui/Loader.jsx';
import { LEAVE_STATUS_COLORS, LEAVE_TYPES } from '../constants';

export default function Leave() {
  const { isAdmin } = useAuth();
  const [leaves, setLeaves] = useState([]);
  const [balance, setBalance] = useState(null);
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [form, setForm] = useState({ leaveType: 'paid', startDate: '', endDate: '', remarks: '' });
  const [submitting, setSubmitting] = useState(false);
  const [formError, setFormError] = useState('');

  const load = async () => {
    setLoading(true);
    if (isAdmin) {
      const res = await leaveService.getCompanyLeaves({});
      setLeaves(res.data);
    } else {
      const [leavesRes, balanceRes] = await Promise.all([leaveService.getMyLeaves(), leaveService.getBalance()]);
      setLeaves(leavesRes.data);
      setBalance(balanceRes.data);
    }
    setLoading(false);
  };

  useEffect(() => {
    load();
  }, []);

  const handleApply = async (e) => {
    e.preventDefault();
    setFormError('');
    setSubmitting(true);
    try {
      await leaveService.applyLeave(form);
      setModalOpen(false);
      setForm({ leaveType: 'paid', startDate: '', endDate: '', remarks: '' });
      load();
    } catch (err) {
      setFormError(err.response?.data?.message || 'Could not submit leave request');
    } finally {
      setSubmitting(false);
    }
  };

  const handleReview = async (id, status) => {
    await leaveService.reviewLeave(id, { status });
    load();
  };

  const columns = [
    ...(isAdmin ? [{ key: 'name', header: 'Employee', render: (r) => `${r.first_name} ${r.last_name}` }] : []),
    { key: 'leave_type', header: 'Type', render: (r) => <span className="capitalize">{r.leave_type}</span> },
    { key: 'start_date', header: 'Start Date' },
    { key: 'end_date', header: 'End Date' },
    { key: 'remarks', header: 'Remarks', render: (r) => r.remarks || '—' },
    {
      key: 'status',
      header: 'Status',
      render: (r) => <Badge className={LEAVE_STATUS_COLORS[r.status]}>{r.status}</Badge>,
    },
    ...(isAdmin
      ? [
        {
          key: 'actions',
          header: 'Actions',
          render: (r) =>
            r.status === 'pending' ? (
              <div className="flex gap-1.5">
                <button
                  onClick={() => handleReview(r.id, 'approved')}
                  className="w-7 h-7 flex items-center justify-center rounded-lg bg-success-50 text-success-600 hover:bg-success-100"
                  title="Approve"
                >
                  <Check className="w-4 h-4" />
                </button>
                <button
                  onClick={() => handleReview(r.id, 'rejected')}
                  className="w-7 h-7 flex items-center justify-center rounded-lg bg-danger-50 text-danger-600 hover:bg-danger-100"
                  title="Reject"
                >
                  <X className="w-4 h-4" />
                </button>
              </div>
            ) : (
              <span className="text-ink-300">—</span>
            ),
        },
      ]
      : []),
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold text-foreground">Time Off</h2>
          <p className="text-sm text-muted-foreground mt-1">{isAdmin ? 'Review and manage leave requests' : 'Apply for and track your leave'}</p>
        </div>
        {!isAdmin && (
          <Button onClick={() => setModalOpen(true)}>
            <Plus className="w-4 h-4" /> Apply Leave
          </Button>
        )}
      </div>

      {!isAdmin && balance && (
        <div className="grid grid-cols-2 gap-4">
          <Card className="bg-gradient-to-br from-primary-600 to-primary-700 text-white border-0">
            <p className="text-xs uppercase font-semibold text-primary-100">Paid Time Off</p>
            <p className="text-3xl font-bold mt-1.5">{balance.paid.available} <span className="text-base font-medium text-primary-200">/ {balance.paid.total} days</span></p>
          </Card>
          <Card>
            <p className="text-xs uppercase font-semibold text-ink-400">Sick Time Off</p>
            <p className="text-3xl font-bold text-foreground mt-1.5">{balance.sick.available} <span className="text-base font-medium text-ink-400">/ {balance.sick.total} days</span></p>
          </Card>
        </div>
      )}

      <div className="card overflow-hidden">
        {loading ? <Loader /> : <Table columns={columns} data={leaves} emptyText="No leave requests yet" />}
      </div>

      <Modal open={modalOpen} onClose={() => setModalOpen(false)} title="Apply for Leave">
        <form onSubmit={handleApply}>
          <label className="label">Leave Type</label>
          <select
            className="input-field mb-4"
            value={form.leaveType}
            onChange={(e) => setForm({ ...form, leaveType: e.target.value })}
          >
            {LEAVE_TYPES.map((t) => (
              <option key={t.value} value={t.value}>{t.label}</option>
            ))}
          </select>
          <div className="grid grid-cols-2 gap-3">
            <Input label="Start Date" type="date" value={form.startDate} onChange={(e) => setForm({ ...form, startDate: e.target.value })} required />
            <Input label="End Date" type="date" value={form.endDate} onChange={(e) => setForm({ ...form, endDate: e.target.value })} required />
          </div>
          <Input label="Remarks" value={form.remarks} onChange={(e) => setForm({ ...form, remarks: e.target.value })} />
          {formError && <p className="text-sm text-danger-600 mb-4">{formError}</p>}
          <Button type="submit" className="w-full" disabled={submitting}>
            {submitting ? 'Submitting...' : 'Submit Request'}
          </Button>
        </form>
      </Modal>
    </div>
  );
}
