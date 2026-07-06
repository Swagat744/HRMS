import { useEffect, useState } from 'react';
import { FileText } from 'lucide-react';
import * as payrollService from '../services/payrollService';
import { useAuth } from '../context/AuthContext.jsx';
import Card from '../components/ui/Card.jsx';
import Loader from '../components/ui/Loader.jsx';

export default function Payroll() {
  const { isAdmin } = useAuth();

  const [salary, setSalary] = useState(null);
  const [slip, setSlip] = useState(null);

  useEffect(() => {
    payrollService
      .getMySalary()
      .then((res) => setSalary(res.data));

    payrollService
      .getMySalarySlip({})
      .then((res) => setSlip(res.data));
  }, []);

  if (!salary) return <Loader />;

  const payableRatio = slip
    ? slip.payableDays / slip.totalDaysInMonth
    : 1;

  return (
    <div className="space-y-6">

      {/* Header */}

      <div>

        <h2 className="text-2xl font-bold text-foreground">
          Payroll
        </h2>

        <p className="mt-1 text-sm text-muted-foreground">
          {isAdmin
            ? 'Your salary structure'
            : 'Read-only view of your compensation'}
        </p>

      </div>

      {/* Salary Cards */}

      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">

        <Card className="border-0 bg-gradient-to-br from-primary-600 to-deep-600 text-white">

          <p className="text-xs font-semibold uppercase tracking-wide text-primary-100">
            Monthly Wage
          </p>

          <p className="mt-2 text-3xl font-bold">
            ₹{Number(salary.monthly_wage).toLocaleString('en-IN')}
          </p>

        </Card>

        <Card className="border border-border">

          <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">
            Yearly Wage
          </p>

          <p className="mt-2 text-3xl font-bold text-foreground">
            ₹{Number(salary.yearly_wage).toLocaleString('en-IN')}
          </p>

        </Card>

      </div>

      {/* Salary Components */}

      <Card>

        <h3 className="mb-5 text-lg font-semibold text-foreground">
          Salary Components
        </h3>

        <div className="overflow-x-auto rounded-xl border border-border">

          <table className="w-full text-sm">

            <thead className="bg-muted">

              <tr className="border-b border-border">

                <th className="px-5 py-3 text-left text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                  Component
                </th>

                <th className="px-5 py-3 text-left text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                  % of Wage
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

      </Card>

      {/* Salary Slip */}

      {slip && (

        <Card>

          <h3 className="mb-2 flex items-center gap-2 text-lg font-semibold text-foreground">

            <FileText className="h-5 w-5 text-muted-foreground" />

            Salary Slip — {slip.month}/{slip.year}

          </h3>

          <div className="mb-6 mt-5">

            <div className="mb-2 flex justify-between text-xs text-muted-foreground">

              <span>Payable Days</span>

              <span className="font-medium text-foreground">
                {slip.payableDays} / {slip.totalDaysInMonth}
              </span>

            </div>

            <div className="h-2 overflow-hidden rounded-full bg-muted">

              <div
                className="h-full rounded-full bg-gradient-to-r from-primary-500 via-primary-600 to-deep-500 transition-all duration-500"
                style={{
                  width: `${payableRatio * 100}%`,
                }}
              />

            </div>

          </div>

          <div className="grid grid-cols-1 gap-x-8 gap-y-3 md:grid-cols-2">

            <Row
              label="Absent Days"
              value={slip.absentDays}
            />

            <Row
              label="Gross Salary"
              value={`₹${slip.grossSalary.toLocaleString('en-IN')}`}
            />

            <Row
              label="Employee PF"
              value={`₹${slip.deductions.employeePf.toLocaleString('en-IN')}`}
            />

            <Row
              label="Professional Tax"
              value={`₹${slip.deductions.professionalTax.toLocaleString('en-IN')}`}
            />

          </div>

          <div className="mt-6 flex items-center justify-between border-t border-border pt-5">

            <span className="text-sm text-muted-foreground">
              Net Salary
            </span>

            <span className="text-3xl font-bold text-foreground">
              ₹{slip.netSalary.toLocaleString('en-IN')}
            </span>

          </div>

        </Card>

      )}

    </div>
  );
}

function Row({ label, value }) {
  return (
    <div className="flex items-center justify-between border-b border-border pb-3">

      <span className="text-muted-foreground">
        {label}
      </span>

      <span className="font-semibold text-foreground">
        {value}
      </span>

    </div>
  );
}