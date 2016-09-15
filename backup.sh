#!/bin/sh
docker run --rm --volumes-from ${COMPOSE_PROJECT_NAME}_backup_1 -v $(pwd)/backup/$2:/backup/$2 ubuntu tar cvfz /backup/$2/$3 $1
