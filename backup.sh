#!/bin/sh
mkdir -p backup
docker run --rm --volumes-from backup -v $(pwd)/backup:/backup ubuntu tar cvfz /backup/$2-$(date +"%Y%m%d%H%M%S").tar.gz $1
