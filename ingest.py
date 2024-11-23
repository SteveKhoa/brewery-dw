import subprocess
import os
import re

if __name__ == "__main__":
    allfiles = os.listdir("./dbt_brewery")
    csvs = list(filter(lambda x: re.match(".*.csv", x), allfiles))
    for csv in csvs:
        subprocess.call(
            [
                "docker",
                "cp",
                f"./dbt_brewery/{csv}",
                f"brewery-dw-clickhouse-server-1:/var/lib/clickhouse/user_files/{csv}",
            ]
        )
    subprocess.call(
            [
                "docker",
                "cp",
                "./clickhouse.config.d/ingest.sql",
                "brewery-dw-clickhouse-server-1:/ingest.sql",
            ]
        )
    subprocess.call(
            [
                "docker",
                "exec",
                "-t",
                "brewery-dw-clickhouse-server-1",
                "clickhouse-client",
                "--queries-file",
                "ingest.sql"
            ]
        )