const db = require('../config/db');
const ApiError = require('../utils/ApiError');

async function getSalaryStructure(employeeId) {
  const [salaryRows] = await db.query('SELECT * FROM salary WHERE employee_id = ?', [employeeId]);
  if (!salaryRows.length) throw new ApiError(404, 'Salary structure not found');
  const salary = salaryRows[0];

  const [components] = await db.query('SELECT * FROM salary_components WHERE salary_id = ?', [salary.id]);
  return { ...salary, components };
}

// Recomputes each component's amount from the monthly wage percentage,
// per the wireframe rule: value% of wage -> computed_amount, and
// fixed_allowance = wage - sum(all other components).
async function updateSalaryStructure(employeeId, payload) {
  const { monthlyWage, workingDaysPerWeek, breakHours, employeePfPercent, employerPfPercent, professionalTax, components } = payload;

  const connection = await db.getConnection();
  try {
    await connection.beginTransaction();

    const [salaryRows] = await connection.query('SELECT * FROM salary WHERE employee_id = ?', [employeeId]);
    if (!salaryRows.length) throw new ApiError(404, 'Salary structure not found');
    const salaryId = salaryRows[0].id;

    const yearlyWage = monthlyWage * 12;

    await connection.query(
      `UPDATE salary SET monthly_wage = ?, yearly_wage = ?, working_days_per_week = ?, break_hours = ?,
       employee_pf_percent = ?, employer_pf_percent = ?, professional_tax = ? WHERE id = ?`,
      [monthlyWage, yearlyWage, workingDaysPerWeek, breakHours, employeePfPercent, employerPfPercent, professionalTax, salaryId]
    );

    let allocatedSoFar = 0;
    const componentUpdates = (components || []).filter((c) => c.componentName !== 'fixed_allowance');

    for (const comp of componentUpdates) {
      const amount = comp.computationType === 'percentage' ? (monthlyWage * comp.value) / 100 : comp.value;
      allocatedSoFar += amount;
      await connection.query(
        `UPDATE salary_components SET computation_type = ?, value = ?, computed_amount = ? WHERE salary_id = ? AND component_name = ?`,
        [comp.computationType, comp.value, amount.toFixed(2), salaryId, comp.componentName]
      );
    }

    const fixedAllowanceAmount = Math.max(monthlyWage - allocatedSoFar, 0);
    const fixedAllowancePercent = monthlyWage > 0 ? (fixedAllowanceAmount / monthlyWage) * 100 : 0;
    await connection.query(
      `UPDATE salary_components SET computation_type = 'percentage', value = ?, computed_amount = ? WHERE salary_id = ? AND component_name = 'fixed_allowance'`,
      [fixedAllowancePercent.toFixed(2), fixedAllowanceAmount.toFixed(2), salaryId]
    );

    await connection.commit();
    return getSalaryStructure(employeeId);
  } catch (err) {
    await connection.rollback();
    throw err;
  } finally {
    connection.release();
  }
}

// Generates a salary slip for a given month, reducing payable days for
// absent / unpaid-leave days as required by the PDF.
async function generateSalarySlip(employeeId, year, month) {
  const structure = await getSalaryStructure(employeeId);

  const [attendanceRows] = await db.query(
    `SELECT status, COUNT(*) AS count FROM attendance
     WHERE employee_id = ? AND YEAR(work_date) = ? AND MONTH(work_date) = ?
     GROUP BY status`,
    [employeeId, year, month]
  );

  const totalDaysInMonth = new Date(year, month, 0).getDate();
  const statusCounts = attendanceRows.reduce((acc, r) => ({ ...acc, [r.status]: r.count }), {});
  const absentDays = statusCounts.absent || 0;
  const halfDays = statusCounts.half_day || 0;

  const payableDays = totalDaysInMonth - absentDays - halfDays * 0.5;
  const perDayWage = structure.monthly_wage / totalDaysInMonth;
  const grossSalary = perDayWage * payableDays;

  const proratedRatio = grossSalary / (structure.monthly_wage || 1);
  const components = structure.components.map((c) => ({
    name: c.component_name,
    amount: Number((c.computed_amount * proratedRatio).toFixed(2)),
  }));

  const employeePfAmount = (grossSalary * structure.employee_pf_percent) / 100;
  const employerPfAmount = (grossSalary * structure.employer_pf_percent) / 100;
  const totalDeductions = employeePfAmount + Number(structure.professional_tax);
  const netSalary = grossSalary - totalDeductions;

  return {
    employeeId,
    month,
    year,
    totalDaysInMonth,
    payableDays,
    absentDays,
    halfDays,
    grossSalary: Number(grossSalary.toFixed(2)),
    components,
    deductions: {
      employeePf: Number(employeePfAmount.toFixed(2)),
      employerPf: Number(employerPfAmount.toFixed(2)),
      professionalTax: Number(structure.professional_tax),
    },
    netSalary: Number(netSalary.toFixed(2)),
  };
}

module.exports = { getSalaryStructure, updateSalaryStructure, generateSalarySlip };
