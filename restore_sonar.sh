#!/bin/sh
IMAGE=backup
docker ps --all
docker stop $IMAGE
docker ps --all
docker rm $IMAGE
docker ps --all
echo running...
docker run -d --name $IMAGE -v ${COMPOSE_PROJECT_NAME}_sonardbvol:/var/lib/postgresql/data postgres
echo sleeping...
sleep 20
cat $1/sonar.sql | docker exec -i $IMAGE psql -Upostgres
docker stop $IMAGE
docker rm $IMAGE
docker ps --all
