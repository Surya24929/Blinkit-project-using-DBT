-- models/metrics_total_revenue.sql

SELECT *
FROM {{ metrics.calculate(
    metric('total_orders'),
    
    dimensions=['area']
) }}
