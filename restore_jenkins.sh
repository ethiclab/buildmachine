#!/bin/sh
docker run --rm -v buildmachine_jenkinsvol:/var/jenkins_home -v $(pwd)/backup:/backup ubuntu bash -c "cd /var && tar xvfz /$1 --strip 1"
