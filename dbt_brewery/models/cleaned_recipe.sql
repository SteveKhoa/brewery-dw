with wrong_title_cleaned as (
    select * from {{ ref('raw_recipe') }}
    where style != 'style'
),

color_mapping as (
    select 
        *,
        CASE -- mapping color units '°L' to floats
            WHEN UPPER(substringIndex(color, ' ', -1)) = '°L' THEN CAST(substringIndex(color, ' ', 1) AS FLOAT)
            ELSE NULL -- Handle unexpected cases or units
        END AS color_transformed,
        CASE
            WHEN views LIKE '%K' THEN CAST(REPLACE(views, 'K', '') AS DECIMAL) * 1000
            ELSE CAST(views as decimal)
        END as views_transformed,
        CASE
            WHEN boil_time = 'N/A' THEN NULL
            ELSE CAST(boil_time AS decimal)
        END as boil_time_transformed,
        CASE
            WHEN boil_gravity = 'N/A' THEN NULL
            ELSE CAST(boil_gravity AS decimal)
        END as boil_gravity_transformed,
        CASE
            WHEN efficiency = 'N/A' THEN NULL
            ELSE CAST(efficiency AS float)
        END as efficiency_transformed
    from wrong_title_cleaned
)

select 
    title,
    style,
    author,
    cast(abv as float) as abv,
    cast(ibu as float) as ibu,
    color_transformed as color,
    views_transformed as views,
    cast(brewed AS FLOAT) as brewed,
    boil_time_transformed as boil_time,
    boil_gravity_transformed as boil_gravity,
    efficiency_transformed as efficiency,
    parseDateTimeBestEffort(creation_date) as creation_date
from color_mapping