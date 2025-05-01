
{{
    config(
        materialized = 'table',
        schema = 'gold'
    )
}}
Select p.product_id , category , product_name ,MARGIN_PERCENTAGE
,sum(quantity * unit_price) as total_price 
, round(sum(quantity * unit_price)*MARGIN_PERCENTAGE/100,2) as profit 
from {{ ref('stg_order_items') }} o join {{ ref('stg_products') }} p on o.product_id=p.product_id
group by p.product_id , category , product_name ,MARGIN_PERCENTAGE
order by total_price desc 