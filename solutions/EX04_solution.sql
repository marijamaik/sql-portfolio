-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 04 - JOINS & RELATIONSHIPS
-- ============================================================================
-- OBJECTIVE: Combine data from multiple tables using different JOIN types
-- SKILLS: INNER JOIN, LEFT JOIN, RIGHT JOIN, multi-table joins, relationship analysis
-- BUSINESS CONTEXT: Real business insights require combining data from multiple 
--                   related tables to get complete pictures
-- ============================================================================

-- ============================================================================
-- QUESTION 1: Customer Order Details
-- ============================================================================
-- Business Question: What are the complete details of customer orders?
-- Write a query to show customer information with their orders:
-- - Customer id
-- - Customer location (city, state)
-- - Order information (order_id, order_date, status)
-- - Order value (from order_payments)
-- Use INNER JOIN to show only customers who have placed orders
-- Sort by order date (most recent first)
-- Limit to 25 results

-- Your SQL query here:

SELECT 
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_id,
    o.order_purchase_timestamp,
    o.order_status,
    op.payment_value as order_value
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_payments op ON o.order_id = op.order_id
ORDER BY o.order_purchase_timestamp DESC
LIMIT 25;

/* Output:
"customer_id","customer_city","customer_state","order_id","order_purchase_timestamp","order_status","order_value"
"a4b417188addbc05b26b72d5e44837a1","sorocaba","SP","10a045cdf6a5650c21e9cfeb60384c16","2018-10-17 17:30:18","canceled","89.71"
"856336203359aa6a61bf3826f7d84c49","picos","PI","b059ee4de278302d550a3035c4cdb740","2018-10-16 20:16:02","canceled","222.03"
"4c2ec60c29d10c34bd49cb88aa85cfc4","registro","SP","a2ac6dad85cf8af5b0afb510a240fe8c","2018-10-03 18:55:29","canceled","197.55"
"bf6181a85bbb4115736c0a8db1a53be3","pirai","RJ","616fa7d4871b87832197b2a137a115d2","2018-10-01 15:30:09","canceled","80.38"
"2823ffda607a2316375088e0d00005ec","guarulhos","SP","392ed9afd714e3c74767d0c4d3e3f477","2018-09-29 09:13:03","canceled","137.03"
"55c9dad94ec1a2ba57998bdb376c230a","petropolis","RJ","869997fbe01f39d184956b5c6bccfdbe","2018-09-26 08:40:15","canceled","94.63"
"7a8a02e54cf3472df427e927f8b9c046","belo horizonte","MG","5aac76cf7b07dd06fa4d50bf461d2f40","2018-09-25 11:59:18","canceled","221.54"
"191984a8ba4cbb2145acb4fe35b69664","santa luzia","MG","ed3efbd3a87bea76c2812c66a0b32219","2018-09-20 13:54:16","canceled","191.46"
"ad2eb5d02c0808bcd8743117f6383cf6","belo horizonte","MG","bd35b677fd239386e9861d11ae98ab56","2018-09-17 17:21:16","canceled","84.58"
"6ddc45ad08e6a2c885ca2255fc52d6df","mafra","SC","ea844c92cf978ea23321fa7fe5871761","2018-09-13 09:56:12","canceled","414.04"
"d6441eef3f37c3edb0d5634c3c85120b","belo horizonte","MG","1ad22e16129698e1a3cc11e4350d2cb7","2018-09-12 15:32:16","canceled","84.58"
"fea4d57ed3a45455f89c25ef3dae8ee8","taubate","SP","87ae60ef8b08ae0e5f903cacb53a6904","2018-09-11 16:45:54","canceled","258.67"
"002b5342c72978cf0aba6aae1f5d5293","rio de janeiro","RJ","21a00b08cbeb5716bbb66105e3dbd850","2018-09-10 17:51:25","canceled","51.17"
"2f0524a7b1b3845a1a57fcf3910c4333","sao paulo","SP","a89abace0dcc01eeb267a9660b5ac126","2018-09-06 18:45:47","canceled","107.13"
"ead83a4f8f7be8c3034b2e98754a6147","santana de parnaiba","SP","4d59cc2a2e7bb6c0a851725f5888a9b5","2018-09-06 14:50:07","canceled","69.46"
"36b182c39933d55e307096ccc3fd2970","praia grande","SP","afb61112fb99b07fe17e591c68c0c84c","2018-09-06 10:48:12","canceled","2266.61"
"0ab5ac09913dfd3f247c7929a3799799","registro","SP","cfdfd7862e532c4ec1ed1c6a1b56d320","2018-09-03 18:45:34","canceled","197.55"
"a7c87c25dbdded68c26c640582cb5ddb","petropolis","RJ","0d3adebce4bebc1f80a7f36e9833f497","2018-09-03 18:40:50","canceled","94.63"
"a73c1f73f5772cf801434bf984b0b1a7","sao paulo","SP","4637ca194b6387e2d538dc89b124b0ee","2018-09-03 14:14:25","canceled","0.00"
"4b7decb9b58e2569548b8b4c8e20e8d7","sao paulo","SP","54282e97f61c23b78330c15b154c867d","2018-09-03 09:06:57","shipped","166.46"
"0b0d6095c5555fe083844281f6b093bb","santos","SP","3a3cddda5a7c27851bd96c3313412840","2018-08-31 16:13:44","canceled","63.89"
"93ccdc49f22d1b0e3664b2bc328cf23d","santana de parnaiba","SP","572c4bbf0f5f85a9b4a2c4fe0c7f04d5","2018-08-30 15:11:58","canceled","69.46"
"032a544bbe984490f6ff7450e3c8b0bc","presidente prudente","SP","2663ce3526465b7ee9809428adabdc45","2018-08-30 13:07:46","canceled","71.61"
"c2a1740e781cc978dbab71735cf3ce84","sao paulo","SP","bb8edfe0742a6a0279b7dff848289568","2018-08-30 10:24:34","canceled","72.98"
"8762d94c493b70216cd453ea2320234e","sumare","SP","0a472c47d928bf4cd8b6a7a30345eeb7","2018-08-30 10:14:00","canceled","490.99"
*/

