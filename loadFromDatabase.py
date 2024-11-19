import psycopg2
import clickhouse_connect

# Connect to PostgreSQL
pg_conn = psycopg2.connect(dbname="Adventureworks", user="postgres", password="postgres", host="localhost", port=15432)
pg_cursor = pg_conn.cursor()

# Connect to ClickHouse
ch_client = clickhouse_connect.get_client(host="localhost", username="default", port=18123)

# Fetch list of tables from PostgreSQL
pg_cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'purchasing'")
tables = pg_cursor.fetchall()
print (tables)

try:
    for table in tables:
        table_name = table[0]

        # Create ClickHouse table using PostgreSQL engine
        create_sql = f"""
        CREATE TABLE IF NOT EXISTS clickhouse_{table_name} ENGINE = PostgreSQL('adventureworks:5432', 'Adventureworks', '{table_name}', 'postgres', 'postgres','purchasing');
        """
        result = ch_client.command(create_sql)
    
    # No need to insert data again, as data is already available via PostgreSQL engine

# Close connections
    #print (tables)
    print (result)
except Exception as e:
    print(f"Error: {e}")

# Close connections
pg_cursor.close()
pg_conn.close()
