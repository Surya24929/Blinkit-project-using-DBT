{{
    config(
        materialized='view',
        schema = 'gold'
    )
}}
with cte as (
select c.customer_id , FEEDBACK_CATEGORY ,area , rating  from {{ ref('stg_customer') }} as c join {{ ref('stg_customer_feedback') }} as f 
on c.customer_id=f.customer_id)
select count(area) as total_areas , area  , round(avg(rating),0) as rating from cte
group by area
