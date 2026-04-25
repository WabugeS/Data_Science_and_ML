--Mini Project: Sales Analyst Challenge
--Scenario: You’re a junior analyst at a global retail company. Use all five tables to answer real business questions.

--Task 1: Explore the Data
--Preview the first 10 rows of each table.
SELECT * FROM fact_sales
LIMIT 10;

SELECT * FROM dim_customer
LIMIT 10;

SELECT * FROM dim_date
LIMIT 10;

SELECT * FROM dim_product
LIMIT 10;

SELECT * FROM dim_store
LIMIT 10;



--Task 2: Customer Filtering
--Find all female customers from Japan OR who joined after 2023-01-01. Show their full name, email, and country.
SELECT
	first_name,
	last_name,
	email,
	country,
	gender,
	join_date
FROM dim_customer
WHERE gender = 'F' AND ((country = 'Japan' OR join_date >'2023-01-01'));

--Task 3: Pattern Search
--Find all customers whose first name starts with “T” and is exactly 4 characters long.
SELECT * FROM dim_customer
WHERE first_name LIKE 'T___';

--OR 
SELECT * FROM dim_customer
WHERE first_name LIKE 'T%' 
  AND LENGTH(TRIM(first_name)) = 4;

--Task 4: Top Products by Price
--Show the 5 most expensive products, displaying product name, category, brand, and price sorted descending.
SELECT
	product_name,
	category,
	brand,
	unit_price
FROM dim_product
ORDER BY unit_price DESC 
LIMIT 5;

--Task 5: Category Summary
--For each product category, calculate the average and total unit price. Only show categories where the average price exceeds 500.
SELECT
	category,
	ROUND(AVG(unit_price),2) AS avg_price,
	ROUND(SUM(unit_price),2) AS total_price
FROM dim_product
GROUP BY Category
HAVING (AVG(unit_price)) > 500;

--Task 6: Store Overview
--Show all stores in the ‘East’ region, ordered alphabetically by store name.
SELECT 
	store_name,
	region	
FROM dim_store
WHERE region = 'East'
ORDER BY store_name ASC;

--Bonus Challenge
--Find the top 3 brands by average product price, but only for products priced above 200. Round all averages to 2 decimal places.
SELECT
	brand,
	ROUND(AVG(unit_price), 2) AS avg_price
FROM dim_product
WHERE unit_price >200
GROUP BY brand
ORDER BY AVG(unit_price) DESC
LIMIT 3;

--Deliverable: A .sql file with all queries and a comment above each explaining what it does.