USE data_analytics;
SELECT * 
FROM orders
WHERE unit_price > (SELECT
	AVG(unit_price)
    FROM orders
);

SELECT 
	customer_id,
    SUM(quantity*unit_price) AS customer_revenue
FROM orders
GROUP BY customer_id;

SELECT customer_id,
    AVG(customer_revenue)
FROM (
    SELECT 
        customer_id,
        SUM(quantity * unit_price) AS customer_revenue
    FROM orders
    GROUP BY customer_id
) AS customer_sales;

