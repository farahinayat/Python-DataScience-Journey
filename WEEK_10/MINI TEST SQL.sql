USE data_analytics;

SELECT * FROM orders
WHERE unit_price >50000;
SELECT 
	SUM(quantity*unit_price) AS total_revenue
FROM orders;

SELECT 
	COUNT(DISTINCT order_id) AS total_orders
FROM orders;

SELECT 
	customer_id,
    SUM(quantity*unit_price) AS customer_spendings
FROM orders 
GROUP BY customer_id;


SELECT 
	customer_id,
    SUM(quantity*unit_price) AS customer_spendings
FROM orders 
GROUP BY customer_id
HAVING customer_spendings>100000;

SELECT 
	c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY 
	c.customer_name,
    c.city;
    
SELECT 
	c.customer_id,
    c.customer_name,
    c.city
FROM customers c
WHERE NOT EXISTS(
	SELECT 1
    FROM orders o
    WHERE 
		c.customer_id=o.customer_id
);

SELECT 
	order_id,
    unit_price
FROM orders
WHERE unit_price> (
	SELECT 
		AVG(unit_price)
	FROM orders
);

WITH customer_spendings AS (
	SELECT 
		c.customer_id,
		c.customer_name,
        c.city,
        SUM(o.quantity*o.unit_price) AS customer_spending
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY 
	c.customer_id,
    c.customer_name,
    c.city
) 

SELECT 

	customer_id,
	customer_name,
	city,
	customer_spending
    
FROM customer_spendings
WHERE customer_spending >(
	SELECT 
		AVG(customer_spending) 
	FROM customer_spendings
);

SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers c
WHERE EXISTS (
	SELECT 1
    FROM orders o
    WHERE o.customer_id=c.customer_id
		AND (o.quantity*o.unit_price)> 50000
);

        
   