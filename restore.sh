#!/bin/bash

DB_NAME=$1
BACKUP_FILE=$2

export PGPASSWORD="MfhmfWfRua"

DB_USER="postgres"
DB_HOST="teste-idigital-postgres.gov.st"
DB_PORT="5432"

echo "Restoring database: $DB_NAME"
echo "Using backup file: $BACKUP_FILE"

psql -U "$DB_USER" \
     -h "$DB_HOST" \
     -p "$DB_PORT" \
     -d "$DB_NAME" \
     -f "$BACKUP_FILE"

echo "Restore completed"


# Guide to run bash
# ./bashfilename <DB_NAME> <BACKUP_FILE_NAME>
