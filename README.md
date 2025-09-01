# E-commerce dataset for SQL analysis

## Project Overview

**Project Title**: Ecommerce Dataset Analysis  
**Level**: Beginner  
**Database**: `SALES`

This project is designed to demonstrate SQL and data analysis skills using a real-world style E-commerce dataset. It focuses on simulating tasks that a data analyst would typically perform when working with online retail data.

The project involves:

Setting up an E-commerce database from raw CSV data

Performing Exploratory Data Analysis (EDA) using SQL and Python (pandas, matplotlib)

Writing SQL queries to answer specific business questions (sales trends, top products, customer insights, payment preferences, etc.)

Applying data cleaning and transformation techniques where required

This project is ideal for beginner to intermediate data analysts who want to practice SQL and EDA techniques, and it serves as a strong portfolio project to showcase SQL proficiency.

## Objectives  

1. **Set up an E-commerce database**: Create and populate an E-commerce sales database with the provided dataset.  
2. **Data Cleaning**: Detect and handle missing, inconsistent, or duplicate records to ensure data quality.  
3. **Exploratory Data Analysis (EDA)**: Perform exploratory analysis using SQL and Python to uncover patterns in customer behavior, sales, and product performance.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `SALES`.
- **Table Creation**: A table named `ecommerce_dataset_10000` is created to store the sales data. The table structure includes columns for customer_id, first_name, last_name, gender, age_group, signup_date, country, product_id, product_name, category, quantity, unit_price, order_id, order_date, order_status, payment_method, rating,review_text.

```sql
CREATE DATABASE SALES;

CREATE TABLE ECOMMERCE_DATASET_10000 (
    gender TEXT,
    age_group TEXT,
    signup_date DATE,
    country TEXT,
    product_id VARCHAR(50),
    product_name TEXT,
    category TEXT,
    quantity INT,
    unit_price INT,
    order_id VARCHAR(50),
    order_date DATE,
    order_status TEXT,
    payment_method TEXT,
    rating INT,
    review_text TEXT
);

```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
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

```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Show all customers from India.**:
```sql
SELECT 
    FIRST_NAME, LAST_NAME, COUNTRY
FROM
    ECOMMERCE_DATASET_10000
WHERE
    COUNTRY = 'INDIA';
```

2. **List all unique product categories.**:
```sql
SELECT DISTINCT
    PRODUCT_NAME
FROM
    ECOMMERCE_DATASET_1000;
```

3. **Find total number of customers by gender.**:
```sql
SELECT 
    GENDER, COUNT(*) AS TOTAL_COUSTOMER
FROM
    ECOMMERCE_DATASET_10000
GROUP BY GENDER;
```

4. **Find the top 5 most expensive products.**:
```sql
SELECT 
    product_name, unit_price
FROM
    ECOMMERCE_DATASET_10000
ORDER BY 2 DESC
LIMIT 5;
```

5. **Get the total sales (quantity × unit_price).**:
```sql
SELECT 
    COUNTRY, SUM(quantity * unit_price) AS TOTAL_SALES
FROM
    ECOMMERCE_DATASET_10000;
```

6. **Get the  top 5 hightest total sales perticular country**:
```sql
SELECT 
    COUNTRY , SUM(quantity * unit_price) AS TOTAL_SALES
FROM
    ECOMMERCE_DATASET_10000
GROUP BY COUNTRY
ORDER BY 2 DESC
LIMIT 5;
```

7. **Find the number of orders per country.**:
```sql
SELECT 
    COUNTRY, COUNT(DISTINCT (ORDER_ID)) AS TOTAL_ORDER
FROM
    ECOMMERCE_DATASET_10000
GROUP BY COUNTRY;
```

8. **Find the average rating per product. **:
```sql
SELECT DISTINCT
    product_name, ROUND(AVG(RATING), 2)
FROM
    ECOMMERCE_DATASET_10000
GROUP BY product_name
ORDER BY 2 DESC;
```

9. **Find customers who placed more than 5 orders.**:
```sql
SELECT 
    FIRST_NAME, COUNT(DISTINCT (order_ID)) AS TOTAL_ORDERS
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
HAVING COUNT(DISTINCT (ORDER_ID)) > 5;
```

10. **Find the most popular payment method.**:
```sql
SELECT DISTINCT
    payment_method, COUNT(payment_method) AS METHODS
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
```

11. **Find top 5 customers who spent the most money.**:
```sql
SELECT 
    CUSTOMER_ID, SUM(quantity * unit_price) AS MOEY_SPEND
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5; 

```
12. **Find the average unit price of each category.**:
```sql
SELECT DISTINCT
    category, AVG(UNIT_PRICE) AS AVG_PRICE
FROM
    ECOMMERCE_DATASET_10000
GROUP BY CATEGORY;
```

13. **Get the top 10 products with the highest total sales.**:
```sql
SELECT 
    product_name, SUM((unit_price * quantity)) AS sales
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
```

14. **Find the most sold product in each category.**:
```sql
SELECT DISTINCT DISTINCT
    (PRODUCT_NAME), CATEGORY, SUM(QUANTITY) AS MOST_SOLD
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1,2
ORDER BY 1,3 DESC;
```

15. **Find the top 3 products in each category based on sales.**:
```sql
SELECT DISTINCT
    (PRODUCT_NAME),
    CATEGORY,
    SUM(quantity * unit_price) AS TOTAL_SALES
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1 , 2
ORDER BY 3 DESC
LIMIT 3;
```

16. **Find the month with the highest sales.**:
```sql
SELECT 
    SUM(quantity * unit_price) AS SALES,
    EXTRACT(MONTH FROM order_date) AS MONTH
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 2
ORDER BY 1 DESC
LIMIT 1; 
```

17. **Find the top 5 countries with the highest number of unique customers.**:
```sql
SELECT 
    COUNTRY, COUNT(DISTINCT (customer_id)) AS NUMBER_CUSTOMER
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

18. **Find customers who gave the lowest rating but spent the most money.**:
```sql
SELECT 
    CUSTOMER_ID,
    MIN(RATING) AS MINIMUME_RATING,
    SUM(unit_price * quantity) AS MOST_SPEND
FROM
    ECOMMERCE_DATASET_10000
GROUP BY 1
ORDER BY 2 ASC , 3 DESC;
```

## Findings

- **Customer Demographics**: The dataset covers customers across multiple countries, genders, and age groups, providing insights into purchasing behaviors.
- **High-Value Transactions**: Certain orders recorded a high total sale amount, indicating premium purchases and loyal customers.
- **Sales Trends**: Monthly and seasonal sales trends highlight peak shopping periods and shifts in demand.
- **Customer Insights**: Analysis revealed the top-spending customers, preferred payment methods, and the most popular product categories.

## Reports

- **E-commerce Sales Summary**: Summary of total revenue, order volumes, and product category performance.
- **Trend Analysis**: Insights into how sales vary by month, season, and customer demographics.
- **Customer Insights**: Reports identifying top buyers, frequently purchased products, and preferred payment methods.
- **Product Performance**: Analysis of product ratings, returns, and reviews to evaluate customer satisfaction.

## Conclusion

This project showcases SQL skills for data analysts by setting up an e-commerce database, cleaning data, performing exploratory data analysis (EDA), and answering business questions through SQL queries. The findings provide valuable insights into customer behavior, sales trends, and product performance, which can be leveraged by businesses to improve marketing strategies, inventory management, and customer experience.
