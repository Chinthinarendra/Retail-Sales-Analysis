# Exploratory Data Analysis (EDA)

-- Overall business performance
select 
count(*) as Transaction_rows,
round(sum(Sales_Amount),2) as Total_revenue,
sum(Quantity) as Total_units,
round(sum(Profit),2) as Total_profit,
count( distinct Order_ID) as Total_orders,
count( distinct Customer_ID) as Total_customers
from transaction_fact_table;

-- Revenue and profit by year
select 
Order_Year,round(sum(Sales_Amount),2) as revenue, round(sum(Profit),2) as total_profit
from transaction_fact_table
group by Order_Year
order by Order_Year;

-- Monthly sales trend
select 
Year(Order_Date) as sales_year,month(Order_Date) as sales_Month,round(sum(Sales_Amount),2) as Total_Sales
from transaction_fact_table
group by Year(Order_Date),month(Order_Date)
order by Year(Order_Date),month(Order_Date);

-- Product category performance
select
Product_Category,Product_Subcategory,round(sum(t.Sales_Amount),2) as Total_sales
from transaction_fact_table as t
join product_dimension as p
on t.Product_Id=p.Product_ID
group by p.Product_Category,p.Product_Subcategory
order by p.Product_Category,p.Product_Subcategory;
                 -- and
select
p.Product_Category,count(Order_ID) as order_count,round(sum(Sales_Amount),2) as Total_sales,round(sum(Profit),2) as Total_profit
from transaction_fact_table as t
join product_dimension as p
on t.Product_Id=p.Product_ID
group by p.Product_Category
order by Total_sales desc;

-- Customer segment performance
select c.Customer_Segment,round(sum(t.Sales_Amount),2) as Total_sales
from transaction_fact_table as t
join customer_dimension as c
on t.Customer_ID=c.Customer_ID
group by c.Customer_Segment
order by Total_sales desc;

-- Top 10 customers by revenue
select
c.Customer_ID,c.Customer_Name,round(sum(t.Sales_Amount),2) as Total_sales
from transaction_fact_table t
join customer_dimension c
on t.Customer_ID=c.customer_ID
group by Customer_ID,Customer_Name
order by Total_sales desc
limit 10;

-- Sales channel performance
select Sales_Channel,count(distinct Order_ID) as orders_count,
round(sum(Sales_Amount),2) as revenue,round(sum(Profit),2) as profit
from transaction_fact_table
group by Sales_Channel
order by revenue desc;

-- Payment method analysis
select Payment_Method,round(sum(Sales_Amount),2) as revenu,
round(sum(Profit),2) as profit
from transaction_fact_table
group by Payment_Method
order by revenu desc;
 
 -- Return analysis
SELECT
    Return_Flag,
    COUNT(*) AS transaction_count,
    ROUND(SUM(Sales_Amount), 2) AS sales_amount,
    ROUND(SUM(Profit), 2) AS profit
FROM transaction_fact_table
GROUP BY Return_Flag;

-- Return reasons
SELECT
    Return_Reason,
    COUNT(*) AS return_count
FROM transaction_fact_table
WHERE Return_Flag = 'YES'
GROUP BY Return_Reason
ORDER BY return_count DESC;

-- Product sales and recorded inventory
select
p.Product_ID,p.Product_Name,p.Product_Category,
sum(Quantity) as Units_soild,
max(t.Inventory_Level) as Max_recorded_inventory_level,
min(t.Inventory_Level) as Min_recorded_inventory_level,
avg(t.Inventory_Level) as Avg_recorded_inventory_level
from transaction_fact_table as t
join product_dimension as p
on t.Product_ID=p.Product_ID
group by p.Product_ID,p.Product_Name,p.Product_Category
order by Units_soild desc;

-- Shipping and delivery analysis
SELECT
    Shipping_Method,
    COUNT(*) AS transaction_count,
    ROUND(AVG(Delivery_Days), 2) AS average_delivery_days,
    ROUND(AVG(Customer_Rating), 2) AS average_customer_rating
FROM transaction_fact_table
GROUP BY Shipping_Method
ORDER BY average_delivery_days;

-- Customer rating distribution
SELECT
    Customer_Rating,
    COUNT(*) AS transaction_count,
    ROUND(AVG(Profit), 2) AS average_profit
FROM transaction_fact_table
WHERE Customer_Rating IS NOT NULL
GROUP BY Customer_Rating
ORDER BY Customer_Rating;
