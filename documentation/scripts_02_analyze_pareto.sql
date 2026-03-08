-- Pareto Analysis by State
WITH LateOrders AS (
    SELECT 
        c.customer_state,
        COUNT(*) AS late_count
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
    WHERE o.order_delivered_customer_date > o.order_estimated_delivery_date
    GROUP BY 1
),
CumulativeSum AS (
    SELECT 
        customer_state,
        late_count,
        SUM(late_count) OVER (ORDER BY late_count DESC) AS running_total,
        SUM(late_count) OVER () AS total_late
    FROM LateOrders
)
SELECT 
    customer_state,
    late_count,
    ROUND((running_total / total_late) * 100, 2) AS cumulative_pct
FROM CumulativeSum;
