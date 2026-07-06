import { useEffect, useMemo, useState } from 'react';
import {
  Search,
  Plus,
  Copy,
  Check,
} from 'lucide-react';

import * as employeeService from '../services/employeeService';

import EmployeeCard from '../components/EmployeeCard.jsx';
import Button from '../components/ui/Button.jsx';
import Input from '../components/ui/Input.jsx';
import Modal from '../components/ui/Modal.jsx';
import Loader from '../components/ui/Loader.jsx';
import EmptyState from '../components/ui/EmptyState.jsx';

export default function Employees() {
  const [employees, setEmployees] = useState([]);
  const [search, setSearch] = useState('');
  const [department, setDepartment] = useState('');
  const [loading, setLoading] = useState(true);

  const [modalOpen, setModalOpen] = useState(false);

  const [form, setForm] = useState({
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    jobPosition: '',
    department: '',
  });

  const [creating, setCreating] = useState(false);

  const [createdCreds, setCreatedCreds] = useState(null);

  const [copied, setCopied] = useState(false);

  const load = async (params = {}) => {
    setLoading(true);

    const res = await employeeService.listEmployees(params);

    setEmployees(res.data.employees);

    setLoading(false);
  };

  useEffect(() => {
    load();
  }, []);

  const departments = useMemo(
    () =>
      [...new Set(employees.map((e) => e.department).filter(Boolean))].sort(),
    [employees]
  );

  const filtered = useMemo(
    () =>
      employees.filter(
        (e) => !department || e.department === department
      ),
    [employees, department]
  );

  const handleSearch = (e) => {
    e.preventDefault();
    load({ search });
  };

  const handleCreate = async (e) => {
    e.preventDefault();

    setCreating(true);

    try {
      const res = await employeeService.createEmployee(form);

      setCreatedCreds(res.data);

      setForm({
        firstName: '',
        lastName: '',
        email: '',
        phone: '',
        jobPosition: '',
        department: '',
      });

      load();
    } finally {
      setCreating(false);
    }
  };

  const copyCreds = () => {
    navigator.clipboard.writeText(
      `Login ID: ${createdCreds.loginId}\nTemporary Password: ${createdCreds.tempPassword}`
    );

    setCopied(true);

    setTimeout(() => setCopied(false), 1500);
  };

  return (
    <div className="space-y-6">

      {/* Header */}

      <div className="flex flex-wrap items-center justify-between gap-4">

        <div>

          <h2 className="text-2xl font-bold text-foreground">
            Employee Directory
          </h2>

          <p className="mt-1 text-sm text-muted-foreground">
            {filtered.length} of {employees.length} employees
          </p>

        </div>

        <div className="flex flex-wrap items-center gap-3">

          <form
            onSubmit={handleSearch}
            className="relative"
          >

            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />

            <input
              className="input-field w-56 pl-10"
              placeholder="Search employees..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />

          </form>

          <select
            className="input-field w-44 appearance-none"
            value={department}
            onChange={(e) => setDepartment(e.target.value)}
          >
            <option value="">All Departments</option>

            {departments.map((d) => (
              <option
                key={d}
                value={d}
              >
                {d}
              </option>
            ))}

          </select>

          <Button
            onClick={() => setModalOpen(true)}
            className="shadow-glow hover:shadow-lg"
          >
            <Plus className="h-4 w-4" />

            New Employee

          </Button>

        </div>

      </div>

      {loading ? (

        <Loader />

      ) : filtered.length === 0 ? (

        <EmptyState
          title="No employees found"
          description="Try a different search or filter."
        />

      ) : (

        <div className="grid gap-5 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">

          {filtered.map((emp) => (
            <EmployeeCard
              key={emp.id}
              employee={emp}
            />
          ))}

        </div>

      )}

      <Modal
        open={modalOpen}
        onClose={() => {
          setModalOpen(false);
          setCreatedCreds(null);
        }}
        title="Create Employee"
      >        {createdCreds ? (

        <div className="space-y-5">

          <div className="flex items-center gap-3 rounded-xl border border-success-500/20 bg-success-50 px-4 py-3 text-success-700 dark:bg-success-500/10 dark:text-success-400">

            <Check className="h-5 w-5" />

            <div>

              <p className="font-medium">
                Employee created successfully!
              </p>

              <p className="text-sm opacity-80">
                Share these credentials securely.
              </p>

            </div>

          </div>

          <div className="rounded-xl border border-border bg-muted p-4 font-mono text-sm space-y-3">

            <div className="flex justify-between items-center">

              <span className="font-sans text-muted-foreground">
                Login ID
              </span>

              <span className="font-medium text-foreground">
                {createdCreds.loginId}
              </span>

            </div>

            <div className="flex justify-between items-center">

              <span className="font-sans text-muted-foreground">
                Temporary Password
              </span>

              <span className="font-medium text-foreground">
                {createdCreds.tempPassword}
              </span>

            </div>

          </div>

          <Button
            variant="secondary"
            onClick={copyCreds}
            className="w-full"
          >
            {copied ? (
              <>
                <Check className="h-4 w-4" />
                Copied
              </>
            ) : (
              <>
                <Copy className="h-4 w-4" />
                Copy Credentials
              </>
            )}
          </Button>

          <p className="text-center text-xs text-muted-foreground">
            The employee will be asked to change the password on
            first login.
          </p>

          <Button
            className="w-full"
            onClick={() => setModalOpen(false)}
          >
            Done
          </Button>

        </div>

      ) : (

        <form
          onSubmit={handleCreate}
          className="space-y-4"
        >

          <div className="grid grid-cols-2 gap-3">

            <Input
              label="First Name"
              value={form.firstName}
              onChange={(e) =>
                setForm({
                  ...form,
                  firstName: e.target.value,
                })
              }
              required
            />

            <Input
              label="Last Name"
              value={form.lastName}
              onChange={(e) =>
                setForm({
                  ...form,
                  lastName: e.target.value,
                })
              }
              required
            />

          </div>

          <Input
            label="Email"
            type="email"
            value={form.email}
            onChange={(e) =>
              setForm({
                ...form,
                email: e.target.value,
              })
            }
            required
          />

          <Input
            label="Phone"
            value={form.phone}
            onChange={(e) =>
              setForm({
                ...form,
                phone: e.target.value,
              })
            }
            required
          />

          <div className="grid grid-cols-2 gap-3">

            <Input
              label="Job Position"
              value={form.jobPosition}
              onChange={(e) =>
                setForm({
                  ...form,
                  jobPosition: e.target.value,
                })
              }
            />

            <Input
              label="Department"
              value={form.department}
              onChange={(e) =>
                setForm({
                  ...form,
                  department: e.target.value,
                })
              }
            />

          </div>

          <Button
            type="submit"
            className="w-full"
            disabled={creating}
          >
            {creating
              ? 'Creating Employee...'
              : 'Create Employee'}
          </Button>

        </form>

      )}

      </Modal>

    </div>
  );
}