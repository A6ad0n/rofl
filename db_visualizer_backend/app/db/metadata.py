from sqlalchemy import inspect
from sqlalchemy.engine import Engine

def get_tables(engine: Engine):
    inspector = inspect(engine)
    return inspector.get_table_names()

def get_table_schema(engine: Engine, table_name: str):
    inspector = inspect(engine)
    columns = inspector.get_columns(table_name)
    pk_constraint = inspector.get_pk_constraint(table_name)
    pk_columns = pk_constraint.get("constrained_columns", [])
    fk_constraints = inspector.get_foreign_keys(table_name)
    schema = []
    for col in columns:
        col_info = {
            "name": col["name"],
            "type": str(col["type"]),
            "nullable": col["nullable"],
            "primary_key": col["name"] in pk_columns,
            "foreign_key": None
        }
        for fk in fk_constraints:
            if col["name"] in fk["constrained_columns"]:
                col_info["foreign_key"] = {
                    "referenced_table": fk["referred_table"],
                    "referenced_column": fk["referred_columns"][0]
                }
        schema.append(col_info)
    return schema