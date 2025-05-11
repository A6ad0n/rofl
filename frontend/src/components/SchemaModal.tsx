import type { Schema } from "@mytypes/dbSchema";
import SchemaViewer from "@components/SchemaViewer";

interface SchemaModalProps {
	schema: Schema;
	onSelect: () => void;
}

const SchemaModal = ({ schema, onSelect }: SchemaModalProps) => (
	 <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
		<div className="flex flex-col">
			<SchemaViewer tableName="Table" schema={schema} />
			<div className="self-end mt-[0.5em] pl-[1em] pr-[1em] align-middle rounded-xs bg-white hover:bg-white/60">
				<button
					className="text-black"
					onClick={onSelect}
				>
					Close
				</button>
			</div>
		</div>
	</div>
);

export default SchemaModal;