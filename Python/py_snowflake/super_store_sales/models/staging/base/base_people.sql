with source_data as (
    select * from raw.super_store_sales.superstore_people
)
select
    *
from
    source_data