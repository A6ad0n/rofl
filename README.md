# Database ROFL Visualizer
ROFL stands for Rural Oversimplification, Flaky Logic

A web app to visualize PostgreSQL database tables, columns, and constraints.

- [Manual Setup](#setup)
- [Setup With make]($setup-with-make)

## Manual Setup

### Backend
1. Navigate to `backend/`.
2. Create a virtual environment: `python3 -m venv venv`
3. Activate it: `source venv/bin/activate`
4. Install dependencies: `pip install -r requirements.txt`
5. Create a `.env` file with `DATABASE_URL=postgresql://username:password@localhost:5432/database_name`
6. Set up PostgreSQL and run `scripts/schema.sql` to create tables.
7. Start the server: `uvicorn app.main:app --reload`

### Frontend
1. Navigate to `frontend/`.
2. Install dependencies: `npm install`
3. Start the dev server: `npm run dev`

### Database
- Run `scripts/schema.sql` in PostgreSQL to create tables.
- Optionally, run `scripts/seed.sql` to insert sample data.

## Setup With Make

You can automate the setup process using make: `make install`

This will prompt you for server name, database name, port, username, and password with default values provided.
After running the make commands, your backend and frontend will be set up and ready for development.

To start the app run `make start`