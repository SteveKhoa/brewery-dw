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
        END AS color_transformed
    from wrong_title_cleaned
)

select 
    title,
    style,
    size,
    og,
    fg,
    abv,
    ibu,
    color_transformed as color,
    views,
    brewed,
    author,
    boil_size,
    boil_time,
    boil_gravity,
    efficiency,
    mash_thickness,
    sugar_scale,
    brew_method,
    pitch_rate,
    primary_temp,
    priming_method,
    priming_amount,
    creation_date,
    notes
from color_mapping