-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 02 - BASIC FILTERING & SORTING
-- ============================================================================
-- OBJECTIVE: Master WHERE clauses and ORDER BY statements
-- SKILLS: Filtering, sorting, LIKE patterns, date comparisons, logical operators
-- BUSINESS CONTEXT: Learn to extract specific subsets of data based on business 
--                   criteria and present results in meaningful order
-- ============================================================================

-- ============================================================================
-- QUESTION 1: Time-based Filtering
-- ============================================================================
-- Business Question: How many orders were placed in 2017?
-- Write a query to show:
-- - All orders placed during the year 2017
-- - Include: order_id, customer_id, order_purchase_timestamp, order_status
-- - Sort by order_purchase_timestamp (most recent first)
-- - Limit to first 20 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 2: Price Range Analysis
-- ============================================================================
-- Business Question: What are our high-value products?
-- Write a query to find products with price greater than 100 BRL:
-- - Show: product_id, product_category_name, price
-- - Order by price (highest first)
-- - Include only products that have been ordered at least once

-- Your SQL query here:




-- ============================================================================
-- QUESTION 3: Geographic Filtering
-- ============================================================================
-- Business Question: Who are our customers in São Paulo?
-- Write a query to show customers from São Paulo state (SP):
-- - Include: customer_id, customer_city, customer_zip_code_prefix
-- - Sort by customer_city alphabetically
-- - Show only the first 25 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 4: Status-based Analysis
-- ============================================================================
-- Business Question: Which orders need attention?
-- Write a query to find orders that are NOT delivered:
-- - Show orders with status: 'shipped', 'processing', 'canceled'
-- - Include: order_id, customer_id, order_status, order_purchase_timestamp
-- - Sort by order_purchase_timestamp (oldest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 5: Payment Method Focus
-- ============================================================================
-- Business Question: How do credit card payments compare?
-- Write a query for credit card payments only:
-- - Show: order_id, payment_value, payment_installments
-- - Filter for payment_type = 'credit_card'
-- - Include only payments with more than 1 installment
-- - Sort by payment_value (highest first)
-- - Limit to top 15 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 6: Product Category Search
-- ============================================================================
-- Business Question: What electronics do we sell?
-- Write a query to find products in categories containing 'electronics':
-- - Use LIKE operator to find categories with 'electronic' in the name
-- - Show: product_id, product_category_name
-- - Count how many products are in electronics categories
-- - Sort by product_id

-- Your SQL query here:




-- ============================================================================
-- QUESTION 7: Customer Review Quality
-- ============================================================================
-- Business Question: What are our worst customer experiences?
-- Write a query to find poor reviews (1-2 stars):
-- - Show: review_id, order_id, review_score, review_creation_date
-- - Include only reviews with scores of 1 or 2
-- - Sort by review_creation_date (most recent first)
-- - Show first 10 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 8: Order Value Analysis
-- ============================================================================
-- Business Question: What are our small vs large orders?
-- Write two queries:
-- a) Orders with total payment value less than 50 BRL (small orders)
-- b) Orders with total payment value greater than 500 BRL (large orders)
-- For each, show: order_id, total payment value, number of installments
-- Sort by payment value

-- Your SQL queries here:

-- a) Small orders (< 50 BRL):


-- b) Large orders (> 500 BRL):




-- ============================================================================
-- QUESTION 9: Delivery Performance
-- ============================================================================
-- Business Question: Which orders had slow delivery?
-- Write a query to find orders where delivery took more than 30 days:
-- - Calculate days between order_purchase_timestamp and order_delivered_customer_date
-- - Show: order_id, purchase date, delivery date, days to deliver
-- - Include only delivered orders
-- - Sort by delivery time (slowest first)
-- - Show top 20 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 10: Seller Location Analysis
-- ============================================================================
-- Business Question: Which sellers are in major cities?
-- Write a query to find sellers in Brazil's major cities:
-- - Filter for sellers in: 'sao paulo', 'rio de janeiro', 'belo horizonte'
-- - Use LOWER() function for case-insensitive comparison
-- - Show: seller_id, seller_city, seller_state
-- - Sort by seller_state, then seller_city

-- Your SQL query here:




-- ============================================================================
-- QUESTION 11: Combined Date and Status Filter
-- ============================================================================
-- Business Question: What orders were placed in December 2017 and completed?
-- Write a query with multiple conditions:
-- - Orders from December 2017 only
-- - Order status must be 'delivered'
-- - Show: order_id, order_purchase_timestamp, order_delivered_customer_date
-- - Calculate and show delivery time in days
-- - Sort by delivery time (fastest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 12: NULL Value Handling
-- ============================================================================
-- Business Question: Which orders have missing delivery information?
-- Write a query to find data quality issues:
-- - Find orders where order_delivered_customer_date IS NULL
-- - But order_status = 'delivered' (this indicates a data issue)
-- - Show: order_id, order_status, order_purchase_timestamp, order_delivered_customer_date
-- - Sort by order_purchase_timestamp

-- Your SQL query here:




-- ============================================================================