#!/bin/bash
pip install clickhouse-connect

superset fab create-admin --username admin --firstname Handsome --lastname Admin --email admin@admin.com --password admin

superset db upgrade

superset init

# Starting server
/bin/sh -c /usr/bin/run-server.sh