#!/bin/sh
docker run --rm -v ${COMPOSE_PROJECT_NAME}_nexusvol:/sonatype-work -v $(pwd)/$1:/$1 ubuntu bash -c "cd / && tar xpvfz /$1/nexus.tar.gz"
