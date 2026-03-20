-- [monthly_revenue]
SELECT
    order_month,
    ROUND(SUM(revenue), 2)                                   AS monthly_revenue,
    COUNT(DISTINCT order_id)                                 AS order_count,
    ROUND(SUM(revenue) - LAG(SUM(revenue))
        OVER (ORDER BY order_month), 2)                      AS revenue_change,
    ROUND(100.0 * (SUM(revenue) - LAG(SUM(revenue))
        OVER (ORDER BY order_month))
        / LAG(SUM(revenue)) OVER (ORDER BY order_month), 1) AS pct_change
FROM master
WHERE order_month IS NOT NULL
GROUP BY order_month
ORDER BY order_month
-- [end]


-- [top_sellers]
SELECT
    seller_id,
    seller_city,
    seller_state,
    ROUND(SUM(revenue), 2)                           AS total_revenue,
    COUNT(DISTINCT order_id)                         AS total_orders,
    ROUND(AVG(price), 2)                             AS avg_order_value,
    RANK() OVER (ORDER BY SUM(revenue) DESC)         AS revenue_rank
FROM master
GROUP BY seller_id, seller_city, seller_state
ORDER BY total_revenue DESC
LIMIT 20
-- [end]


-- [customer_frequency]
WITH customer_orders AS (
    SELECT
        customer_unique_id,
        COUNT(DISTINCT order_id)           AS order_count,
        ROUND(SUM(payment_value), 2)       AS lifetime_value,
        MIN(order_purchase_timestamp)      AS first_order,
        MAX(order_purchase_timestamp)      AS last_order
    FROM master
    GROUP BY customer_unique_id
)
SELECT
    order_count,
    COUNT(*)                                               AS customer_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1)    AS pct_of_customers
FROM customer_orders
GROUP BY order_count
ORDER BY order_count
-- [end]