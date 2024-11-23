docker cp ./dbt_brewery/brew.csv brewery-dw-clickhouse-server-1:/var/lib/clickhouse/user_files/brew.csv
docker cp ./clickhouse.config.d/ingest.sql brewery-dw-clickhouse-server-1:/ingest.sql
docker exec -t brewery-dw-clickhouse-server-1 clickhouse-client --queries-file ingest.sql