@echo off
REM Prompt the user to enter the path to the SQL file
set /p SQL_FILE_PATH="Enter the path to your SQL file (e.g., C:\path\to\your\file.sql): "

REM Check if ClickHouse is running in Docker or locally
REM Uncomment the appropriate section below

REM --- If ClickHouse is running locally ---
REM clickhouse-client --host localhost < "%SQL_FILE_PATH%"

REM --- If ClickHouse is running in Docker ---
docker exec -i clickhouse-server clickhouse-client < "%SQL_FILE_PATH%"
