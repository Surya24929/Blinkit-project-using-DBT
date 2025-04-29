{{
    config(
        materialized='table',
        database = 'Blinkit',
        schema = 'sliver'
    )
}}
select C.customer_id ,customer_name , CUSTOMER_SEGMENT,TOTAL_ORDERS ,AVG_ORDER_VALUE,
order_id ,RATING ,SENTIMENT
FROM {{ ref('stg_customer') }} as C JOIN {{ ref('stg_customer_feedback') }} CF
 ON C.CUSTOMER_ID = CF.CUSTOMER_ID