import type { Column, Schema } from "@mytypes/dbSchema";
import { useMemo } from "react";

interface TableProps {
  schema: Schema | null;
	onSelect: () => void;
}

const Table = ({ schema, onSelect }: TableProps) => {
	const fontSize = 14;

	const tableWidth = useMemo(() => {
		if (schema === null)
			return 0;
		const longestTextLength = schema.reduce((maxLen: number, col: Column) => {
      const text = `${col.primary_key ? "PK " : col.foreign_key ? "FK " : ""}${col.name}`;
      return Math.max(maxLen, text.length);
    }, 0);
		const totalWidth = longestTextLength * fontSize;
		return totalWidth;
	}, [schema]);

	return (
		<div 
			style={{ width: `${tableWidth}px`, maxWidth: "100%" }}
		>
				{schema ? (
					<table 
						className="w-full border-collapse border border-gray-800"
						onClick={onSelect}
						style={{ fontSize: `${fontSize}px` }}
					>
						<tbody>
							{schema.map((col: Column) => (
									<tr
										key={col.name}
										className={col.primary_key ? "border-2" : "border"}
									>
										<td className="p-2">
											{col.primary_key && <span className="font-bold">PK </span>}
											{col.foreign_key && <span className="font-bold">FK </span>}
											{col.name}
										</td>
									</tr>
								))}
						</tbody>
					</table>
				) : (
					// TODO animation
					<p>Loading schema...</p>
				)}
		</div>
	);
}

export default Table;