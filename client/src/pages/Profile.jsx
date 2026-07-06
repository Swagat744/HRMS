import { useEffect, useState } from 'react';
import {
  Mail,
  Save,
  ShieldCheck,
  Clock,
} from 'lucide-react';

import * as profileService from '../services/profileService';
import * as payrollService from '../services/payrollService';

import { parseJsonArray } from '../utils/json';

import { useAuth } from '../context/AuthContext.jsx';

import Card from '../components/ui/Card.jsx';
import Avatar from '../components/ui/Avatar.jsx';
import Input from '../components/ui/Input.jsx';
import Button from '../components/ui/Button.jsx';
import Loader from '../components/ui/Loader.jsx';

export default function Profile() {
  const { isAdmin } = useAuth();

  const [profile, setProfile] = useState(null);
  const [salary, setSalary] = useState(null);

  const [tab, setTab] = useState('resume');

  const [address, setAddress] = useState('');

  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  const load = () => {
    profileService.getMyProfile().then((res) => {
      setProfile(res.data);
      setAddress(
        res.data.privateInformation.address || ''
      );
    });

    if (isAdmin) {
      payrollService
        .getMySalary()
        .then((res) => setSalary(res.data))
        .catch(() => { });
    }
  };

  useEffect(() => {
    load();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  if (!profile) return <Loader />;

  const {
    employee,
    resume,
    privateInformation,
  } = profile;

  const name = `${employee.first_name} ${employee.last_name}`;

  const skills = parseJsonArray(resume.skills);

  const tabs = [
    {
      key: 'resume',
      label: 'Resume',
    },
    {
      key: 'private',
      label: 'Private Info',
    },
    ...(isAdmin
      ? [
        {
          key: 'salary',
          label: 'Salary Info',
        },
      ]
      : []),
    {
      key: 'security',
      label: 'Security',
    },
  ];

  const handleSaveAddress = async () => {
    setSaving(true);

    try {
      await profileService.updatePrivateInfo({
        address,
      });

      setSaved(true);

      setTimeout(() => setSaved(false), 1500);

      load();
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="space-y-6">

      {/* Profile Card */}

      <Card>

        <div className="flex flex-col gap-5 md:flex-row md:items-center">

          <Avatar
            name={name}
            src={employee.profile_picture_url}
            size={72}
          />

          <div className="flex-1">

            <h2 className="text-2xl font-bold text-foreground">
              {name}
            </h2>

            <p className="mt-2 font-mono text-sm text-muted-foreground">
              {employee.login_id}
            </p>

            <p className="mt-2 flex items-center gap-2 text-sm text-muted-foreground">

              <Mail className="h-4 w-4" />

              {employee.email}

            </p>

          </div>

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

          <div className="space-y-6 text-sm">

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

          </div>

        )}

        {/* Private Information */}

        {tab === 'private' && (

          <div className="space-y-6">

            <div className="grid grid-cols-1 gap-5 md:grid-cols-2">

              <Field
                label="Date of Birth"
                value={privateInformation.date_of_birth}
              />

              <Field
                label="Gender"
                value={privateInformation.gender}
              />

              <Field
                label="Nationality"
                value={privateInformation.nationality}
              />

              <Field
                label="Marital Status"
                value={privateInformation.marital_status}
              />

              <Field
                label="Date of Joining"
                value={employee.date_of_joining}
              />

              <Field
                label="Employee Code"
                value={employee.employee_code}
              />

            </div>

            <div className="max-w-md border-t border-border pt-6">

              <Input
                label="Address"
                value={address}
                onChange={(e) =>
                  setAddress(e.target.value)
                }
              />

              <Button
                onClick={handleSaveAddress}
                disabled={saving}
              >
                {saved ? (
                  <>
                    <ShieldCheck className="h-4 w-4" />
                    Saved
                  </>
                ) : (
                  <>
                    <Save className="h-4 w-4" />
                    {saving
                      ? 'Saving...'
                      : 'Save Address'}
                  </>
                )}
              </Button>

            </div>

          </div>

        )}
        {/* Salary */}

        {tab === 'salary' && salary && (

          <div className="space-y-6">

            <div className="overflow-x-auto rounded-2xl border border-border">

              <table className="w-full text-sm">

                <thead className="bg-muted">

                  <tr className="border-b border-border">

                    <th className="px-5 py-3 text-left text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                      Component
                    </th>

                    <th className="px-5 py-3 text-left text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                      Amount / Month
                    </th>

                  </tr>

                </thead>

                <tbody>

                  {salary.components.map((c) => (

                    <tr
                      key={c.id}
                      className="border-b border-border transition-colors hover:bg-muted/60 last:border-0"
                    >

                      <td className="px-5 py-3 capitalize text-foreground">
                        {c.component_name.replace(/_/g, ' ')}
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

        {/* Security */}

        {tab === 'security' && (

          <div className="max-w-lg space-y-4">

            <div className="flex items-center justify-between rounded-xl border border-border bg-card p-4">

              <div className="flex items-center gap-3 text-muted-foreground">

                <ShieldCheck className="h-5 w-5" />

                <span>Account Status</span>

              </div>

              <span className="rounded-full bg-success-50 px-3 py-1 text-sm font-medium text-success-700 dark:bg-success-500/10 dark:text-success-400">

                {employee.account_status}

              </span>

            </div>

            <div className="flex items-center justify-between rounded-xl border border-border bg-card p-4">

              <div className="flex items-center gap-3 text-muted-foreground">

                <Clock className="h-5 w-5" />

                <span>Last Login</span>

              </div>

              <span className="text-sm font-medium text-foreground">

                {employee.last_login
                  ? new Date(employee.last_login).toLocaleString()
                  : '—'}

              </span>

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