#!/bin/bash
set -e

if [ -z "$DBNAME" ]
then
    exec "$@"
else
    PGPASSWORD="$ADMIN_PASSWORD" psql -h "$HOST" -p "$PORT" -U "$ADMIN_USER" -c "CREATE USER \"$USER\";"
    PGPASSWORD="$ADMIN_PASSWORD" psql -h "$HOST" -p "$PORT" -U "$ADMIN_USER" -c "ALTER USER \"$USER\" PASSWORD '$PASSWORD';"
    PGPASSWORD="$ADMIN_PASSWORD" psql -h "$HOST" -p "$PORT" -U "$ADMIN_USER" -c "CREATE DATABASE \"$DBNAME\" OWNER \"$USER\";"
fi
