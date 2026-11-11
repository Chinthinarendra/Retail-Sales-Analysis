# Retail Sales Data Analysis Using MySQL

### Data Cleaning, Exploratory Data Analysis (EDA) & Business Insights

## Project Overview

This project focuses on analysing retail sales transaction data using **MySQL** to understand business performance, customer behaviour, product performance, profitability, inventory observations, returns, and delivery operations.

The project involves data exploration, data cleaning, data validation, SQL-based analysis, and business recommendations to support data-driven decision-making.

## Business Objectives

- Analyse overall retail sales and business performance.
- Identify duplicate records and missing values.
- Validate customer and product information.
- Understand revenue and profit trends.
- Identify top-performing products and customer segments.
- Analyse sales channels and payment methods.
- Evaluate product returns and return reasons.
- Examine inventory levels and delivery performance.
- Generate actionable business recommendations.

## Tools & Technologies

- **Database:** MySQL
- **Language:** SQL
- **Analysis:** Exploratory Data Analysis (EDA)
- **Documentation:** Microsoft Word
- **Version Control:** GitHub

## Database Structure

The project uses three main tables:

| Table Name               | Description                                                                                         |
| ------------------------ | --------------------------------------------------------------------------------------------------- |
| transaction_fact_table | Contains transaction details, sales, quantity, profit, returns, shipping and inventory information. |
| customer_dimension     | Contains customer-related information and demographic attributes.                                   |
| product_dimension      | Contains product details, categories and subcategories.                                             |

### Data Relationships

- customer_dimension connects to transaction_fact_table through Customer_ID.
- product_dimension connects to transaction_fact_table through Product_ID.

The transaction table acts as the central fact table, while the customer and product tables provide descriptive information.

## Project Workflow

### 1. Data Understanding and Exploration

- Inspected all database tables.
- Checked table structures and column data types.
- Analyzed total records in each table.
- Identified date ranges and numeric data distributions.

### 2. Data Cleaning

- Identified repeated transaction records.
- Checked exact duplicate combinations.
- Created backup tables before performing deletion operations.
- Analyzed missing values.
- Applied appropriate missing-value handling strategies.

### 3. Data Validation

- Checked invalid quantities and sales values.
- Identified suspicious discount percentages.
- Validated customer and product references.
- Investigated inconsistent and missing records.

### 4. Exploratory Data Analysis (EDA)

Performed SQL analysis to answer important business questions.

**Sales Analysis**

- Total revenue
- Total profit
- Total units sold
- Total orders
- Total customers
- Monthly and yearly sales trends

**Product Analysis**

- Category-wise sales
- Subcategory-wise performance
- Top-performing products
- Product profitability

**Customer Analysis**

- Customer segmentation
- Top 10 customers by revenue
- Customer purchasing behaviour

**Operational Analysis**

- Sales channel performance
- Payment method analysis
- Return status and return reasons
- Inventory observations
- Shipping and delivery performance

## SQL Concepts Used

- SELECT, WHERE and ORDER BY
- GROUP BY and HAVING
- Aggregate functions: SUM(), AVG(), MIN(), MAX(), COUNT()
- DISTINCT
- INNER JOIN and LEFT JOIN
- Subqueries
- CASE statements
- Date functions
- NULL handling
- NULLIF()
- ROW_NUMBER() window function
- Data cleaning using UPDATE and DELETE

## Business Insights

The SQL analysis helps identify:

1. Products and categories contributing to revenue and profit.
2. Customer segments generating higher sales.
3. Monthly and yearly sales patterns.
4. Sales channels with different revenue and profitability levels.
5. Common product return reasons.
6. Products with low recorded inventory levels.
7. Differences in delivery performance across shipping methods.
8. The relationship between revenue, profit and profit margin.

## Business Recommendations

- Focus on products with strong revenue and healthy profit margins.
- Introduce customer loyalty and retention strategies.
- Plan inventory according to sales demand.
- Investigate products with frequent returns.
- Improve product descriptions and quality where necessary.
- Review shipping methods to improve delivery performance.
- Monitor discounts to protect profitability.
- Use monthly sales trends for better business planning.

*Recommendations should be prioritised using the actual results obtained from the SQL queries.*

## Project Folder Structure


## Conclusion

This project demonstrates the use of MySQL for end-to-end retail sales data analysis, starting from data exploration and cleaning to exploratory analysis and business recommendations.

It highlights how SQL can transform raw transaction data into meaningful business information that supports better decision-making.

- Project Title: Retail Sales Data Analysis Using MySQL
- Domain:Retail / E-commerce
- Technology: MySQL and SQL
- Project Type: Data Analyst Portfolio Project





