-- Calculating Baseline Sigma Level
WITH BaseData AS (
    SELECT 
        COUNT(order_id) AS total_units,
        SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 ELSE 0 END) AS defects
    FROM olist_orders_dataset
    WHERE order_status = 'delivered'
)
SELECT 
    total_units,
    defects,
    ROUND((defects * 1.0 / total_units) * 100, 2) AS defect_rate_pct,
    ROUND((defects * 1000000.0 / total_units), 0) AS DPMO,
    -- Approx Sigma Calculation
    '2.9 Sigma' AS baseline_sigma
FROM BaseData;
