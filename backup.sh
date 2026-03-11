#!/bin/bash

export PGPASSWORD="MfhmfWfRuj"

DB_USER="postgres"
DB_HOST="teste-idigital-postgres.gov.st"
DB_PORT="5432"

DATE=$(date +%F_%H-%M-%S)

for DB_NAME in $(psql -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d postgres -t -c "SELECT datname FROM pg_database WHERE datistemplate = false;"); do
  echo "Taking backup of $DB_NAME"
  pg_dump -U "$DB_USER" \
    -h "$DB_HOST" \
    -p "$DB_PORT" \
    -d "$DB_NAME" \
    --clean --if-exists > "${DB_NAME}_backup_${DATE}.sql"
done
