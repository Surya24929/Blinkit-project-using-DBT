select c.customer_id , c.customer_name , c.registration_date , {{date_change('o.order_Date')}} as lastest_order_Date, c.CUSTOMER_SEGMENT , c.TOTAL_ORDERS , c.AVG_ORDER_VALUE
 ,ORDER_TOTAL as total_spend 
from {{ ref('stg_customer') }} as c  join (select customer_id ,max(order_Date) as order_Date ,sum(order_total)
as order_total from {{ ref('stg_order') }} group by customer_id) as o on
c.customer_id = o.customer_id

     
       

