{{
    config(
        materialized='table',
        schema = 'Gold'
        
    )
}}
select customer_id , customer_name , case when datediff(day ,REGISTRATION_DATE ,LASTEST_ORDER_DATE) >90 then 'inactive' else 'active' end as 
customer_status , total_orders , AVG_ORDER_VALUE
from {{ ref('inter_customer_data') }}


