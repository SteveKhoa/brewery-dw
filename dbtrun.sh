env $(cat .env | xargs) > /dev/null
cd dbt_brewery
dbt run --threads 4 $@