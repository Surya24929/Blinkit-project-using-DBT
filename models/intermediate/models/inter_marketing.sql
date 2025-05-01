
select campaign_id , campaign_name , channel , impressions , clicks , conversions , spend ,revenue_generated
from {{ ref('stg_marketing_data') }}