-- ============================================================================
-- QUESTION 2: Product Sales Analysis
-- ============================================================================
-- Business Question: Which products are selling and their category performance?
-- Write a query combining products, order_items, and categories:
-- - Product name and ID
-- - Category name (you'll need to join with products table for category info)
-- - Quantity sold (from order_items)
-- - Total revenue per product
-- - Average selling price
-- Include only products that have been sold at least once
-- Sort by total revenue (highest first)
-- Show top 20 products

-- Your SQL query here:




-- ============================================================================
-- QUESTION 3: Order Fulfillment Analysis
-- ============================================================================
-- Business Question: How are orders being fulfilled from payment to delivery?
-- Write a query that combines orders, order_payments, and customers:
-- - Order ID and purchase date
-- - Customer state and city
-- - Payment method and payment value
-- - Order status
-- - Delivery date (if available)
-- - Calculate delivery time in days
-- Use LEFT JOIN to include all orders even if payment/delivery info is missing
-- Filter for orders from 2018 only
-- Sort by delivery time (longest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 4: Seller Performance Dashboard
-- ============================================================================
-- Business Question: How are sellers performing across different metrics?
-- Write a query joining sellers, order_items, and products:
-- - Seller ID and location (city, state)
-- - Number of different products sold
-- - Total quantity of items sold
-- - Total revenue generated
-- - Average item price
-- - Number of unique orders handled
-- Include only sellers who have made at least 5 sales
-- Sort by total revenue (highest first)
-- Show top 15 sellers

-- Your SQL query here:




-- ============================================================================
-- QUESTION 5: Customer Review Analysis
-- ============================================================================
-- Business Question: What are customers saying about products they purchased?
-- Write a query joining order_reviews, orders, customers, and order_items:
-- - Customer location (state, city)
-- - Order date
-- - Review score and review date
-- - Product ID from the order
-- - Review text length (use LENGTH function)
-- - Days between order and review
-- Use INNER JOIN to show only reviews with complete information
-- Filter for reviews with scores of 1 or 2 (poor reviews)
-- Sort by review date (most recent first)
-- Limit to 20 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 6: Geographic Sales Performance
-- ============================================================================
-- Business Question: How do sales vary by geographic regions?
-- Write a query combining customers, orders, and order_payments:
-- - Customer state
-- - Number of customers in each state
-- - Total number of orders
-- - Total revenue
-- - Average order value
-- - Average orders per customer
-- Use LEFT JOIN to include all customers even those without orders
-- Group by state and include only states with at least 100 customers
-- Sort by total revenue (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 7: Product Category Revenue Analysis
-- ============================================================================
-- Business Question: Which product categories generate the most revenue?
-- Write a query using products, order_items, and orders:
-- - Category name (from products table)
-- - Number of unique products in category
-- - Total quantity sold
-- - Total revenue
-- - Average price per item
-- - Number of orders containing this category
-- Join with orders to ensure we only count completed orders
-- Filter for order_status = 'delivered'
-- Sort by total revenue (highest first)
-- Show top 12 categories

-- Your SQL query here:




-- ============================================================================
-- QUESTION 8: Customer Lifetime Analysis
-- ============================================================================
-- Business Question: What is the complete customer journey and value?
-- Write a query joining customers, orders, order_payments, and order_reviews:
-- - Customer ID and location
-- - Total amount spent
-- - Number of orders placed
-- - First order date
-- - Last order date
-- - Customer lifespan in days
-- - Number of reviews written
-- - Average review score given
-- Use LEFT JOIN to include customers even if they haven't reviewed
-- Filter for customers with at least 2 orders
-- Sort by total spent (highest first)
-- Limit to 25 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 9: Seller-Customer Distance Analysis
-- ============================================================================
-- Business Question: How far are sellers from their customers?
-- Write a query using sellers, order_items, orders, and customers:
-- - Seller city and state
-- - Customer city and state
-- - Number of transactions between this seller-customer state pair
-- - Total revenue for this seller-customer state combination
-- - Average order value
-- Use INNER JOIN to show only actual transactions
-- Group by seller state, customer state
-- Filter for combinations with at least 10 transactions
-- Sort by total revenue (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 10: Payment Method by Region
-- ============================================================================
-- Business Question: How do payment preferences vary by region?
-- Write a query combining customers, orders, and order_payments:
-- - Customer state
-- - Payment method
-- - Number of payments
-- - Total payment value
-- - Average payment value
-- - Percentage of total payments for this state
-- Use window functions for percentage calculations
-- Group by state and payment method
-- Sort by state, then by payment count (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 11: Order Item Details with All Information
-- ============================================================================
-- Business Question: What are the complete details of each order item?
-- Write a comprehensive query joining all relevant tables:
-- - Order item details (order_id, product_id, quantity, price)
-- - Product information (product_name, category)
-- - Order information (order_date, status)
-- - Customer information (customer_state, customer_city)
-- - Seller information (seller_state, seller_city)
-- - Payment information (payment_method, payment_value)
-- Use appropriate JOIN types to preserve all order_items
-- Filter for orders from Q4 2017 (Oct-Dec 2017)
-- Sort by order_date, then by order_id
-- Limit to 50 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 12: Missing Data Analysis
-- ============================================================================
-- Business Question: What data is missing from our order relationships?
-- Write queries to identify missing relationships:
-- a) Orders without payment information
-- b) Orders without any order items
-- c) Order items without corresponding orders
-- d) Reviews without corresponding orders
-- Use LEFT JOIN and IS NULL to find missing data
-- Count the number of missing records in each category
-- This helps identify data quality issues

-- Your SQL queries here:

-- a) Orders without payment information:


-- b) Orders without any order items:


-- c) Order items without corresponding orders:


-- d) Reviews without corresponding orders:




-- ============================================================================
