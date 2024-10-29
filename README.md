# Brewery Operations Data Warehouse

## Script instructions

### Docker scripts

> **Note:** if you are using Windows, mount this repository into WSL before using below scripts. If not, you can write yourself `.bat` scripts.

This project uses local Docker to host ClickHouse. ClickHouse needs one container and one Docker volume to run. 

Here are several utility scripts to automate Docker-related stuffs life cycle, so you don't have to manage them yourself:

- `create.sh`

    Start a ClickHouse container and mount a Docker volume for it.

- `destroy.sh`

    Terminate the ClickHouse container and remove it.
    
    Note, this script does not remove the volume (so the data won't be lost next time you start).
    
- `rmvol.sh`

    Remove the volume (and data will be lost).
- `du.sh`

    This script is not important.

    Only useful when you want to see used resources in your local Docker.

In a typical day of your work, you will do the following:
1. `destroy.sh`, destroy existing ClickHouse containers, so Docker don't confuse itself.
2. `create.sh`, spin up a new ClickHouse (and possibly mount a volume if yet exist).
3. Start doing.

When you want to get a fresh database, remove the volume `rmvol.sh` (only when you are sure).

### dbt scripts

- `dbtrun.sh`

    Execute `dbt run`, with environment variables at `./.env` exported (important).

    Just like normal `dbt run`, you can add more arguments to it. For example, `dbt run --exclude "raw_recipe"`.

    This script runs `dbt` with `--threads 4` by default.