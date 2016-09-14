#!/bin/sh
docker exec -t buildmachine_sonardb_1 pg_dumpall -Upostgres -c > backup/dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
