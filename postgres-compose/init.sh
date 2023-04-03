#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER valera WITH ENCRYPTED PASSWORD 'password';
	CREATE DATABASE carmeone;
	GRANT ALL PRIVILEGES ON DATABASE carmeone TO valera;
    ALTER DATABASE carmeone OWNER TO valera;
EOSQL