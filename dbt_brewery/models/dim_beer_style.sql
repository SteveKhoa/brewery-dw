with recipe as (
    select * from {{ ref('cleaned_recipe') }}
)
select 
    generateUUIDv4() as uuid, 
    style as name
from recipe
group by name