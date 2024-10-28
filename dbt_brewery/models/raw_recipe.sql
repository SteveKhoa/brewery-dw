SELECT * FROM
url('https://docs.google.com/spreadsheets/d/{{env_var('GOOGLE_SHEET_ID')}}/export?gid={{env_var('GOOGLE_GID')}}&format=csv')
SETTINGS max_http_get_redirects=1