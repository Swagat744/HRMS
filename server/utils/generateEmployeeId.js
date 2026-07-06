/**
 * Generates a Login ID in the format:
 * [CompanyPrefix][First 2 letters of first name + first 2 letters of last name][JoiningYear][RunningNumber]
 * Example: OIJODO20260001  (OI = Odoo India, JO = Jo(hn), DO = Do(e))
 */
function generateLoginId({ companyPrefix, firstName, lastName, joiningYear, runningNumber }) {
  const initials =
    (firstName || 'XX').substring(0, 2).toUpperCase() +
    (lastName || 'XX').substring(0, 2).toUpperCase();
  const paddedNumber = String(runningNumber).padStart(4, '0');
  return `${companyPrefix.toUpperCase()}${initials}${joiningYear}${paddedNumber}`;
}

module.exports = generateLoginId;
