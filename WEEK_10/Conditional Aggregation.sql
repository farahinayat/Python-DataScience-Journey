SELECT
	COUNT(*) AS total_orders,
    SUM(CASE WHEN quantity>=2 THEN 1 ELSE 0 END) AS high_quntity,
    SUM(CASE WHEN quantity=1 THEN 1 ELSE 0 END) AS unit_quantity
FROM ecommerce_clean;

SELECT 
	COUNT(*) AS total_orders,
    CASE
		WHEN quantity>=2 THEN "High_Quantity" 
		ELSE "Low_quantity" 
		END AS quantity_category,
	SUM(quantity*unit_price) AS orders_revenue
FROM ecommerce_clean
GROUP BY quantity_category;

SELECT 
	city,
	COUNT(*) AS total_orders,
    SUM(CASE
			WHEN quantity>=2 THEN 1 ELSE 0
			END) AS high_quantity_orders,
	SUM(quantity*unit_price) AS city_revenue
FROM ecommerce_clean
GROUP BY city;

SELECT 
	SUM(quantity*unit_price) AS total_revenue,
    COUNT(*) AS total_orders,
    ROUND(
		SUM(quantity*unit_price)/COUNT(*), 
		2
        ) AS average_order_value
FROM ecommerce_clean;

ALTER TABLE ecommerce_clean
MODIFY order_date DATE;

DESCRIBE ecommerce_clean;

SELECT 
	MONTH(order_date) AS order_month,
	MONTHNAME(order_date) AS month_name,
	COUNT(*) AS monthly_orders,
	SUM(quantity * unit_price) AS monthly_revenue
FROM ecommerce_clean
GROUP BY MONTH(order_date),
	MONTHNAME(order_date)
ORDER BY MONTH(order_date);

SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    MONTHNAME(order_date) AS month_name,
    COUNT(*) AS monthly_orders,
    SUM(quantity * unit_price) AS monthly_revenue
FROM ecommerce_clean
GROUP BY 
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY 
    order_year,
    order_month;
    
SELECT 
	product,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(quantity*unit_price) AS product_revenue
FROM ecommerce_clean
GROUP BY product;

WITH product_revenue AS(
	SELECT 
		product,
        SUM(quantity*unit_price) AS total_revenue
	FROM ecommerce_clean
    GROUP BY product
)

SELECT
	product,
    total_revenue,
    DENSE_RANK() OVER(
		ORDER BY total_revenue DESC
        ) AS rank_revenue
FROM product_revenue;

WITH product_revenue AS (
    SELECT
        product,
        SUM(quantity * unit_price) AS total_revenue
    FROM ecommerce_clean
    GROUP BY product
)

SELECT
    product,
    total_revenue,
    ROUND(
        total_revenue / SUM(total_revenue) OVER() * 100,
        2
    ) AS revenue_percentage,
    DENSE_RANK() OVER(
		ORDER BY total_revenue DESC
	) AS revenue_rank
		
FROM product_revenue;
		
	
    