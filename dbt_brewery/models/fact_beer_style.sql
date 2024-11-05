with recipe as (
    select * from {{ ref('cleaned_recipe') }}
),

dim_beer_style as (
    select * from {{ ref('dim_beer_style') }}
),

dim_time as (
    select * from {{ ref('dim_time') }}
),

aggr_beer_style as (
    select 
        dim_beer_style.uuid as beer_style_id,
        count(*) as count,
        min(og) as min_og,
        max(og) as max_og,
        min(fg) as min_fg,
        max(fg) as max_fg,
        min(ibu) as min_ibu,
        max(ibu) as max_ibu,
        min(abv) as min_abv,
        max(abv) as max_abv,
        min(color) as min_color,
        max(color) as max_color
    from dim_beer_style, recipe
    where dim_beer_style.name = recipe.style
    group by beer_style_id
)

select 
	dim_time.uuid as time_id, 
	aggr_beer_style.*
from dim_beer_style, dim_time, aggr_beer_style
where dim_beer_style.uuid = aggr_beer_style.beer_style_id