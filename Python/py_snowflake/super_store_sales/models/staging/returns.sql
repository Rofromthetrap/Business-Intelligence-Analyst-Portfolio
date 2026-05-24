/*extracting returns data*/
with source_data as (
    select * from raw.super_store_sales.superstore_returns
)
select
    *
from
    source_data