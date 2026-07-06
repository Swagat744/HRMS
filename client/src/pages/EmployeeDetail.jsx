import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  ArrowLeft,
  Briefcase,
  MapPin,
  Mail,
  Pencil,
  Save,
  X,
} from 'lucide-react';

import * as employeeService from '../services/employeeService';

import { useAuth } from '../context/AuthContext.jsx';

import Input from '../components/ui/Input.jsx';
import Button from '../components/ui/Button.jsx';

import * as profileService from '../services/profileService';
import * as payrollService from '../services/payrollService';

import { parseJsonArray } from '../utils/json';

import Card from '../components/ui/Card.jsx';
import Avatar from '../components/ui/Avatar.jsx';
import Loader from '../components/ui/Loader.jsx';

export default function EmployeeDetail() {
  const { id } = useParams();
  const navigate = useNavigate();
  const { isAdmin } = useAuth();

  const [profile, setProfile] = useState(null);
  const [salary, setSalary] = useState(null);
  const [tab, setTab] = useState('resume');
  const [editing, setEditing] = useState(false);

  const [saving, setSaving] = useState(false);

  const [employeeForm, setEmployeeForm] = useState({
    firstName: "",
    lastName: "",
    phone: "",
    email: "",
    department: "",
    jobPosition: "",
    location: "",
  });

  useEffect(() => {
    profileService
      .getEmployeeProfile(id)
      .then((res) => setProfile(res.data));

    payrollService
      .getEmployeeSalary(id)
      .then((res) => setSalary(res.data))
      .catch(() => { });
  }, [id]);
  useEffect(() => {
    if (!profile) return;

    setEmployeeForm({
      firstName: profile.employee.first_name || "",
      lastName: profile.employee.last_name || "",
      phone: profile.employee.phone || "",
      email: profile.employee.email || "",
      department: profile.employee.department || "",
      jobPosition: profile.employee.job_position || "",
      location: profile.employee.location || "",
    });
  }, [profile]);
  if (!profile) return <Loader />;

  const {
    employee,
    resume,
    privateInformation,
    bankDetails,
  } = profile;

  const name = `${employee.first_name} ${employee.last_name}`;

  const skills = parseJsonArray(resume.skills);
  const certifications = parseJsonArray(
    resume.certifications
  );
  const handleSaveEmployee = async () => {

    try {

      setSaving(true);

      await employeeService.updateEmployee(id, employeeForm);

      const res =
        await profileService.getEmployeeProfile(id);

      setProfile(res.data);

      setEditing(false);

    } finally {

      setSaving(false);

    }

  };

  const tabs = [
    {
      key: 'resume',
      label: 'Resume',
    },
    {
      key: 'private',
      label: 'Private Info',
    },
    {
      key: 'salary',
      label: 'Salary Info',
    },
  ];

  return (
    <div className="space-y-6">

      {/* Back */}

      <button
        onClick={() => navigate('/employees')}
        className="flex items-center gap-2 text-sm text-muted-foreground transition-colors hover:text-foreground"
      >
        <ArrowLeft className="h-4 w-4" />

        Back to Directory
      </button>

      {/* Profile */}

      <Card>

        <div className="flex flex-col gap-6 lg:flex-row lg:justify-between">

          <div className="flex gap-5">

            <Avatar
              name={name}
              src={employee.profile_picture_url}
              size={72}
            />

            <div className="flex-1">

              {!editing ? (

                <>

                  <h2 className="text-2xl font-bold text-foreground">
                    {name}
                  </h2>

                  <div className="mt-2 flex flex-wrap gap-x-5 gap-y-2 text-sm text-muted-foreground">

                    <span className="flex items-center gap-2">

                      <Briefcase className="h-4 w-4" />

                      {employee.job_position} · {employee.department}

                    </span>

                    <span className="flex items-center gap-2">

                      <MapPin className="h-4 w-4" />

                      {employee.location || "—"}

                    </span>

                    <span className="flex items-center gap-2">

                      <Mail className="h-4 w-4" />

                      {employee.email}

                    </span>

                  </div>

                  <p className="mt-3 font-mono text-xs text-muted-foreground">
                    {employee.login_id}
                  </p>

                </>

              ) : (

                <div className="grid grid-cols-1 md:grid-cols-2 gap-3">

                  <Input
                    label="First Name"
                    value={employeeForm.firstName}
                    onChange={(e) =>
                      setEmployeeForm({
                        ...employeeForm,
                        firstName: e.target.value,
                      })
                    }
                  />

                  <Input
                    label="Last Name"
                    value={employeeForm.lastName}
                    onChange={(e) =>
                      setEmployeeForm({
                        ...employeeForm,
                        lastName: e.target.value,
                      })
                    }
                  />

                  <Input
                    label="Email"
                    type="email"
                    value={employeeForm.email}
                    onChange={(e) =>
                      setEmployeeForm({
                        ...employeeForm,
                        email: e.target.value,
                      })
                    }
                  />

                  <Input
                    label="Phone"
                    value={employeeForm.phone}
                    onChange={(e) =>
                      setEmployeeForm({
                        ...employeeForm,
                        phone: e.target.value,
                      })
                    }
                  />

                  <Input
                    label="Department"
                    value={employeeForm.department}
                    onChange={(e) =>
                      setEmployeeForm({
                        ...employeeForm,
                        department: e.target.value,
                      })
                    }
                  />

                  <Input
                    label="Job Position"
                    value={employeeForm.jobPosition}
                    onChange={(e) =>
                      setEmployeeForm({
                        ...employeeForm,
                        jobPosition: e.target.value,
                      })
                    }
                  />

                  <Input
                    label="Location"
                    value={employeeForm.location}
                    onChange={(e) =>
                      setEmployeeForm({
                        ...employeeForm,
                        location: e.target.value,
                      })
                    }
                  />

                </div>

              )}

            </div>

          </div>
          {isAdmin && (

            <div className="flex flex-wrap gap-2 self-start">

              {!editing ? (

                <Button
                  variant="secondary"
                  onClick={() => setEditing(true)}
                >
                  <Pencil className="w-4 h-4" />
                  Edit Profile
                </Button>

              ) : (

                <>

                  <Button
                    variant="secondary"
                    onClick={() => {
                      setEditing(false);

                      setEmployeeForm({
                        firstName: employee.first_name || "",
                        lastName: employee.last_name || "",
                        phone: employee.phone || "",
                        email: employee.email || "",
                        department: employee.department || "",
                        jobPosition: employee.job_position || "",
                        location: employee.location || "",
                      });
                    }}
                  >
                    <X className="w-4 h-4" />
                    Cancel
                  </Button>

                  <Button
                    onClick={handleSaveEmployee}
                    disabled={saving}
                  >
                    <Save className="w-4 h-4" />
                    {saving ? "Saving..." : "Save Changes"}
                  </Button>

                </>

              )}

            </div>

          )}

        </div>

      </Card>

      {/* Tabs */}

      <Card>

        <div className="mb-6 -mt-1 flex gap-1 border-b border-border">

          {tabs.map((t) => (

            <button
              key={t.key}
              onClick={() => setTab(t.key)}
              className={`border-b-2 px-4 py-3 text-sm font-medium transition-all ${tab === t.key
                ? 'border-primary-600 text-primary-600'
                : 'border-transparent text-muted-foreground hover:text-foreground'
                }`}
            >
              {t.label}
            </button>

          ))}

        </div>
        {/* Resume */}

        {tab === 'resume' && (

          <div className="grid grid-cols-1 gap-8 md:grid-cols-2">

            {/* Left */}

            <div className="space-y-6">

              <div>

                <h4 className="mb-2 text-base font-semibold text-foreground">
                  About
                </h4>

                <p className="leading-7 text-muted-foreground">
                  {resume.about || 'No information added yet.'}
                </p>

              </div>

              <div>

                <h4 className="mb-2 text-base font-semibold text-foreground">
                  What I Love About My Job
                </h4>

                <p className="leading-7 text-muted-foreground">
                  {resume.what_i_love || '—'}
                </p>

              </div>

              <div>

                <h4 className="mb-2 text-base font-semibold text-foreground">
                  Interests & Hobbies
                </h4>

                <p className="leading-7 text-muted-foreground">
                  {resume.interests || '—'}
                </p>

              </div>

            </div>

            {/* Right */}

            <div className="space-y-6">

              <div>

                <h4 className="mb-3 text-base font-semibold text-foreground">
                  Skills
                </h4>

                <div className="flex flex-wrap gap-2">

                  {skills.length ? (

                    skills.map((skill, i) => (

                      <span
                        key={i}
                        className="rounded-full border border-primary-200 bg-primary-50 px-3 py-1 text-xs font-medium text-primary-700 dark:border-primary-700/40 dark:bg-primary-900/20 dark:text-primary-300"
                      >
                        {skill}
                      </span>

                    ))

                  ) : (

                    <span className="text-sm text-muted-foreground">
                      —
                    </span>

                  )}

                </div>

              </div>

              <div>

                <h4 className="mb-3 text-base font-semibold text-foreground">
                  Certifications
                </h4>

                <div className="flex flex-wrap gap-2">

                  {certifications.length ? (

                    certifications.map((cert, i) => (

                      <span
                        key={i}
                        className="rounded-full border border-border bg-muted px-3 py-1 text-xs font-medium text-foreground"
                      >
                        {cert}
                      </span>

                    ))

                  ) : (

                    <span className="text-sm text-muted-foreground">
                      —
                    </span>

                  )}

                </div>

              </div>

            </div>

          </div>

        )}
        {/* Private Information */}

        {tab === 'private' && (

          <div className="grid grid-cols-1 gap-x-8 gap-y-5 md:grid-cols-2">

            <Field label="Date of Birth" value={privateInformation.date_of_birth} />
            <Field label="Bank Name" value={bankDetails.bank_name} />

            <Field label="Gender" value={privateInformation.gender} />
            <Field label="Account Number" value={bankDetails.account_number} />

            <Field label="Nationality" value={privateInformation.nationality} />
            <Field label="IFSC Code" value={bankDetails.ifsc_code} />

            <Field label="Address" value={privateInformation.address} />
            <Field label="PAN No." value={privateInformation.pan_no} />

            <Field label="Personal Email" value={privateInformation.personal_email} />
            <Field label="UAN No." value={privateInformation.uan_no} />

            <Field label="Marital Status" value={privateInformation.marital_status} />
            <Field label="Employee Code" value={employee.employee_code} />

            <Field label="Date of Joining" value={employee.date_of_joining} />

          </div>

        )}

        {/* Salary */}

        {tab === 'salary' && salary && (

          <div className="space-y-6">

            <div className="grid grid-cols-1 gap-4 md:grid-cols-2">

              <div className="rounded-2xl border border-border bg-muted p-5">

                <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                  Monthly Wage
                </p>

                <p className="mt-2 text-3xl font-bold text-foreground">
                  ₹{Number(salary.monthly_wage).toLocaleString('en-IN')}
                </p>

              </div>

              <div className="rounded-2xl border border-border bg-muted p-5">

                <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                  Yearly Wage
                </p>

                <p className="mt-2 text-3xl font-bold text-foreground">
                  ₹{Number(salary.yearly_wage).toLocaleString('en-IN')}
                </p>

              </div>

            </div>

            <div className="overflow-x-auto rounded-2xl border border-border">

              <table className="w-full text-sm">

                <thead className="bg-muted">

                  <tr className="border-b border-border text-left">

                    <th className="px-5 py-3 text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                      Component
                    </th>

                    <th className="px-5 py-3 text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                      % of Wage
                    </th>

                    <th className="px-5 py-3 text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                      Amount / Month
                    </th>

                  </tr>

                </thead>

                <tbody>

                  {salary.components.map((c) => (

                    <tr
                      key={c.id}
                      className="border-b border-border last:border-0 hover:bg-muted/60 transition-colors"
                    >

                      <td className="px-5 py-3 capitalize text-foreground">
                        {c.component_name.replace(/_/g, ' ')}
                      </td>

                      <td className="px-5 py-3 text-muted-foreground">
                        {c.value}%
                      </td>

                      <td className="px-5 py-3 font-semibold text-foreground">
                        ₹{Number(c.computed_amount).toLocaleString('en-IN')}
                      </td>

                    </tr>

                  ))}

                </tbody>

              </table>

            </div>

          </div>

        )}

      </Card>

    </div>
  );
}

function Field({ label, value }) {
  return (
    <div className="rounded-xl border border-border bg-card p-4">

      <p className="mb-1 text-xs font-semibold uppercase tracking-wide text-muted-foreground">
        {label}
      </p>

      <p className="text-sm font-medium text-foreground">
        {value || '—'}
      </p>

    </div>
  );
}