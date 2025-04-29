{{
    config(
        materialized='table',
        database = 'Blinkit',
        schema = 'sliver'
    )
}}

SELECT 
  c.customer_id, 
  c.customer_name, 
  o.order_id,
  o.order_date,
  o.order_total,
  p.product_id,
  (p.quantity * p.unit_price) AS total_price
FROM {{ ref('stg_customer') }} c
JOIN {{ ref('stg_order') }} o
  ON c.customer_id = o.customer_id
JOIN {{ ref('stg_order_items') }} p
  ON o.order_id = p.order_id
