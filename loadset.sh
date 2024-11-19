docker cp ./superset_home/superset_backup.dump  brewery-dw-adventureworks-1:/
docker exec -t brewery-dw-adventureworks-1 dropdb -f --user postgres superset
docker exec -t brewery-dw-adventureworks-1 createdb --user postgres superset
docker exec -t brewery-dw-adventureworks-1 pg_restore --user postgres --dbname superset /superset_backup.dump