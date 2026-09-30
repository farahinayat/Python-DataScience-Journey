USE data_analytics;

SELECT 
	c.customer_id,
    c.customer_name,
    c.city
FROM customers c
WHERE EXISTS(
	SELECT 1
    FROM orders o
    WHERE o.customer_id=c.customer_id
);

SELECT 
	c.customer_id,
    c.customer_name,
    c.city
FROM customers c
WHERE NOT EXISTS(
	SELECT 1
    FROM orders o
	WHERE 
		o.customer_id=c.customer_id
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

SELECT 
	c.customer_id,
    c.customer_name,
    c.city
FROM customers c
WHERE EXISTS(
	SELECT 1
    FROM orders o
    WHERE o.customer_id=c.customer_id
AND( 
	SELECT SUM(o.quantity*o.unit_price)
	FROM orders o
	WHERE o.customer_id=c.customer_id
	) >100000
);