psql -c "CREATE DATABASE \"Adventureworks\";"
psql -d Adventureworks < /adventureworks/install.sql
psql -c "CREATE DATABASE \"superset\";"