import { useState, useEffect } from 'react';
import axios from 'axios';
import TableList from '@components/TableList';
import SchemaViewer from '@components/SchemaViewer';
import type { Schema } from '@mytypes/dbSchema';

const App = () => {
  const [tables, setTables] = useState<string[]>([]);
  const [selectedTable, setSelectedTable] = useState<string | null>(null);
  const [schema, setSchema] = useState<Schema | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    axios.get('http://localhost:8000/tables')
      .then(res => {
        setTables(res.data.tables);
        setError(null);
      })
      .catch(err => setError(`Error fetching tables: ${err.message}`));
  }, []);

  const fetchSchema = (tableName: string) => {
    setSelectedTable(tableName);
    setSchema(null);
    axios.get(`http://localhost:8000/tables/${tableName}`)
      .then(res => {
        setSchema(res.data.schema);
        setError(null);
      })
      .catch(err => setError(`Error fetching schema: ${err.message}`));
  };

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-2xl font-bold mb-4">Database Visualizer</h1>
      {error && <p className="text-red-500 mb-4">{error}</p>}
      <div className="flex">
        <TableList
          tables={tables}
          selectedTable={selectedTable}
          onSelect={fetchSchema}
        />
        <SchemaViewer
          tableName={selectedTable}
          schema={schema}
        />
      </div>
    </div>
  );
};

export default App;
