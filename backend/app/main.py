from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from app.db.connection import get_db, engine
from app.db.metadata import get_tables, get_table_schema

app = FastAPI(title="Database Visualizer")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/tables")
def list_tables(db: Session = Depends(get_db)):
    tables = get_tables(engine)
    return {"tables": tables}

@app.get("/tables/{table_name}")
def get_table_details(table_name: str, db: Session = Depends(get_db)):
    try:
        schema = get_table_schema(engine, table_name)
        if not schema:
            raise HTTPException(status_code=404, detail="Table not found")
        return {"table": table_name, "schema": schema}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))