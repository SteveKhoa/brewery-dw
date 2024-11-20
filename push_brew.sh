#!/bin/bash

# Define variables
CSV_FILE="brew.csv"
SPLIT_PREFIX="brew_part_"
SPLIT_LINES=100000
DBT_PROJECT_DIR="dbt_brewery"
SEED_DIR="seeds"
SEED_CONFIG_FILE="seeds.yml"
MODEL_FILE="models/combined_brew.sql"

# Step 5: Load the seed data into ClickHouse
echo "Loading seed data into ClickHouse..."
cd $DBT_PROJECT_DIR
dbt seed

# Step 6: Run the dbt model to combine the data
echo "Running dbt model to combine the data..."
dbt run --threads 6 --models combined_brew

echo "Process completed."

