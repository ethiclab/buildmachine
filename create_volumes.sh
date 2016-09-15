#!/bin/sh
docker volume create --name ${COMPOSE_PROJECT_NAME}_jenkinsvol
docker volume create --name ${COMPOSE_PROJECT_NAME}_nexusvol
docker volume create --name ${COMPOSE_PROJECT_NAME}_sonardbvol
