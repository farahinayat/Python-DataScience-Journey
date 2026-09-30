
USE data_analytics;
CREATE TABLE orders(
order_id INT,
customer_id INT,
product VARCHAR(50),
quantity INT,
unit_price DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1001, 1, 'Laptop', 2, 85000),
(1002, 2, 'Mobile', 3, 50000),
(1003, 1, 'Headphones', 2, 15000),
(1004, 3, 'Monitor', 1, 45000),
(1005, 4, 'Keyboard', 2, 5000),
(1006, 2, 'Laptop', 1, 85000);

SELECT * FROM orders;


CREATE TABLE customers(
customer_id INT,
customer_name VARCHAR(50),
city VARCHAR(50)
);
INSERT INTO customerS VALUES
(1, 'Ali', 'Islamabad'),
(2, 'Sara', 'Lahore'),
(3, 'Ahmed', 'Karachi'),
(4, 'Ayesha', 'Rawalpindi');

SELECT * FROM customers;

SELECT 
	orders.order_id,
    orders.product,
    orders.quantity,
    customers.customer_name,
    customers.customer_id,
    customers.city
    
    FROM orders
    INNER JOIN customers
    ON orders.customer_id=customers.customer_id;
    
SELECT 
	orders.order_id,
    orders.product,
    orders.quantity,
    customers.customer_name,
    customers.city
    
FROM orders
LEFT JOIN customers
ON orders.customer_id=customers.customer_id;
    
INSERT INTO orders VALUES
(1007, 5, 'Mouse', 2, 3000);

SELECT 
	orders.order_id,
    orders.product,
    orders.quantity,
    customers.customer_name,
	customers.city
    
    FROM orders
    INNER JOIN customers
    ON orders.customer_id=customers.customer_id;
    
    SELECT 
	orders.order_id,
    orders.product,
    orders.quantity,
    customers.customer_name,
    customers.city
    
    FROM orders
    Left JOIN customers
    ON orders.customer_id=customers.customer_id;
    
    SELECT 
        SUM(orders.quantity*orders.unit_price) AS customer_revenue,
        customers.customer_name
	FROM orders
    INNER JOIN customers
    ON orders.customer_id=customers.customer_id
    
    GROUP BY customer_name
    ORDER BY customer_revenue DESC;
    
    
    SELECT 
		customers.customer_name,
		customers.city,
		COUNT(DISTINCT orders.order_id) AS no_of_orders,
        SUM(orders.quantity*orders.unit_price) AS total_revenue
	FROM orders
    INNER JOIN customers
    ON orders.customer_id=customers.customer_id
    
    GROUP BY customers.customer_name,customers.city
    ORDER BY total_revenue DESC;
    
    SELECT 
		orders.order_id,
		customers.customer_name,
		customers.city
	FROM customers
    LEFT JOIN orders
    ON customers.customer_id=orders.customer_id
    WHERE orders.order_id IS NULL;
    
INSERT INTO customers VALUES
(6, 'Farah', 'Islamabad');

SELECT 
    customers.customer_name,
    customers.city
FROM orders
LEFT JOIN customers
    ON customers.customer_id = orders.customer_id
    WHERE orders.order_id IS NULL;
    
INSERT INTO orders VALUES
(1008, '6', 'Laptop',2,85000);

SELECT 
	customers.customer_name,
    customers.city,
    SUM(orders.quantity*orders.unit_price) AS customer_revenue
FROM orders
INNER JOIN customers
ON orders.customer_id=customers.customer_id
GROUP BY customers.customer_name, customers.city
ORDER BY customer_revenue DESC
LIMIT 3;

    

    

		
        

    
    
