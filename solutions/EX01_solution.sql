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

SELECT 
    order_status,
    COUNT(*) as order_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) as percentage
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

/* Output:
"order_status","order_count","percentage"
"delivered","96478","97.02"
"shipped","1107","1.11"
"canceled","625","0.63"
"unavailable","609","0.61"
"invoiced","314","0.32"
"processing","301","0.30"
"created","5","0.01"
"approved","2","0.00"
*/


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

SELECT 
    customer_state,
    COUNT(*) as customer_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) as percentage
FROM customers
WHERE customer_state IS NOT NULL
GROUP BY customer_state
ORDER BY customer_count DESC
LIMIT 10;

/* Output:
"customer_state","customer_count","percentage"
"SP","41746","41.98"
"RJ","12852","12.92"
"MG","11635","11.70"
"RS","5466","5.50"
"PR","5045","5.07"
"SC","3637","3.66"
"BA","3380","3.40"
"DF","2140","2.15"
"ES","2033","2.04"
"GO","2020","2.03"
*/

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

SELECT 
    COALESCE(p.product_category_name, 'Unknown') as category,
    COUNT(DISTINCT p.product_id) as products_in_category,
    COUNT(oi.order_id) as times_ordered
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY times_ordered DESC
LIMIT 15;

/* Output:
"category","products_in_category","times_ordered"
"cama_mesa_banho","3029","11115"
"beleza_saude","2444","9670"
"esporte_lazer","2867","8641"
"moveis_decoracao","2657","8334"
"informatica_acessorios","1639","7827"
"utilidades_domesticas","2335","6964"
"relogios_presentes","1329","5991"
"telefonia","1134","4545"
"ferramentas_jardim","753","4347"
"automotivo","1900","4235"
"brinquedos","1411","4117"
"cool_stuff","789","3796"
"perfumaria","868","3419"
"bebes","919","3065"
"eletronicos","517","2767"
*/


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
SELECT 
    'Orphaned Orders' as check_name,
    COUNT(*) as issue_count
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/* Output:
"check_name","issue_count"
"Orphaned Orders","0"
*/

-- b) Invalid product references:
SELECT 
    'Invalid Product References' as check_name,
    COUNT(*) as issue_count
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

/* Output:
"check_name","issue_count"
"Invalid Product References","0"
*/

-- c) Orders without items:
SELECT 
    'Orders Without Items' as check_name,
    COUNT(*) as issue_count
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;

/* Output:
"check_name","issue_count"
"Orders Without Items","775"
*/

-- d) Critical null values check:
SELECT 
    'Customer ID nulls' as field_check,
    COUNT(*) as null_count
FROM orders WHERE customer_id IS NULL
UNION ALL
SELECT 
    'Order purchase timestamp nulls',
    COUNT(*) 
FROM orders WHERE order_purchase_timestamp IS NULL
UNION ALL
SELECT 
    'Product price nulls',
    COUNT(*)
FROM order_items WHERE price IS NULL;

/* Output:
"field_check","null_count"
"Customer ID nulls","0"
"Order purchase timestamp nulls","0"
"Product price nulls","0"
*/


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