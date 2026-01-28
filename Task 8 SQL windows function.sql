CREATE DATABASE sales_db;
USE sales_db;
CREATE SCHEMA sales_db;

CREATE TABLE sales_db.orders (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales DECIMAL(10,2)
);

SELECT * FROM sales_db.orders LIMIT 10;
SELECT COUNT(*) AS total_records
FROM sales_db.orders;

SELECT *
FROM sales_db.orders
WHERE category = 'Technology';

SELECT product_name, sales
FROM sales_db.orders
ORDER BY sales DESC
LIMIT 10;

SELECT category,
       SUM(sales) AS total_sales
FROM sales_db.orders
GROUP BY category;

SELECT category, SUM(sales) AS total_sales
FROM sales_db.orders
GROUP BY category
INTO OUTFILE '/tmp/category_sales.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT category, SUM(sales) AS total_sales
FROM sales_db.orders
GROUP BY category
INTO OUTFILE '/tmp/category_sales.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';



