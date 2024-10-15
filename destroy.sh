docker stop clickhouse-server | xargs docker rm

docker volume rm \
    clickhouse-volume 