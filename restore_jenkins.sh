#!/bin/sh
docker run --rm -v ${COMPOSE_PROJECT_NAME}_jenkinsvol:/var/jenkins_home -v $(pwd)/$1:/$1 ubuntu bash -c "cd /var && tar xvfz /$1/jenkins.tar.gz --strip 1"
