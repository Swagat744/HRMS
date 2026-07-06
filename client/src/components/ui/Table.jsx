export default function Table({
  columns,
  data,
  emptyText = 'No records found',
}) {
  return (
    <div className="overflow-x-auto rounded-2xl border border-border bg-background shadow-soft">
      <table className="min-w-full text-sm">
        <thead className="sticky top-0 z-10 bg-background">
          <tr className="border-b border-border">
            {columns.map((col) => (
              <th
                key={col.key}
                className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wider text-muted-foreground"
              >
                {col.header}
              </th>
            ))}
          </tr>
        </thead>

        <tbody>
          {data.length === 0 ? (
            <tr>
              <td
                colSpan={columns.length}
                className="px-6 py-16 text-center text-sm text-muted-foreground"
              >
                {emptyText}
              </td>
            </tr>
          ) : (
            data.map((row, index) => (
              <tr
                key={row.id || index}
                className="
                  border-b border-border
                  even:bg-muted/25
                  hover:bg-primary-50/50
                  dark:hover:bg-primary-900/20
          transition-colors
          last:border-0
          "
              >
                {columns.map((col) => (
                  <td
                    key={col.key}
                    className="px-6 py-4 text-foreground align-middle"
                  >
                    {col.render ? col.render(row) : row[col.key]}
                  </td>
                ))}
              </tr>
            ))
          )}
        </tbody>
      </table>
    </div >
  );
}