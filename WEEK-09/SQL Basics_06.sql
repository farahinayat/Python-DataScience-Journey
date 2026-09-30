USE data_analytics;
SELECT
	customer_id,
    SUM(quantity*unit_price) AS total_spendings
FROM orders
GROUP BY customer_id
HAVING SUM(quantity*unit_price) >100000;

SELECT
	customer_id,
    SUM(quantity*unit_price) AS total_spendings
FROM orders
GROUP BY customer_id;

SELECT
	customer_id,
    SUM(quantity*unit_price) AS total_spendings
FROM orders
GROUP BY customer_id
HAVING SUM(quantity*unit_price) >100000
ORDER BY total_spendings DESC;

SELECT
    customer_id,
    SUM(quantity * unit_price) AS total_spendings
FROM orders
GROUP BY customer_id
HAVING SUM(quantity*unit_price) >
(	
	SELECT AVG(total_spendings)
	FROM
	(
        SELECT
			customer_id,
			SUM(quantity * unit_price) AS total_spendings
		FROM orders
		GROUP BY customer_id
	) AS customer_totals
);

SELECT 
	c.customer_id,
    c.city,
    c.customer_name,
    SUM(o.quantity*o.unit_price) AS total_spendings
FROM customers c
JOIN orders o
	ON c.customer_id=o.customer_id
GROUP BY 
	c.customer_id,
    c.city,
    c.customer_name
HAVING SUM(quantity*unit_price) > 100000;

SELECT 
	c.customer_id,
    c.city,
    c.customer_name,
    COUNT(distinct o.order_id) AS total_orders,
    SUM(o.quantity*o.unit_price) AS total_spendings
FROM customers c
JOIN orders o
	ON c.customer_id=o.customer_id
GROUP BY 
	c.customer_id,
    c.city,
    c.customer_name;
    
SELECT 
	c.customer_id,
    c.city,
    c.customer_name,
    COUNT(distinct o.order_id) AS total_orders,
    SUM(o.quantity*o.unit_price) AS total_spendings,
     SUM(o.quantity*o.unit_price)/COUNT(distinct o.order_id) AS avg_order_value
FROM customers c
JOIN orders o
	ON c.customer_id=o.customer_id
GROUP BY 
	c.customer_id,
    c.city,
    c.customer_name;
    
SELECT 
	c.customer_id,
    c.city,
    c.customer_name,
    COUNT(distinct o.order_id) AS total_orders,
    SUM(o.quantity*o.unit_price) AS total_spendings,
     SUM(o.quantity*o.unit_price)/COUNT(distinct o.order_id) AS avg_order_value
FROM customers c
JOIN orders o
	ON c.customer_id=o.customer_id
GROUP BY 
	c.customer_id,
    c.city,
    c.customer_name
HAVING SUM(o.quantity*o.unit_price) > 100000;


    