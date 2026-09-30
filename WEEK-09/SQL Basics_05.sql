SELECT * FROM data_analytics.customers;
INSERT INTO customers
(customer_id,customer_name,city)
VALUES
(8,"saba","QUetta");
UPDATE customers
SET city="Quetta"
WHERE customer_id=8;
SELECT * FROM customers;
DELETE FROM customers
WHERE customer_name="faran"
AND customer_id=5;
DELETE FROM customers
WHERE customer_name="farah"
AND customer_id=5;

SELECT * FROM customers;
SELECT 
	c.customer_name,
    c.city,
    SUM(o.quantity*o.unit_price) AS customer_spendings
FROM orders o
JOIN customers c
	ON o.customer_id=c.customer_id
GROUP BY c.customer_name,
		c.city,
        c.customer_id
HAVING customer_spendings >
( 
	SELECT AVG(customer_spendings)
    FROM 
		(SELECT 
			c.customer_name,
			c.city,
			SUM(o.quantity*o.unit_price) AS customer_spendings
			FROM orders o
			JOIN customers c
			ON o.customer_id=c.customer_id
			GROUP BY c.customer_name,c.city,c.customer_id
		) AS total_spendings
);

WITH customer_spending AS(
	SELECT
		c.customer_name,
		c.city,
		SUM(o.quantity*o.unit_price) AS customer_spendings
	FROM orders o
	JOIN customers c
		ON o.customer_id=c.customer_id
	GROUP BY c.customer_name,
			c.city,
			c.customer_id
)
SELECT 
	customer_name,
	city,
    customer_spendings
FROM customer_spending
WHERE customer_spendings > (
	SELECT AVG(customer_spendings)
    FROM customer_spending
);

WITH customer_spending AS(
	SELECT
		c.customer_id,
		c.customer_name,
		c.city,
		SUM(o.quantity*o.unit_price) AS customer_spendings
	FROM orders o
	JOIN customers c
		ON o.customer_id=c.customer_id
	GROUP BY c.customer_name,
			c.city,
			c.customer_id
)
SELECT 
	customer_id,
	customer_name,
	city,
    customer_spendings
FROM customer_spending
WHERE customer_spendings > (
	SELECT AVG(customer_spendings)
    FROM customer_spending)
AND customer_spendings > 150000;

WITH customer_orders AS (
	SELECT 
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders
	FROM orders
    GROUP BY customer_id
),
customer_spending AS(
	SELECT 
		customer_id,
        SUM(quantity*unit_price) AS customer_spendings
	FROM orders
    GROUP BY customer_id
)

SELECT 
	o.customer_id,
    o.total_orders,
    s.customer_spendings,
    c.city,
    c.customer_name
FROM customer_orders o
JOIN customer_spending s
	ON o.customer_id=s.customer_id
JOIN customers c
ON o.customer_id=c.customer_id
WHERE
	total_orders > 1
AND customer_spendings > 100000;
    
    

    


