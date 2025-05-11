import type { Schema } from "@mytypes/dbSchema";

interface SchemaViewerProps {
  tableName: string | null;
  schema: Schema | null;
}

const SchemaViewer = ({ tableName, schema }: SchemaViewerProps) => (
  <div className="">
    {tableName !== null && (
      <>
        <h2 className="text-xl font-semibold mb-2">{tableName}</h2>
        {schema ? (
          <table className="w-full border-collapse border">
            <thead>
              <tr className="bg-gray-600">
                <th className="border p-2">Column</th>
                <th className="border p-2">Type</th>
                <th className="border p-2">Nullable</th>
                <th className="border p-2">Primary Key</th>
                <th className="border p-2">Foreign Key</th>
              </tr>
            </thead>
            <tbody>
              {schema.map(col => (
                <tr key={col.name}>
                  <td className="border p-2">{col.name}</td>
                  <td className="border p-2">{col.type}</td>
                  <td className="border p-2">{col.nullable ? 'Yes' : 'No'}</td>
                  <td className="border p-2">{col.primary_key ? 'Yes' : 'No'}</td>
                  <td className="border p-2">
                    {col.foreign_key
                      ? `${col.foreign_key.referenced_table}.${col.foreign_key.referenced_column}`
                      : 'No'}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        ) : (
          <p>Loading schema...</p>
        )}
      </>
    )}
  </div>
);

export default SchemaViewer;
