ifeq ($(OS), Windows_NT)
	WHERE = where
	ACTIVATE = venv\\Scripts\\activate
else
	WHERE = which
	ACTIVATE = venv/bin/activate
endif

PYTHON   := $(shell $(WHERE) python)
PIP      := $(shell $(WHERE) pip)
NPM      := $(shell $(WHERE) npm)
PSQL     := $(shell $(WHERE) psql)
DROPDB   := $(shell $(WHERE) dropdb)
CREATEDB := $(shell $(WHERE) createdb)

SCRIPTS_DIR  = ./scripts
BACKEND_DIR  = ./backend
FRONTEND_DIR = ./frontend

INIT_ENV_NAME      = init_env.sh
CREATE_SCRIPT_NAME = schema.sql
FILL_SCRIPT_NAME   = seed.sql

INIT_ENV      = $(SCRIPTS_DIR)/$(INIT_ENV_NAME)
CREATE_SCRIPT = $(SCRIPTS_DIR)/$(CREATE_SCRIPT_NAME)
FILL_SCRIPT   = $(SCRIPTS_DIR)/$(FILL_SCRIPT_NAME)

VENV = $(BACKEND_DIR)/venv
TABLES = $(shell $(PSQL) -U $(USER_NAME) -d $(DB_NAME) -t -c "SELECT string_agg(format('%I', tablename), ', ') FROM pg_tables WHERE schemaname = 'public';" | tr -d '\n')

all: install start

install: init-env install-backend install-frontend

init-env:
	@echo "Initialize PostgreSql database environment"
	@chmod +x $(INIT_ENV)
	@$(INIT_ENV)

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
	@cd $(FRONTEND_DIR) && $(NPM) run dev

start:
	@echo "Starting backend and frontend..."
	cd $(BACKEND_DIR) && . venv/bin/activate && (uvicorn app.main:app --reload &); 
	cd $(FRONTEND_DIR) && $(NPM) run dev

stop-process:
ifeq ($(OS),Windows_NT)
	@powershell -Command ^
	"Get-CimInstance Win32_Process | ^
	 Where-Object { \$_.CommandLine -like '*$(PROC_MATCH)*' } | ^
	 Select-Object -First 1 | ^
	 ForEach-Object { Stop-Process -Id \$_.ProcessId -Force }"
else
	@pkill -f "$(PROC_MATCH)"
endif

stop-backend:
	@$(MAKE) stop-process PROC_MATCH="uvicorn app.main:app"

stop-frontend:
	@$(MAKE) stop-process PROC_MATCH="/bin/sh -c cd ./frontend && /opt/homebrew/bin/npm run dev"

stop: stop-backend stop-frontend

db: init-env reset create fill

create:
	$(PSQL) -U $(USER_NAME) -d $(DB_NAME) -f $(CREATE_SCRIPT)

reset:
	$(DROPDB) -U $(USER_NAME) --if-exists $(DB_NAME) && $(CREATEDB) -U $(USER_NAME) $(DB_NAME)

fill:
	$(PSQL) -U $(USER_NAME) -d $(DB_NAME) -f $(FILL_SCRIPT)

truncate:
	$(PSQL) -U $(USER_NAME) -d $(DB_NAME) -c "TRUNCATE TABLE $(TABLES) RESTART IDENTITY CASCADE;"

rfill: truncate fill


clean: truncate
	@echo "Cleaning up..."
	@rm -rf $(VENV)
	@rm -rf $(FRONTEND_DIR)/node_modules
	@rm -rf $(FRONTEND_DIR)/dist

.PHONY: all install init-env install-backend install-frontend start-backend start-frontend start stop-backend stop-frontend stop clean