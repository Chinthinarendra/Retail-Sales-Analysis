use ecommerc;
select * from transaction_fact_table;
select * from product_dimension;
select * from customer_dimension;

# To understand the data
-- Confirm row counts
select count(*) as rows_count from transaction_fact_table;
select count(*) as rows_count from customer_dimension;
select count(*) as rows_count from product_dimension;

-- Inspect table structures 
describe customer_dimension;
describe transcation_fact_table;
describe product_dimension;

-- Check date range and numeric ranges
select min(Order_Date) as first_order_date
from transaction_fact_table;
select max(Order_Date) as last_order_date
from transaction_fact_table;

select 
max(Sales_Amount) as max_sales,
min(Sales_Amount) as min_sales,
avg(Sales_Amount) as avg_sales,
min(Quantity) as min_Quantity,
max(Quantity) as max_Quantity
from transaction_fact_table;

#identify duplicate records 

SELECT
    Transaction_ID,
    Order_ID,
    Order_Date,
    Customer_ID,
    Product_ID,
    Quantity,
    Sales_Amount,
    COUNT(*) AS duplicate_count
FROM transaction_fact_table
GROUP BY
    Transaction_ID,
    Order_ID,
    Order_Date,
    Customer_ID,
    Product_ID,
    Quantity,
    Sales_Amount
HAVING COUNT(*) > 1;

--
ALTER TABLE transaction_fact_table
ADD COLUMN Row_ID BIGINT AUTO_INCREMENT UNIQUE;
SET SQL_SAFE_UPDATES=0;
--

#delete duplicate records 

delete from transaction_fact_table
where Row_ID in(
select Row_ID from 
(select Row_ID,row_number() over(partition by Transaction_ID,Order_ID,Order_Date,Customer_ID,Product_ID,Quantity,Sales_Amount order by Row_ID) as rn
from transaction_fact_table) as t
where rn>1);

#Profile missing values

SELECT
    COUNT(*) AS total_rows,
    SUM(Customer_ID IS NULL) AS missing_customer_id,
    SUM(Payment_Method IS NULL) AS missing_payment_method,
    SUM(Delivery_Days IS NULL) AS missing_delivery_days,
    SUM(Customer_Rating IS NULL) AS missing_customer_rating,
    SUM(Inventory_Level IS NULL) AS missing_inventory_level,
    SUM(Promotion_Code IS NULL) AS missing_promotion_code,
    SUM(Return_Reason IS NULL) AS missing_return_reason
FROM transaction_fact_table;

#update colunms

UPDATE transaction_fact_table
SET Payment_Method = 'Unknown'
WHERE Payment_Method ="" or Payment_Method is null;

UPDATE transaction_fact_table
SET Customer_Rating = 'Others'
WHERE Payment_Method is null OR TRIM(Payment_Method) = '';

# Identify invalid or suspicious values 
-- Non-positive quantities
SELECT * 
FROM  transaction_fact_table
WHERE Quantity <= 0;

-- Negative sales amounts 
SELECT *
FROM transaction_fact_table
WHERE Sales_Amount < 0;
 
-- Unusual customer ages 
SELECT *
FROM Customer_dimension
WHERE Customer_Age < 18
   OR Customer_Age > 100;