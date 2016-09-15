#!/bin/sh
docker exec -t ${COMPOSE_PROJECT_NAME}_sonardb_1 pg_dumpall -Upostgres -c > backup/$1/sonar.sql
