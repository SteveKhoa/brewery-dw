SET default_table_engine = 'Log';

CREATE TABLE raw_combined_brew AS
SELECT *
FROM file('brew.csv')