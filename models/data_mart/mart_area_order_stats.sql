{{
    config(
        materialized='table',
        schema = 'Gold',
        query_tag = 'area',
        pre_hook = "use warehouse dbt"
    )
}}
with cte as (
select  c.* , order_id , ORDER_TOTAL from {{ ref('stg_customer') }} as  c join {{ ref('stg_order') }} as  o  on c.customer_id=o.customer_id)
select area , sum(total_orders) as area_orders , round(avg(ORDER_TOTAL),2) as avg_total
from cte
group by area
order by area_orders desc