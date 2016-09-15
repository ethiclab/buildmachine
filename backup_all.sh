#!/bin/sh
SUFFIX=$(date +"%Y-%m-%d_%H%M%S")
mkdir -p backup/$SUFFIX
./backup_nexus.sh $SUFFIX
./backup_jenkins.sh $SUFFIX
./backup_sonar.sh $SUFFIX
