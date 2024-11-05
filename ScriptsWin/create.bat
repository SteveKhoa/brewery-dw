@echo off
REM Pull ClickHouse server image
docker pull clickhouse/clickhouse-server

REM Create a Docker volume for ClickHouse data and logs
docker volume create clickhouse-volume

REM Run the ClickHouse server container
docker run ^
    --name=clickhouse-server ^
    --cpus=1 ^
    --memory=2048m ^
    --memory-swap=2048m ^
    --cap-add=SYS_NICE ^
    --cap-add=NET_ADMIN ^
    --cap-add=IPC_LOCK ^
    -p 18123:8123 ^
    -p 19000:9000 ^
    -p 19009:9009 ^
    -v clickhouse-volume:/var/lib/clickhouse/ ^
    -v clickhouse-volume:/var/log/clickhouse-server/ ^
    --mount type=bind,source="%cd%"\docker-entrypoint-initdb.d,target=/docker-entrypoint-initdb.d ^
    --ulimit nofile=262144:262144 ^
    clickhouse/clickhouse-server
