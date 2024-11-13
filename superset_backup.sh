#!/bin/bash

docker exec -t brewery-dw-adventureworks-1 pg_dump --user postgres -Fc superset --file /superset_backup.dump
docker cp brewery-dw-adventureworks-1:/superset_backup.dump ./superset_home