## DATA VALIDATION

-- Primary business KPIs
SELECT
    COUNT(*) AS Total_Transaction,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Quantity) AS Total_Units_Sold,
    ROUND(SUM(Sales_Amount),2) AS Total_Revenue,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(AVG(Sales_Amount),2) AS Average_Sales
FROM transaction_fact_table;

-- Profit margin
SELECT
    ROUND(SUM(Sales_Amount),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales_Amount),0) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM transaction_fact_table;

-- Compare revenue and profit by category
SELECT
    p.Product_Category,
    ROUND(SUM(t.Sales_Amount),2) AS Revenue,
    ROUND(SUM(t.Profit),2) AS Profit,
    ROUND(
        SUM(t.Profit) / NULLIF(SUM(t.Sales_Amount),0) * 100,
        2
    ) AS Profit_Margin
FROM transaction_fact_table t
JOIN product_dimension p
    ON t.Product_ID = p.Product_ID
GROUP BY p.Product_Category
ORDER BY Revenue DESC;