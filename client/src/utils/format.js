// Converts a decimal hours value (e.g. 4.84, as stored in the database)
// into a human-readable "Xh Ym" string (e.g. "4h 50m").
export function formatHoursMinutes(decimalHours) {
    const value = Number(decimalHours || 0);
    const totalMinutes = Math.round(value * 60);
    const hours = Math.floor(totalMinutes / 60);
    const minutes = totalMinutes % 60;

    if (hours <= 0 && minutes <= 0) return '0m';
    if (hours <= 0) return `${minutes}m`;
    if (minutes === 0) return `${hours}h`;
    return `${hours}h ${minutes}m`;
}