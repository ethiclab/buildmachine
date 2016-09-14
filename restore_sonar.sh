#!/bin/sh
IMAGE=backup
docker ps --all
docker stop $IMAGE
docker ps --all
docker rm $IMAGE
docker ps --all
echo running...
docker run -d --name $IMAGE -v buildmachine_sonardbvol:/var/lib/postgresql/data postgres
echo sleeping...
sleep 20
cat $1 | docker exec -i $IMAGE psql -Upostgres
docker stop $IMAGE
docker rm $IMAGE
docker ps --all
