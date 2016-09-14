#!/bin/sh
docker volume create --name buildmachine_jenkinsvol
docker volume create --name buildmachine_nexusvol
docker volume create --name buildmachine_sonardbvol
