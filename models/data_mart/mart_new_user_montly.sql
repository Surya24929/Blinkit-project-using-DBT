{{
    config(
        materialized='table',
        schema = 'Gold'
        
    )
}}
with cte as (
  select 
   customer_id, to_char(registration_date, 'YYYY-MM') as registration_year_month , TOTAL_ORDERS
  from {{ ref('inter_customer_data') }}
)
select count(customer_id) as montly_newusers , to_date(registration_year_month, 'YYYY-MM') as registration_year_month
 , sum(TOTAL_ORDERS) as TOTAL_ORDERS from cte 
group by registration_year_month 