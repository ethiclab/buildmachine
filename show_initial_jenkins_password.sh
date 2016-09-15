#!/bin/sh
docker exec ${COMPOSE_PROJECT_NAME}_jenkins_1 cat /var/jenkins_home/secrets/initialAdminPassword
