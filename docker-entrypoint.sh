#!/bin/bash
set -e

if [ -z "$DBNAME" ]
then
    exec "$@"
else
    PGPASSWORD="$ADMIN_PASSWORD" psql -h "$HOST" -p "$PORT" -U "$ADMIN_USER" -c "CREATE USER \"$USER\";" 2> /dev/null
    PGPASSWORD="$ADMIN_PASSWORD" psql -h "$HOST" -p "$PORT" -U "$ADMIN_USER" -c "ALTER USER \"$USER\" PASSWORD \"$PASSWORD\";" 2> /dev/null
    PGPASSWORD="$ADMIN_PASSWORD" psql -h "$HOST" -p "$PORT" -U "$ADMIN_USER" -c "CREATE DATABASE \"$DBNAME\" OWNER \"$USER\";" 2> /dev/null
fi
