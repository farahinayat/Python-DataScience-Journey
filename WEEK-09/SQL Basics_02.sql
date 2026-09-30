USE data_analytics;
SELECT order_id,product,quantity,unit_price,(quantity*unit_price) AS order_value
FROM ecommerce_sales;
SELECT order_id,product,(quantity*unit_price) AS order_value,
	CASE
		WHEN quantity * unit_price >=100000 THEN	"high_value"
		WHEN quantity * unit_price >=50000 THEN	"medium_value"
		ELSE "low_value" 
    END AS order_category
FROM ecommerce_sales;
SELECT order_id,product,quantity,
	CASE
		WHEN quantity >=5 THEN "high_quantity"
        WHEN quantity >=2 THEN "medium_quantity"
        ELSE "low_quantity"
	END AS quantity_category
FROM ecommerce_sales;

SELECT 
	CASE
		WHEN quantity * unit_price >=100000 THEN	"high_value"
		WHEN quantity * unit_price >=50000 THEN	"medium_value"
		ELSE "low_value" 
    END AS order_category,
    
    COUNT(quantity*unit_price) AS no_of_orders
    
FROM ecommerce_sales

GROUP BY order_category;

SELECT
    CASE
        WHEN quantity * unit_price >= 100000 THEN 'High Value'
        WHEN quantity * unit_price >= 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_category,
    
    SUM(quantity * unit_price) AS category_revenue

FROM ecommerce_sales

GROUP BY order_category;

SELECT 
    SUM(quantity * unit_price) AS isb_revenue
FROM ecommerce_sales
WHERE city = 'Islamabad';

SELECT

	SUM(
    CASE 
		WHEN city= "islamabad" THEN quantity*unit_price
        ELSE 0
        END
	) AS isb_revenue
    
FROM ecommerce_sales;

SELECT 
    ROUND(
        SUM(quantity * unit_price) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM ecommerce_sales;

SELECT product,SUM(quantity*unit_price) AS product_revenue
FROM ecommerce_sales
GROUP BY product
ORDER BY product_revenue DESC
LIMIT 3;

