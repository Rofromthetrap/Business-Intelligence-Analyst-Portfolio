
/*joining returned orders to fact table*/
with source_data as (
    select * from raw.super_store_sales.superstore_orders
)
select
    *
from
    source_data

