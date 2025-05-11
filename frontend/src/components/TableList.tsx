interface TableListProps {
  tables: string[];
  selectedTable: string | null;
  onSelect: (table: string) => void;
}

const TableList = ({ tables, selectedTable, onSelect }: TableListProps) => (
  <div className="w-[30em]">
    {tables.length > 0 && (
      <>
        <h2 className="text-xl font-semibold mb-2">Tables</h2>
        <ul className="list-disc pl-5">
          {tables.map(table => (
            <li
              key={table}
              onClick={() => onSelect(table)}
              className={`cursor-pointer hover:text-blue-500 ${selectedTable === table ? 'font-bold' : ''}`}
            >
              {table}
            </li>
          ))}
        </ul>
      </>
    )}
  </div>
);

export default TableList;
