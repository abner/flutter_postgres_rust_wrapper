#!/bin/bash
BASEDIR=$(dirname "$0")
SCRIPTSDIR="$PWD/$BASEDIR/scripts"

docker run -d -p :5432 -e POSTGRES_PASSWORD=postgres --rm -it --name dart_postgres_db -v $SCRIPTSDIR:/docker-entrypoint-initdb.d/ postgres:12.3-alpine && \
export DART_POSTRGRES_DB_HOST=$(docker port dart_postgres_db 5432/tcp) && \
echo $DART_POSTRGRES_DB_HOST | sed -e "s/:/ /" | read ip port && \
export DART_POSTGRES_DB_IP=$ip && \
export DART_POSTGRES_DB_PORT=$port && \
docker logs dart_postgres_db -f