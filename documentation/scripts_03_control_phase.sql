-- Monitoring Lead Time Stability
WITH DailyLeadTime AS (
    SELECT 
        DATE(order_purchase_timestamp) AS order_date,
        AVG(DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY)) AS avg_lead_time
    FROM olist_orders_dataset
    GROUP BY 1
),
Stats AS (
    SELECT 
        AVG(avg_lead_time) AS grand_mean,
        STDDEV(avg_lead_time) AS std_dev
    FROM DailyLeadTime
)
SELECT 
    order_date,
    avg_lead_time,
    grand_mean AS CL,
    (grand_mean + (3 * std_dev)) AS UCL,
    (grand_mean - (3 * std_dev)) AS LCL
FROM DailyLeadTime, Stats;
