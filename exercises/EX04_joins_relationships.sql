-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 04 - JOINS & RELATIONSHIPS
-- ============================================================================
-- OBJECTIVE: Combine data from multiple tables using different JOIN types
-- SKILLS: INNER JOIN, LEFT JOIN, RIGHT JOIN, multi-table joins, relationship analysis
-- BUSINESS CONTEXT: Real business insights require combining data from multiple 
--                   related tables to get complete pictures
-- ============================================================================

-- ============================================================================
-- QUESTION 1: Customer Order Summary
-- ============================================================================
-- Business Question: What are the complete details of customer orders?
-- Write a query to show customer information with their orders:
-- - Customer ID, city, and state
-- - Order ID, purchase timestamp, and status
-- - Total order value (sum of all payments for the order)
-- - Number of payment installments used
-- Use INNER JOIN to show only customers who have placed orders
-- Sort by order purchase timestamp (most recent first)
-- Limit to 25 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 2: Product Sales Performance
-- ============================================================================
-- Business Question: Which products are selling well and what are their details?
-- Write a query combining products and order_items:
-- - Product ID and category name
-- - Product weight and dimensions (length, height, width)
-- - Total quantity sold (sum of quantity from order_items)
-- - Total revenue (sum of price from order_items)
-- - Average selling price per unit
-- - Number of different orders this product appeared in
-- Include only products that have been sold at least once
-- Sort by total revenue (highest first)
-- Show top 20 products

-- Your SQL query here:




-- ============================================================================
-- QUESTION 3: Order Fulfillment Analysis
-- ============================================================================
-- Business Question: How are orders being processed and delivered?
-- Write a query combining orders, customers, and order_payments:
-- - Order ID and customer location (city, state)
-- - Order timestamps (purchase, approved, delivered to carrier, delivered to customer)
-- - Payment type and total payment value
-- - Days from purchase to delivery (if delivered)
-- - Order status
-- Use LEFT JOIN to include all orders even if some timestamp data is missing
-- Filter for orders from 2018 only
-- Sort by delivery time (longest first, NULLs last)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 4: Seller Performance Analysis
-- ============================================================================
-- Business Question: How are sellers performing across different metrics?
-- Write a query joining sellers and order_items:
-- - Seller ID and location (city, state)
-- - Total number of items sold (sum of quantity from order_items)
-- - Total revenue generated (sum of price from order_items)
-- - Average item price
-- - Number of unique products sold
-- - Number of unique orders handled
-- Include only sellers who have made at least 10 sales
-- Sort by total revenue (highest first)
-- Show top 15 sellers

-- Your SQL query here:




-- ============================================================================
-- QUESTION 5: Customer Review Analysis
-- ============================================================================
-- Business Question: What are customers saying about their orders?
-- Write a query joining order_reviews, orders, and customers:
-- - Customer location (city, state)
-- - Order purchase date
-- - Review score and creation date
-- - Review title and message length (use LENGTH function)
-- - Days between order and review
-- Use INNER JOIN to show only reviews with complete information
-- Filter for reviews with scores of 1 or 2 (poor reviews)
-- Sort by review creation date (most recent first)
-- Limit to 20 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 6: Geographic Sales Analysis
-- ============================================================================
-- Business Question: How do sales vary by customer location?
-- Write a query combining customers, orders, and order_payments:
-- - Customer state
-- - Number of customers in each state
-- - Total number of orders from each state
-- - Total revenue from each state
-- - Average order value by state
-- - Average number of orders per customer by state
-- Use LEFT JOIN to include all customers even those without orders
-- Group by state and include only states with at least 100 customers
-- Sort by total revenue (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 7: Product Category Performance
-- ============================================================================
-- Business Question: Which product categories generate the most revenue?
-- Write a query using products and order_items:
-- - Product category name
-- - Number of unique products in category
-- - Total quantity sold across all products in category
-- - Total revenue for the category
-- - Average price per item in category
-- - Number of orders containing products from this category
-- Filter for categories that are not NULL
-- Sort by total revenue (highest first)
-- Show top 12 categories

-- Your SQL query here:




-- ============================================================================
-- QUESTION 8: Customer Lifetime Value Analysis
-- ============================================================================
-- Business Question: What is the complete customer purchasing behavior?
-- Write a query joining customers, orders, and order_payments:
-- - Customer ID and location (city, state)
-- - Total amount spent across all orders
-- - Number of orders placed
-- - Average order value
-- - First order date and last order date
-- - Customer lifespan in days (last order - first order)
-- Use INNER JOIN to show only customers who have made purchases
-- Filter for customers with at least 2 orders
-- Sort by total spent (highest first)
-- Limit to 25 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 9: Product and Seller Relationship
-- ============================================================================
-- Business Question: How do products and sellers work together?
-- Write a query using products, order_items, and sellers:
-- - Product category and seller location (city, state)
-- - Number of transactions between this category-seller combination
-- - Total revenue for this combination
-- - Average price per item
-- - Number of unique products sold by this seller in this category
-- Use INNER JOIN to show only actual transactions
-- Group by product category and seller state
-- Filter for combinations with at least 5 transactions
-- Sort by total revenue (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 10: Payment Analysis by Location
-- ============================================================================
-- Business Question: How do payment preferences vary by region?
-- Write a query combining customers, orders, and order_payments:
-- - Customer state
-- - Payment type
-- - Number of payments of this type in this state
-- - Total payment value
-- - Average payment value
-- - Average number of installments
-- - Percentage of state's total payments
-- Use window functions for percentage calculations
-- Group by state and payment type
-- Sort by state, then by payment count (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 11: Comprehensive Order Details
-- ============================================================================
-- Business Question: What are the complete details of each order item?
-- Write a query joining order_items, products, orders, customers, and sellers:
-- - Order item details (order_id, product_id, quantity, price, freight_value)
-- - Product category and weight
-- - Order purchase date and status
-- - Customer location (city, state)
-- - Seller location (city, state)
-- Use appropriate JOIN types to preserve all order_items
-- Filter for orders from Q4 2017 (Oct-Dec 2017)
-- Sort by order purchase date, then by order_id
-- Limit to 50 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 12: Data Quality Assessment
-- ============================================================================
-- Business Question: What data relationships might be missing?
-- Write queries to identify potential data quality issues:
-- a) Orders without any payment information
-- b) Orders without any order items
-- c) Order items without corresponding orders
-- d) Reviews without corresponding orders
-- e) Products that have never been ordered
-- Use LEFT JOIN and IS NULL to find missing relationships
-- Count the number of missing records in each category

-- Your SQL queries here:

-- a) Orders without payment information:


-- b) Orders without order items:


-- c) Order items without corresponding orders:


-- d) Reviews without corresponding orders:


-- e) Products never ordered:




-- ============================================================================
