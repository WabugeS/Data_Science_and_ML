-- first SELECT
SELECT * FROM dim_customer;

--1.FROM: identify which table to use
--2.WHERE: filter individual rows before any grouping; before aggregation
--3.GROUP BY: group the filtered rows
--4.HAVING: filter grouping comes after GROUP BY; after aggregation
--5.SELECT:choose columns and calculate expressions
--6.ORDER BY: sort the final result
--7.LIMIT: return only the top N rows

-- LIMIT
SELECT
	customer_id,
	email
FROM dim_customer
LIMIT 15;

--WHERE
SELECT
FROM dim_customer
WHERE gender = 'F'  --got an error because of space
LIMIT 10;

--TRIM Check for "Invisible" characters (Whitespace)
SELECT *
FROM dim_customer
WHERE TRIM(gender) = 'F' 
LIMIT 10;

--Test a different filter
SELECT *
FROM dim_customer
WHERE gender LIKE '%F%'
LIMIT 10;

SELECT gender, LENGTH(gender) as char_length
FROM dim_customer
LIMIT 10;

SELECT 
	customer_id,
	email,
	gender
FROM dim_customer
WHERE TRIM(gender) = 'M'
LIMIT 10;

--Top 10 female custormers and their countries
SELECT customer_id,first_name,last_name,email,gender,country
FROM dim_customer
WHERE TRIM(gender) = 'F' 
LIMIT 10;

--Top 10 female custormers from Bolivia
SELECT customer_id,first_name,last_name,email,gender,country
FROM dim_customer
WHERE TRIM(gender) = 'F' AND country = 'Bolivia'
LIMIT 10;
	
SELECT customer_id,first_name,last_name,email,gender,country
FROM dim_customer
WHERE(gender) = 'F' OR country = 'Bolivia'
LIMIT 10;

SELECT
	country,
	first_name,
	last_name,
	gender
FROM dim_customer
WHERE (gender = 'M') AND country = 'Bolivia';

SELECT
	country,
	first_name,
	last_name,
	gender
FROM dim_customer
WHERE (gender = 'M') AND ((country = 'Bolivia' OR join_date >'2022-01-01'));

--LIKE  gives all names that starts with a T
SELECT *
FROM dim_customer
WHERE first_name LIKE 'T%'; 

-- name starts with a T, 2 characters before f.The underscore is a place holder
SELECT *
FROM dim_customer
WHERE first_name LIKE 'T__f%y'; 

--first name ends with a y
SELECT *
FROM dim_customer
WHERE first_name LIKE '%y';

--SORTING
SELECT *
FROM dim_product
ORDER BY unit_price DESC
LIMIT 10;

--AGGREGATE FUNCTIONS
--GROUP BY
SELECT 
	category,
	ROUND(AVG(unit_price),2) AS avg_price,
	ROUND(SUM(unit_price),2) AS total_price
FROM dim_product
WHERE brand = 'BrandC'
GROUP BY category
HAVING AVG(unit_price) >500;







