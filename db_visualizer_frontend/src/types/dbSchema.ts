export interface ForeignKey {
  referenced_table: string;
  referenced_column: string;
}

export interface Column {
  name: string;
  type: string;
  nullable: boolean;
  primary_key: boolean;
  foreign_key?: ForeignKey;
}

export type Schema = Column[];
