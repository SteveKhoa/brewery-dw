-- THIS IS AN EXTREMELY BAD PRACTICE TO USE DBT TO INGEST DATA.
-- ONLY FOR THE FUN OF THIS PROJECT.
SELECT * FROM
url('https://docs.google.com/spreadsheets/d/1SqiWJW_57nm3HKEtvxYvF6Chb6pfalFh4Doo3UU1lcs/export?gid=219143368&format=csv')

SETTINGS max_http_get_redirects=1