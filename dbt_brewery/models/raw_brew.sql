-- models/combined_brew.sql
WITH
  brew_trimmed AS (
      SELECT *
      FROM {{ ref('brew_100k') }}
  )
SELECT * FROM brew_trimmed
