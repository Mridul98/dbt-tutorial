
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- {{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
    select null as id

),
veg_count as (
    select 
        vegetable, 
        count(celery) as food_count
    from 
        flavours
    group by 
        vegetable
    order by
        vegetable
)

select *
from veg_count

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
