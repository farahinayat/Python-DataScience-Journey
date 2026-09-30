CREATE TABLE ecommerce_dirty (
    order_id INT,
    order_date VARCHAR(20),
    product VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    city VARCHAR(50)
);

INSERT INTO ecommerce_dirty
(order_id, order_date, product, quantity, unit_price, city)
VALUES
(2001, '2026-01-05', 'Laptop', 2, 85000, 'Islamabad'),
(2002, '2026-01-06', 'Mobile', 3, 50000, 'Lahore'),
(2003, '2026-01-07', 'Headphones', 2, 15000, 'Rawalpindi'),
(2004, '2026-01-08', 'Laptop', 1, 85000, 'Islamabad'),
(2005, '2026-01-09', 'Mobile', 2, 50000, 'lahore'),
(2006, '2026-01-10', 'Laptop', NULL, 85000, 'Karachi'),
(2007, '2026-01-11', 'Head phones', 1, 15000, 'Islamabad'),
(2008, '2026-01-12', 'Laptop ', 2, 85000, ' Lahore'),
(2009, '2026-01-13', 'Mobile', -1, 50000, 'Karachi'),
(2010, '2026-01-14', 'Keyboard', 2, NULL, 'Rawalpindi'),
(2011, '2026-01-15', 'Mouse', 3, 3000, 'ISLAMABAD'),
(2012, '2026-01-16', 'Laptop', 1, 85000, 'Islamabad'),

-- Duplicate row
(2012, '2026-01-16', 'Laptop', 1, 85000, 'Islamabad'),

(2013, '2026-01-17', 'Mobile', 2, 50000, 'Lahore'),
(2014, '2026-01-18', 'Keyboard', 1, 5000, NULL),
(2015, '2026-01-19', 'Mouse', 2, 3000, 'Karachi'),

-- Duplicate row
(2015, '2026-01-19', 'Mouse', 2, 3000, 'Karachi'),

(2016, '2026-01-20', 'Headphones', 2, 15000, 'Rawalpindi'),
(2017, '2026-01-21', 'Laptop', 1, 85000, 'Lahore'),
(2018, '2026-01-22', 'Mobile', 2, 50000, 'Karachi'),
(2019, '2026-01-23', 'Keyboard', 2, 5000, 'Islamabad'),
(2020, '2026-01-24', 'Laptop', 3, 85000, 'Lahore'),

-- Duplicate row
(2020, '2026-01-24', 'Laptop', 3, 85000, 'Lahore');

SELECT *
FROM ecommerce_dirty;

SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS order_ids,
    COUNT(order_date) AS order_dates,
    COUNT(product) AS products,
    COUNT(quantity) AS quantities,
    COUNT(unit_price) AS prices,
    COUNT(city) AS cities
FROM ecommerce_dirty;

SELECT *
FROM ecommerce_dirty
WHERE quantity IS NULL
   OR unit_price IS NULL
   OR city IS NULL;

UPDATE ecommerce_dirty
SET city= "Unknown"
WHERE city is NULL;

SELECT *
FROM ecommerce_dirty
WHERE city="unknown";

SELECT * 
FROM ecommerce_dirty
WHERE quantity IS NULL;

SELECT 
	AVG(quantity) AS average_quantity,
    MIN(quantity) AS minimum_quantity,
    MAX(quantity) AS maximum_quantity
FROM ecommerce_dirty
WHERE quantity IS NOT NULL;

UPDATE ecommerce_dirty
SET quantity=2
WHERE quantity IS NULL;

SELECT quantity
FROM ecommerce_dirty
WHERE order_id=2006;

SELECT * 
FROM ecommerce_dirty
WHERE unit_price IS NULL;

SELECT 
	product,
    AVG(unit_price) AS average_unit_price
FROM ecommerce_dirty
WHERE 
	product="keyboard"
AND unit_price IS NOT NULL
GROUP BY product;

UPDATE ecommerce_dirty
SET unit_price=5000
WHERE 
	product="keyboard"
AND unit_price IS NULL;

SELECT *
FROM ecommerce_dirty
WHERE order_id = 2010;

SELECT 
	order_id,
    COUNT(*) AS order_count
FROM ecommerce_dirty
GROUP BY order_id
HAVING COUNT(*)>1
ORDER BY order_id;

SELECT *
FROM ecommerce_dirty
WHERE order_id IN (2012,2015,2020)
ORDER BY order_id;

CREATE TABLE ecommerce_clean AS
SELECT *
FROM (
    SELECT
        e.*,
        ROW_NUMBER() OVER (
            PARTITION BY order_id, order_date, product, quantity, unit_price, city
            ORDER BY order_id
        ) AS rn
    FROM ecommerce_dirty e
) AS numbered
WHERE rn = 1;

SELECT * 
FROM ecommerce_clean;

SELECT * 
FROM ecommerce_clean
WHERE quantity<0;

SELECT *
FROM ecommerce_clean
WHERE order_id=2009;

UPDATE ecommerce_clean
SET quantity = 1
WHERE order_id = 2009
  AND quantity < 0;
  
SELECT *
FROM ecommerce_clean
WHERE order_id=2009;

SELECT DISTINCT city
FROM ecommerce_clean
ORDER BY city;

SELECT 
	city,
    TRIM(city) AS cleaned_city
FROM ecommerce_clean;
UPDATE ecommerce_clean
SET city=TRIM(city);

SELECT DISTINCT city
FROM ecommerce_clean
ORDER BY city;

SELECT DISTINCT product
FROM ecommerce_clean
ORDER BY product;

UPDATE ecommerce_clean
SET product = TRIM(product);

SELECT DISTINCT product
FROM ecommerce_clean
ORDER BY product;

UPDATE ecommerce_clean
SET product = 'Headphones'
WHERE product = 'Head phones';

SELECT DISTINCT product
FROM ecommerce_clean
ORDER BY product;

UPDATE ecommerce_clean
SET city = CASE
    WHEN LOWER(TRIM(city)) = 'islamabad' THEN 'Islamabad'
    WHEN LOWER(TRIM(city)) = 'lahore' THEN 'Lahore'
    WHEN LOWER(TRIM(city)) = 'karachi' THEN 'Karachi'
    WHEN LOWER(TRIM(city)) = 'rawalpindi' THEN 'Rawalpindi'
    WHEN LOWER(TRIM(city)) = 'unknown' THEN 'Unknown'
    ELSE TRIM(city)
END;

SELECT DISTINCT city
FROM ecommerce_clean;

SELECT 
	order_id,
    order_date,
    STR_TO_DATE(order_date,"%Y-%m-%d") AS cleaned_date
FROM ecommerce_clean;

DESCRIBE ecommerce_clean;

ALTER TABLE ecommerce_clean
MODIFY order_date DATE;

DESCRIBE ecommerce_clean;

SELECT 
	order_id,
    order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    MONTHNAME(order_date) AS order_month_name
FROM ecommerce_clean
ORDER BY order_id;




