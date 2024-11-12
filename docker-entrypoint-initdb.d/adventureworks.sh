psql -c "CREATE DATABASE \"Adventureworks\";"
cd "/adventureworks"
PGPASSWORD=postgres psql -U postgres -d Adventureworks < /adventureworks/install.sql
psql -c "CREATE DATABASE \"superset\";"