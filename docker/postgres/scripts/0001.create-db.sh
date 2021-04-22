set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER dart_postgres WITH PASSWORD 'dart_postgres';
    CREATE DATABASE dart_postgres;
    \c dart_postgres;
    CREATE TABLE users (id int, name varchar, age int);
    GRANT ALL PRIVILEGES ON DATABASE dart_postgres TO dart_postgres;
    GRANT ALL PRIVILEGES ON TABLE users TO dart_postgres;
    INSERT INTO users values (1, 'John', 23), (2, 'Mary', 31);
EOSQL