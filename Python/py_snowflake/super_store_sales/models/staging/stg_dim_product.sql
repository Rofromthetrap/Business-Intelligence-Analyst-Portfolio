with source_data as (
    select * from {{ref('base_orders')}}
),
distinct_columns as(
SELECT DISTINCT
    PRODUCT_ID PRODUCT_KEY,
    CATEGORY PRODUCT_CATEGORY,
    SUB_CATEGORY PRODUCT_SUBCATEGORY,
    PRODUCT_NAME
from
    source_data
)
select * from distinct_columns