SELECT
   {{ dbt_utils.generate_surrogate_key(['product_id']) }}
 AS order_user_sk,
    date
FROM {{ ref('stg_inventory') }}
