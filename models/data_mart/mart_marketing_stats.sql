{{
    config(
        materialized='table',
        schema = 'Gold',
        query_tag = 'market',
        pre_hook = "use warehouse dbt"
    )
}}
with cte as (
select CHANNEL , sum(impressions) as impressions , sum(clicks) as clicks , sum(conversions) as conversions,
sum(spend) as spend , sum(revenue_generated) as revenue_generated 
from {{ ref('inter_marketing') }}
group by channel)
select * , round(revenue_generated/spend,2) as ROAS
FROM cte
