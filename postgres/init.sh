#!/bin/bash

echo ""
echo "*** CREATING DATABASE AND USER ***"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER huyanh WITH PASSWORD 'thuyen12';
    CREATE DATABASE tracnghiem OWNER huyanh;
    ALTER USER huyanh CREATEDB;
    GRANT ALL PRIVILEGES ON DATABASE tracnghiem TO huyanh;
    GRANT ALL PRIVILEGES ON SCHEMA public TO huyanh;
EOSQL

echo ""
echo "*** MIGRATIONS ***"
migrate -path="/docker-entrypoint-initdb.d/schema/" -database="postgres://huyanh:thuyen12@/tracnghiem?host=/var/run/postgresql/" up

echo "*** DONE ***"
