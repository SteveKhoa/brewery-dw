#!/bin/bash

# Define variables
CSV_FILE="brew.csv"
SPLIT_PREFIX="brew_part_"
SPLIT_LINES=100000
DBT_PROJECT_DIR="dbt_brewery"
SEED_DIR="seeds"
SEED_CONFIG_FILE="seeds.yml"
MODEL_FILE="$DBT_PROJECT_DIR/models/combined_brew.sql"

cd dbt_brewery

# Step 3: Create the seeds.yml configuration file
echo "Creating $SEED_CONFIG_FILE..."
echo "seeds:" >> $SEED_CONFIG_FILE
echo "  dbt_brewery:" >> $SEED_CONFIG_FILE
for file in ${SEED_DIR}/${SPLIT_PREFIX}*.csv; do
    seed_name=$(basename "$file" .csv)
    echo "    $seed_name:" >> $SEED_CONFIG_FILE
    echo "      description: \"Part of the brew data\"" >> $SEED_CONFIG_FILE
done