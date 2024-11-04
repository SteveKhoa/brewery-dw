@echo off

cd dbt_brewery

dbt run --threads 4 %*