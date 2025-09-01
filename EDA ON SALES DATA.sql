-- Data Cleaning
USE SALES;

-- DELECTING USELESS COLUMNS IN TABLES
ALTER TABLE  ECOMMERCE_DATASET_10000
DROP COLUMN REVIEW_DATE;  

ALTER TABLE  ECOMMERCE_DATASET_10000
DROP COLUMN REVIEW_ID;

-- CHECKING FOR NULL OR BLANK VALUES IN TABLE 
SELECT *
FROM ECOMMERCE_DATASET_10000
WHERE customer_id IS NULL
OR	
first_name IS NULL
OR	
last_name IS NULL
OR	
gender IS NULL
OR
age_group IS NULL
OR	
signup_date IS NULL
OR	
country IS NULL
OR	
product_id IS NULL
OR	
product_name IS NULL
OR	
category IS NULL
OR	
quantity IS NULL
OR	
unit_price IS NULL
OR
order_id IS NULL
OR	
order_date IS NULL
OR	
order_status IS NULL
OR	
payment_method IS NULL
OR	
rating IS NULL
OR
review_text	IS NULL
OR
review_id IS NULL
OR
review_date IS NULL;

-- 1. Show all customers from India.
SELECT 
    FIRST_NAME, LAST_NAME, COUNTRY
FROM
    ECOMMERCE_DATASET_10000
WHERE
    COUNTRY = 'INDIA';

-- 2.List all unique product categories.
SELECT DISTINCT
    PRODUCT_NAME
FROM
    ECOMMERCE_DATASET_1000;

-- 3.Find total number of customers by gender.
SELECT 
    GENDER, COUNT(*) AS TOTAL_COUSTOMER
FROM
    ECOMMERCE_DATASET_10000
GROUP BY GENDER;

-- 4.Find the top 5 most expensive products.
SELECT 
    product_name, unit_price
FROM
    ECOMMERCE_DATASET_10000
ORDER BY 2 DESC
LIMIT 5; 

-- 5.Get the total sales (quantity × unit_price).
SELECT 
    COUNTRY, SUM(quantity * unit_price) AS TOTAL_SALES
FROM
    ECOMMERCE_DATASET_10000;

-- 6.Get the  top 5 hightest total sales perticular country
SELECT 
    COUNTRY , SUM(quantity * unit_price) AS TOTAL_SALES
FROM
    ECOMMERCE_DATASET_10000
GROUP BY COUNTRY
ORDER BY 2 DESC
LIMIT 5;

-- 7.Find the number of orders per country.
SELECT 
    COUNTRY, COUNT(DISTINCT (ORDER_ID)) AS TOTAL_ORDER
FROM
    ECOMMERCE_DATASET_10000
GROUP BY COUNTRY;

-- 8.Find the average rating per product. 
SELECT DISTINCT
    product_name, ROUND(AVG(RATING), 2)
FROM
    ECOMMERCE_DATASET_10000
GROUP BY product_name
ORDER BY 2 DESC;

-- 9. Find customers who placed more than 5 orders. 
SELECT 
    FIRST_NAME, COUNT(DISTINCT (order_ID)) AS TOTAL_ORDERS
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
HAVING COUNT(DISTINCT (ORDER_ID)) > 5;

-- 10.Find the most popular payment method.
SELECT DISTINCT
    payment_method, COUNT(payment_method) AS METHODS
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 11.Find top 5 customers who spent the most money.
SELECT 
    CUSTOMER_ID, SUM(quantity * unit_price) AS MOEY_SPEND
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5; 

-- 12.Find the average unit price of each category.
SELECT DISTINCT
    category, AVG(UNIT_PRICE) AS AVG_PRICE
FROM
    ECOMMERCE_DATASET_10000
GROUP BY CATEGORY;

-- 13.Get the top 10 products with the highest total sales.
SELECT 
    product_name, SUM((unit_price * quantity)) AS sales
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 14. Find the most sold product in each category.
SELECT DISTINCT DISTINCT
    (PRODUCT_NAME), CATEGORY, SUM(QUANTITY) AS MOST_SOLD
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1,2
ORDER BY 1,3 DESC;

-- 15.Find the top 3 products in each category based on sales.
SELECT DISTINCT
    (PRODUCT_NAME),
    CATEGORY,
    SUM(quantity * unit_price) AS TOTAL_SALES
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1 , 2
ORDER BY 3 DESC
LIMIT 3;

-- 16.Find the month with the highest sales.
SELECT 
    SUM(quantity * unit_price) AS SALES,
    EXTRACT(MONTH FROM order_date) AS MONTH
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 2
ORDER BY 1 DESC
LIMIT 1; 

-- 17.Find the top 5 countries with the highest number of unique customers.
SELECT 
    COUNTRY, COUNT(DISTINCT (customer_id)) AS NUMBER_CUSTOMER
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- 18.Find customers who gave the lowest rating but spent the most money.
SELECT 
    CUSTOMER_ID,
    MIN(RATING) AS MINIMUME_RATING,
    SUM(unit_price * quantity) AS MOST_SPEND
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 ASC , 3 DESC; 
