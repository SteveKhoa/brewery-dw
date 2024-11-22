#!/bin/bash

CSV_FILE="brew.csv"
SPLIT_PREFIX="brew_part_"
SPLIT_LINES=50000
DBT_PROJECT_DIR="dbt_brewery"
SEED_DIR="seeds"
SEED_CONFIG_FILE="seeds.yml"
MODEL_FILE="models/combined_brew.sql"

cd "$DBT_PROJECT_DIR"

echo "Splitting $CSV_FILE into smaller files..."
split -l $SPLIT_LINES $CSV_FILE $SPLIT_PREFIX

echo "Moving split files to $SEED_DIR..."
# mkdir -p $SEED_DIR
for file in ${SPLIT_PREFIX}*; do
    mv "$file" "$SEED_DIR/$file.csv"
done

for file in ${SEED_DIR}/${SPLIT_PREFIX}*.csv; do
    seed_name=$(basename "$file" .csv)
    echo "    $seed_name:" >> $SEED_CONFIG_FILE
    echo "      description: \"Part of the brew data\"" >> $SEED_CONFIG_FILE
done

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

dbt seed

dbt run --models combined_brew