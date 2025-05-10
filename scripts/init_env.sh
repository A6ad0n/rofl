#!/bin/bash

# Скрипт инициализации .env для PostgreSQL

read -p "Server [localhost]: " server
server=${server:-localhost}

read -p "Database [metadata]: " database
database=${database:-metadata}

read -p "Port [5432]: " port
port=${port:-5432}

read -p "Username [postgres]: " username
username=${username:-postgres}

read -sp "Password: " password
echo

cat > backend/.env <<EOF
DATABASE_URL=postgresql://${username}:${password}@${server}:${port}/${database}
EOF

echo ".env created with DATABASE_URL"

export USER_NAME=$username
export DB_NAME=$database
