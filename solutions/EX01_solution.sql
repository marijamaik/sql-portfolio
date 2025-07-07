-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 01 - DATA EXPLORATION & SETUP
-- ============================================================================
-- OBJECTIVE: Understand dataset structure and verify data quality
-- SKILLS: Basic SELECT, COUNT, data types, table relationships
-- BUSINESS CONTEXT: Before analyzing e-commerce data, we need to understand 
--                   what data we have and ensure it's complete and accurate
-- ============================================================================

-- SETUP: Ensure you have loaded the Brazilian E-Commerce dataset
-- If not completed, run: \i setup/database_setup.sql

-- ============================================================================
-- QUESTION 1: Dataset Overview
-- ============================================================================
-- Business Question: What tables do we have and how much data is in each?
-- Write a query to display the record count for each table in the database.
-- Tables to check: customers, orders, order_items, products, sellers, 
--                  order_payments, order_reviews, geolocation

-- Your SQL query here:

SELECT 
    'customers' AS table_name, 
    COUNT(*) AS record_count
FROM customers
UNION ALL
SELECT
    'orders' AS table_name, 
    COUNT(*) AS record_count
FROM orders
UNION ALL
SELECT
    'order_items' AS table_name, 
    COUNT(*) AS record_count
FROM order_items
UNION ALL
SELECT
    'products' AS table_name, 
    COUNT(*) AS record_count
FROM products
UNION ALL
SELECT
    'sellers' AS table_name, 
    COUNT(*) AS record_count
FROM sellers
UNION ALL
SELECT
    'order_payments' AS table_name, 
    COUNT(*) AS record_count
FROM order_payments
UNION ALL
SELECT
    'order_reviews' AS table_name, 
    COUNT(*) AS record_count
FROM order_reviews
UNION ALL
SELECT
    'geolocation' AS table_name, 
    COUNT(*) AS record_count
FROM geolocation
ORDER BY record_count DESC;

/* Output:

"table_name","record_count"
"geolocation","1000163"
"order_items","112650"
"order_payments","103886"
"orders","99441"
"customers","99441"
"order_reviews","98410"
"products","32951"
"sellers","3095"
*/


-- ============================================================================
-- QUESTION 2: Time Range Analysis  
-- ============================================================================
-- Business Question: What time period does our order data cover?
-- Write a query to show:
-- - The earliest order date
-- - The latest order date  
-- - Total number of days the business operated
-- - Number of complete years of data
-- Use the orders table and order_purchase_timestamp column

-- Your SQL query here:

SELECT 
    MIN(order_purchase_timestamp)::DATE as earliest_order,
    MAX(order_purchase_timestamp)::DATE as latest_order,
    (MAX(order_purchase_timestamp)::DATE - MIN(order_purchase_timestamp)::DATE) as total_days,
    EXTRACT(YEAR FROM MAX(order_purchase_timestamp)) - EXTRACT(YEAR FROM MIN(order_purchase_timestamp)) as complete_years
FROM orders
WHERE order_purchase_timestamp IS NOT NULL;

/* Output:

"earliest_order","latest_order","total_days","complete_years"
"2016-09-04","2018-10-17",773,"2"
*/

-- ============================================================================
-- QUESTION 3: Order Status Distribution
-- ============================================================================
-- Business Question: What is our order fulfillment success rate?
-- Write a query to show all unique order statuses and their counts.
-- Include percentage of total orders for each status.
-- Order results by count (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 4: Geographic Coverage
-- ============================================================================
-- Business Question: Which Brazilian states have the most customers?
-- Write a query to show:
-- - State code
-- - Number of customers in each state  
-- - Percentage of total customers
-- Show only the top 10 states by customer count

-- Your SQL query here:




-- ============================================================================
-- QUESTION 5: Product Categories
-- ============================================================================
-- Business Question: What types of products do we sell most?
-- Write a query to show:
-- - Product category name
-- - Number of products in each category
-- - Number of times products from this category were ordered
-- Show top 15 categories by order frequency

-- Your SQL query here:




-- ============================================================================
-- QUESTION 6: Data Quality Check
-- ============================================================================
-- Business Question: Do we have any data quality issues?
-- Write queries to check:
-- a) Orders without corresponding customers
-- b) Order items without valid product references  
-- c) Orders without any order items
-- d) Null values in critical fields

-- Your SQL queries here:

-- a) Orphaned orders:


-- b) Invalid product references:


-- c) Orders without items:


-- d) Critical null values check:




-- ============================================================================
-- QUESTION 7: Basic Business Metrics
-- ============================================================================
-- Business Question: What are our key performance indicators?
-- Write a query to calculate:
-- - Total number of customers
-- - Total number of completed orders
-- - Total number of products sold (sum of quantities)
-- - Average order value (for completed orders)
-- - Average delivery time in days (for delivered orders)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 8: Payment Method Analysis
-- ============================================================================
-- Business Question: How do customers prefer to pay?
-- Write a query to show:
-- - Payment type
-- - Number of payments
-- - Percentage of total payments
-- - Average payment value
-- - Average number of installments
-- Order by number of payments (descending)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 9: Customer Satisfaction Overview
-- ============================================================================
-- Business Question: How satisfied are our customers?
-- Write a query to show:
-- - Each review score (1-5)
-- - Count of reviews for each score
-- - Percentage of total reviews
-- Also calculate overall average rating and percentage of positive reviews (4-5 stars)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 10: Monthly Order Pattern
-- ============================================================================
-- Business Question: How does our order volume change over time?
-- Write a query to show monthly order trends:
-- - Year and month
-- - Number of orders
-- - Number of unique customers  
-- - Average order value
-- Order chronologically from earliest to latest

-- Your SQL query here:


-- ============================================================================