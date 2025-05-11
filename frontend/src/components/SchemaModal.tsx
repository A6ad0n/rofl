import type { Schema } from "@mytypes/dbSchema";
import SchemaViewer from "@components/SchemaViewer";
import { useEffect } from "react";

interface SchemaModalProps {
	tableName: string;
	schema: Schema;
	onClose: () => void;
}

//*TODO Add on CLick on ForeignKey opens another table respectively

const SchemaModal = ({ tableName, schema, onClose }: SchemaModalProps) => {
	useEffect(() => {
		const handleKeyDown = (e: KeyboardEvent) => {
			if (e.key == 'Escape') onClose();
		};
		document.addEventListener('keydown', handleKeyDown);
		return () => document.removeEventListener('keydown', handleKeyDown);
	}, [onClose]);

	return (
		<div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
			<div className="flex flex-col">
				<SchemaViewer tableName={tableName} schema={schema} />
				<div className="self-end mt-[0.5em] pl-[1em] pr-[1em] align-middle rounded-xs bg-white hover:bg-white/60">
					<button
						className="text-black"
						onClick={onClose}
					>
						Close
					</button>
				</div>
			</div>
		</div>
	);
}

export default SchemaModal;