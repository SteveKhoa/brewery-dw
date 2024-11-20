#!/bin/bash

# Define variables
CSV_FILE="brew.csv"
SPLIT_PREFIX="brew_part_"
SPLIT_LINES=100000
DBT_PROJECT_DIR="dbt_brewery"
SEED_DIR="seeds"
SEED_CONFIG_FILE="seeds.yml"
MODEL_FILE="models/combined_brew.sql"

cd "$DBT_PROJECT_DIR"

# Step 4: Create the combined_brew.sql model file
echo "Creating $MODEL_FILE..."
echo "-- models/combined_brew.sql" > $MODEL_FILE
echo "WITH" >> $MODEL_FILE
first=true
for file in ${SEED_DIR}/${SPLIT_PREFIX}*.csv; do
    seed_name=$(basename "$file" .csv)
    if [ "$first" = true ]; then
        first=false
    else
        echo "," >> $MODEL_FILE
    fi
    echo "  $seed_name AS (" >> $MODEL_FILE
    echo "      SELECT *" >> $MODEL_FILE
    echo "      FROM {{ ref('$seed_name') }}" >> $MODEL_FILE
    echo "  )" >> $MODEL_FILE
done
echo "SELECT * FROM" >> $MODEL_FILE
first=true
for file in ${SEED_DIR}/${SPLIT_PREFIX}*.csv; do
    seed_name=$(basename "$file" .csv)
    if [ "$first" = true ]; then
        first=false
    else
        echo "UNION ALL" >> $MODEL_FILE
    fi
    echo "SELECT * FROM $seed_name" >> $MODEL_FILE
done
