
docker run -d -p :5432 -e POSTGRES_PASSWORD=postgres --rm -it --name dart_postgres_db -v  ${PWD}\scripts:/docker-entrypoint-initdb.d/ postgres:12.3-alpine

$env:DART_POSTRGRES_DB_HOST=$(docker port dart_postgres_db 5432/tcp) 