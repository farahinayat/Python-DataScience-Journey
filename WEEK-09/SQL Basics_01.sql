CREATE DATABASE data_analytics;
USE data_analytics;
SELECT*
FROM ecommerce_sales;
SELECT COUNT(*)
FROM ecommerce_sales;
SELECT Product,Quantity,Unit_Price
FROM ecommerce_sales;
SELECT *
FROM ecommerce_sales
WHERE City = "Islamabad";
SELECT Product,SUM(Quantity) AS total_quantity
FROM ecommerce_sales
GROUP BY Product
ORDER BY total_quantity DESC;
SELECT Product, Unit_Price
FROM ecommerce_sales
WHERE Unit_Price > 50000;
SELECT Product
FROM ecommerce_sales
WHERE Quantity >1;
SELECT Product, Unit_Price
FROM ecommerce_sales
ORDER BY Unit_Price DESC;
SELECT Order_ID,Product, Unit_Price
FROM ecommerce_sales
ORDER BY Unit_Price DESC
LIMIT 3;
SELECT DISTINCT city
FROM ecommerce_sales;
SELECT COUNT(DISTINCT order_id)
FROM ecommerce_sales;
SELECT SUM(quantity) AS total_quantity
FROM ecommerce_sales;
SELECT product, SUM(quantity) AS total_quantity
FROM ecommerce_sales
GROUP BY product
ORDER BY total_quantity DESC;
SELECT SUM(quantity*unit_price) AS total_revenue
FROM ecommerce_sales;
SELECT product, SUM(quantity*unit_price) AS total_revenue
FROM ecommerce_sales
GROUP BY product
ORDER BY total_revenue DESC;
SELECT city, SUM(quantity) AS total_quantity
FROM ecommerce_sales
GROUP BY city
ORDER BY total_quantity DESC;
SELECT product, AVG(unit_price) AS average_price
FROM ecommerce_sales
GROUP BY product;
SELECT product, SUM(quantity) AS total_quantity
FROM ecommerce_sales
GROUP BY product
HAVING total_quantity> 100;
SELECT city, SUM(quantity*unit_price) AS total_revenue
FROM ecommerce_sales
GROUP BY city
HAVING total_revenue >500000;


