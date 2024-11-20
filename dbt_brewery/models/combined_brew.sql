-- models/combined_brew.sql
WITH
  brew_part_aa AS (
      SELECT *
      FROM {{ ref('brew_part_aa') }}
  ),
  brew_part_ab AS (
      SELECT *
      FROM {{ ref('brew_part_ab') }}
  )
SELECT * FROM brew_part_aa
UNION ALL
SELECT * FROM brew_part_ab

