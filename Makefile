ifeq ($(OS), Windows_NT)
    PYTHON   := $(shell where python)
    PIP      := $(shell where pip)
    NPM      := $(shell where npm)
	PSQL     := $(shell where psql)
	DROPDB   := $(shell where dropdb)
	CREATEDB := $(shell where createdb)
	ACTIVATE = venv\\Scripts\\activate
else
    PYTHON   := $(shell which python)
    PIP      := $(shell which pip)
    NPM      := $(shell which npm)
	PSQL     := $(shell which psql)
	DROPDB   := $(shell which dropdb)
	CREATEDB := $(shell which createdb)
	ACTIVATE = venv/bin/activate
endif

SCRIPTS_DIR  = ./scripts
BACKEND_DIR  = ./backend
FRONTEND_DIR = ./frontend

USER_NAME = postgres
DB_NAME   = metadata

CREATE_SCRIPT_NAME = createtables.sql
FILL_SCRIPT_NAME   = filltables.sql

CREATE_SCRIPT = $(SCRIPTS_DIR)/$(CREATE_SCRIPT_NAME)
FILL_SCRIPT   = $(SCRIPTS_DIR)/$(FILL_SCRIPT_NAME)

VENV = $(BACKEND_DIR)/venv

all: install

install: install-backend install-frontend

install-backend:
	@echo "Installing backend dependencies..."
	@cd $(BACKEND_DIR) && $(PYTHON) -m venv venv
	@. $(VENV)/bin/activate && $(PIP) install -r $(BACKEND_DIR)/requirements.txt

install-frontend:
	@echo "Installing frontend dependencies..."
	@cd $(FRONTEND_DIR) && $(NPM) install

start-backend:
	@echo "Starting backend server..."
	@cd $(BACKEND_DIR) && . venv/bin/activate && uvicorn app.main:app --reload

start-frontend:
	@echo "Starting frontend React app..."
	@cd $(FRONTEND_DIR) && $(NPM) start

start:
	@echo "Starting backend and frontend..."
	cd $(BACKEND_DIR) && . venv/bin/activate && (uvicorn app.main:app --reload &); 
	cd $(FRONTEND_DIR) && $(NPM) run dev

clean:
	@echo "Cleaning up..."
	@rm -rf $(VENV)
	@rm -rf $(FRONTEND_DIR)/node_modules
	@rm -rf $(FRONTEND_DIR)/dist

.PHONY: all install install-backend install-frontend start-backend start-frontend start clean