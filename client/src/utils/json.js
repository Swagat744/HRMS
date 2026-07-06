// mysql2 auto-parses JSON columns into JS values on real MySQL, but some
// MySQL-compatible servers (older versions, certain MariaDB configs) return
// the raw JSON string instead. Handle both shapes defensively so the UI
// never crashes regardless of the exact database server in use.
export function parseJsonArray(value) {
  if (Array.isArray(value)) return value;
  if (typeof value === 'string' && value.trim()) {
    try {
      const parsed = JSON.parse(value);
      return Array.isArray(parsed) ? parsed : [];
    } catch {
      return [];
    }
  }
  return [];
}
