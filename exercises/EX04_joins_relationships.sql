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
-- - Customer name details (first/last name from customer_id)
-- - Order information (order_id, order_date, status)
-- - Customer location (city, state)
-- - Order value (from order_payments)
-- Use INNER JOIN to show only customers who have placed orders
-- Sort by order date (most recent first)
-- Limit to 25 results

-- Your SQL query here:




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
