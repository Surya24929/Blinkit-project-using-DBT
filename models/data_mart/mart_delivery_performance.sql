-- models/data_mart/mart_delivery_performance.sql

{{
    config(
        materialized = 'table',
        schema = 'gold'
    )
}}

with filtered_feedback as (
    select
        order_id,
        rating,
        feedback_category
    from {{ ref('stg_customer_feedback') }}
    where feedback_category = 'Delivery'
)

select
    dp.customer_id,
    count(dp.order_id) as total_orders,
    sum(dp.is_late_delivery) as total_late_orders,
    (sum(dp.is_late_delivery) * 100.0) / count(dp.order_id) as late_delivery_percentage,
    (100 - (sum(dp.is_late_delivery) * 100.0) / count(dp.order_id)) as on_time_delivery_percentage,
    
    avg(ff.rating) as avg_satisfaction_score,
    avg(case when dp.is_late_delivery = 1 then ff.rating else null end) as avg_satisfaction_late_orders,
    avg(case when dp.is_late_delivery = 0 then ff.rating else null end) as avg_satisfaction_on_time_orders, feedback_category

from {{ ref('inter_delivery_stats') }} dp
join filtered_feedback ff
    on dp.order_id = ff.order_id

group by dp.customer_id ,feedback_category
