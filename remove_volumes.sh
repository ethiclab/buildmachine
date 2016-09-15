#!/bin/sh
docker volume rm ${COMPOSE_PROJECT_NAME}_jenkinsvol
docker volume rm ${COMPOSE_PROJECT_NAME}_nexusvol
docker volume rm ${COMPOSE_PROJECT_NAME}_sonardbvol
