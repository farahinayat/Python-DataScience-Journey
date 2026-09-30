USE data_analytics;
SELECT 
	order_id,
    product,
    quantity*unit_price AS order_value,
    SUM(quantity*unit_price) OVER() AS total_revenue
FROM ecommerce_sales;

SELECT 
	order_id,
    product,
    city,
    quantity*unit_price AS order_value,
    SUM(quantity*unit_price) OVER(PARTITION BY city) AS city_revenue
FROM 
	ecommerce_sales;

SELECT 
	order_id,
    product,
    city,
    quantity*unit_price AS order_value,
    RANK() OVER(
    PARTITION BY city
    ORDER BY quantity*unit_price DESC
    ) AS order_rank
FROM 
	ecommerce_sales;

SELECT 
	order_id,
    product,
    city,
    quantity*unit_price AS order_value,
    DENSE_RANK() OVER(
    PARTITION BY city
    ORDER BY quantity*unit_price DESC
    ) AS order_rank
FROM 
	ecommerce_sales;

SELECT 
	order_id,
    product,
    quantity*unit_price AS order_value,
    LAG(quantity*unit_price) OVER(
		ORDER BY order_id
        ) AS previous_order_value
FROM 
	ecommerce_sales;

SELECT 
	order_id,
    product,
    city,
    quantity*unit_price AS order_value,
    SUM(quantity*unit_price) OVER(
		PARTITION BY city
		ORDER BY order_id
        ) AS city_running_revenue
FROM 
	ecommerce_sales;


WITH order_rank AS (
	SELECT 
		order_id,
		city,
		quantity*unit_price AS order_value,
		ROW_NUMBER() OVER(
			PARTITION BY city
			ORDER BY quantity*unit_price DESC
			) AS rank_order
	FROM ecommerce_sales
)
    
SELECT
	order_id,
    city,
    order_value,
	rank_order
FROM order_rank
WHERE rank_order<=3;

With revenue_by_product AS(
	SELECT 
		product,
		city,
		SUM(quantity*unit_price) AS product_revenue,
		DENSE_RANK() OVER(
        PARTITION BY city
		ORDER BY SUM(quantity*unit_price) DESC
		) AS revenue_rank
	FROM ecommerce_sales
    GROUP BY product,city
	
)

SELECT 
	product,
    city,
    product_revenue,
    revenue_rank
FROM revenue_by_product
WHERE revenue_rank <=3
ORDER BY city, revenue_rank;

SELECT 
	customer_id,
	order_id,
    quantity*unit_price AS order_value,
    LAG(quantity*unit_price) OVER(
    PARTITION BY customer_id
    ORDER BY order_id 
    ) AS previous_order_value,
    (quantity*unit_price)-(
    LAG(quantity*unit_price) OVER(
    PARTITION BY customer_id
    ORDER BY order_id 
    )) AS order_value_difference
    
FROM ecommerce_sales;

WITH customer_orders AS (
    SELECT 
        customer_id,
        order_id,
        quantity * unit_price AS order_value,
        LAG(quantity * unit_price) OVER(
            PARTITION BY customer_id
            ORDER BY order_id
        ) AS previous_order_value
    FROM ecommerce_sales
)
SELECT
    customer_id,
    order_id,
    order_value,
    previous_order_value,
    order_value - previous_order_value AS order_value_difference,
    (order_value - previous_order_value)/previous_order_value *100 AS percentage_change
    
FROM customer_orders;
    

    



	

        
    
    
    
    