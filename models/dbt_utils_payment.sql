{{ dbt_utils.deduplicate(
    relation=source('sales', 'order_items'),
    partition_by='order_id',
    order_by="order_id desc",
   )
}}