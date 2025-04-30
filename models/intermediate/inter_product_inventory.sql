select p.product_id , product_name , category,shelf_life_days , DAMAGED_STOCK
from {{ ref('stg_products') }} as p join {{ ref('stg_inventory') }} as i on
p.PRODUCT_ID=i.PRODUCT_ID