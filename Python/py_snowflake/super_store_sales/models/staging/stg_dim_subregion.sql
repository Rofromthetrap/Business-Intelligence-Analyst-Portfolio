with source_data as (
    select * from {{ref('base_orders')}}
),
denormalised as (
SELECT DISTINCT
    POSTAL_CODE POSTAL_CODE_KEY,
    COUNTRY_REGION,
    CITY,
    STATE_PROVINCE,
    CASE
        WHEN SHIP_MODE= 'West'  THEN 1
        WHEN SHIP_MODE = 'East'  THEN 2
        WHEN SHIP_MODE = 'Central'  THEN 3
        WHEN SHIP_MODE = 'South'  THEN 4
    END REGION_KEY
FROM
source_data
)
select * from denormalised