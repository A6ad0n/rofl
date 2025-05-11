import { useState, useEffect } from 'react';
import type { Schema } from '@mytypes/dbSchema';
import TableList from '@components/TableList';
import Table from '@components/Table';
import SchemaModal from '@components/SchemaModal';
import { fetchSchema, fetchTables } from './api/api';

const App = () => {
  const [tables, setTables] = useState<string[]>([]);
  const [selectedTable, setSelectedTable] = useState<string | null>(null);
  const [isModalOpen, setIsModalOpen] = useState<boolean>(false);
  const [schema, setSchema] = useState<Schema | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchTables()
      .then(setTables)
      .catch((err) => setError(err.message));
  }, []);

  const handleTableSelect = (tableName: string) => {
    setSelectedTable(tableName);
    fetchSchema(tableName)
      .then(setSchema)
      .catch((err) => setError(err.message));
  };

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-2xl font-bold mb-4">Database Visualizer</h1>
      {error && <p className="text-red-500 mb-4">{error}</p>}
      <div className="flex">
        <TableList
          tables={tables}
          selectedTable={selectedTable}
          onSelect={handleTableSelect}
        />
        {selectedTable !== null &&
          <Table
            schema={schema}
            onSelect={() => setIsModalOpen(true)}
          />
        }
      </div>
      {isModalOpen && 
        <SchemaModal
          tableName={selectedTable!}
          schema={schema!}
          onClose={() => setIsModalOpen(false)}
          onFKClick={handleTableSelect}
        />
      }
    </div>
  );
};

export default App;
