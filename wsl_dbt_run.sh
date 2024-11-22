#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

# Change directory to dbt_brewery
cd dbt_brewery

# Run dbt with specified number of threads
dbt run --threads 4 "$@"