-- 5 star schema
--Dropping tables in the correct order(Fact table first because of Foreign Keys)
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_store;


CREATE TABLE dim_date(
	date_key INT PRIMARY KEY,
	full_date DATE,
	day INT,
	month INT,
	month_name VARCHAR(20),
	quarter INT,
	year INT,
	is_weekend BOOLEAN
	
);
SELECT * FROM dim_date

CREATE TABLE dim_product (
  product_key INT PRIMARY KEY,
  product_id VARCHAR(20),
  product_name VARCHAR(100),
  category VARCHAR(50),
  brand VARCHAR(50),
  unit_price DECIMAL(10,2),
  launch_date DATE);
  
SELECT * FROM dim_product

CREATE TABLE dim_store (
  store_key INT PRIMARY KEY,
  store_id VARCHAR(20),
  store_name VARCHAR(100),
  region VARCHAR(50),
  country VARCHAR(50),
  city VARCHAR(50)
);
SELECT * FROM dim_store

CREATE TABLE fact_sales (
  sales_id INT PRIMARY KEY,
  date_key INT NOT NULL,
  customer_key INT NOT NULL,
  product_key INT NOT NULL,
  store_key INT NOT NULL,
  quantity_sold INT NOT NULL,
  unit_price NUMERIC(10,2) NOT NULL,
  discount NUMERIC(10,2) DEFAULT 0,
  total_amount NUMERIC(10,2) NOT NULL,

  CONSTRAINT fk_fact_date
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),

  CONSTRAINT fk_fact_customer
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),

  CONSTRAINT fk_fact_product
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),

  CONSTRAINT fk_fact_store
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key)
);
SELECT * FROM fact_sales

CREATE TABLE dim_customer (
  customer_key INT PRIMARY KEY,
  customer_id VARCHAR(20),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  gender CHAR(1),
  email VARCHAR(100),
  phone VARCHAR(20),
  country VARCHAR(50),
  state VARCHAR(50),
  city VARCHAR(50),
  join_date DATE
);
SELECT * FROM dim_customer