
/*joining returned orders to fact table*/
with source_data as (
    select * from raw.super_store_sales.superstore_orders
)
select
  s.order_id,
  order_date,
  ship_date,
  returned is_returned, 
  sales ,
  quantity, 
  discount ,
  profit 
from
    source_data s
left join
    raw.super_store_sales.superstore_returns r
on 
    s.order_id = r.order_id

