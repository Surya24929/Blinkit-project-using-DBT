

select
    o.order_id,
    o.customer_id,o.DELIVERY_PARTNER_ID,
    o.order_date,
    d.PROMISED_TIME,
    d.ACTUAL_TIME,
    case 
        when d.PROMISED_TIME >= d.ACTUAL_TIME then 1
        else 0
    end as is_late_delivery
from {{ ref('stg_order') }} o
join {{ ref('stg_delivery_performance') }} d
    on o.order_id = d.order_id
