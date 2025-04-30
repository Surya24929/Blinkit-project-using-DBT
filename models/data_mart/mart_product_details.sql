{{
    config(
        materialized='table',
        schema = 'Gold',
        tags = 'FINAL'
    )
}}
select category ,count(category) as count_categories , avg(MARGIN_PERCENTAGE) as avg , avg(SHELF_LIFE_DAYS) as avg_self  , sum(DAMAGED_STOCK)
 as damaged , SUM(P.PRICE*DAMAGED_STOCK) AS TOTAL_DEMAGE_COST from {{ ref('stg_products') }} as  p join
{{ ref('stg_order_items') }}  as o on p.product_id=o.product_id join {{ ref('stg_inventory') }} as  i on p.product_id=i.product_id

group by category