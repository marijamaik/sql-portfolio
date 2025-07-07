-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 03 - AGGREGATIONS & GROUPING
-- ============================================================================
-- OBJECTIVE: Calculate business metrics using aggregate functions
-- SKILLS: COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING, business calculations
-- BUSINESS CONTEXT: Transform raw transactional data into meaningful business 
--                   metrics and KPIs for decision making
-- ============================================================================

-- ============================================================================
-- QUESTION 1: Monthly Revenue Analysis
-- ============================================================================
-- Business Question: What is our monthly revenue trend?
-- Write a query to calculate total revenue by month:
-- - Extract year and month from order_purchase_timestamp
-- - Sum all payment values for each month
-- - Include order count for each month
-- - Show only months with at least 100 orders
-- - Sort chronologically (earliest to latest)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 2: Payment Method Performance
-- ============================================================================
-- Business Question: How do payment methods compare in terms of order value?
-- Write a query to analyze payment methods:
-- - Group by payment_type
-- - Calculate: count of payments, average payment value, total revenue
-- - Include average number of installments per payment type
-- - Sort by total revenue (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 3: State-wise Customer Distribution
-- ============================================================================
-- Business Question: Which states should we focus our marketing on?
-- Write a query to show customer concentration by state:
-- - Count customers per state
-- - Calculate percentage of total customers for each state
-- - Include only states with at least 500 customers
-- - Sort by customer count (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 4: Product Category Performance
-- ============================================================================
-- Business Question: Which product categories generate the most revenue?
-- Write a query combining products and order_items:
-- - Group by product_category_name
-- - Calculate: total quantity sold, total revenue, average item price
-- - Include count of unique products per category
-- - Show top 10 categories by revenue
-- - Sort by total revenue (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 5: Order Size Analysis
-- ============================================================================
-- Business Question: What is the typical order composition?
-- Write a query to analyze order characteristics:
-- - Group by order_id
-- - Calculate: number of items per order, total order value
-- - Then summarize these results to show:
--   * Average items per order
--   * Average order value
--   * Minimum and maximum order values
--   * Orders with only 1 item vs multiple items

-- Your SQL query here:




-- ============================================================================
-- QUESTION 6: Customer Review Patterns
-- ============================================================================
-- Business Question: How does customer satisfaction vary by product category?
-- Write a query to analyze reviews by category:
-- - Join reviews, order_items, and products tables
-- - Group by product_category_name  
-- - Calculate: average review score, count of reviews, percentage of 5-star reviews
-- - Include only categories with at least 100 reviews
-- - Sort by average review score (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 7: Seller Performance Metrics
-- ============================================================================
-- Business Question: Who are our top-performing sellers?
-- Write a query to rank sellers by performance:
-- - Group by seller_id
-- - Calculate: total items sold, total revenue, number of orders
-- - Include average item price for each seller
-- - Show only sellers with at least 10 orders
-- - Sort by total revenue (highest first)
-- - Limit to top 15 sellers

-- Your SQL query here:




-- ============================================================================
-- QUESTION 8: Delivery Performance by State
-- ============================================================================
-- Business Question: How does delivery performance vary geographically?
-- Write a query to analyze delivery times by customer state:
-- - Calculate average delivery time in days for each state
-- - Include: number of delivered orders, shortest delivery, longest delivery
-- - Filter for orders with delivery status = 'delivered'
-- - Show only states with at least 100 delivered orders
-- - Sort by average delivery time (fastest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 9: Seasonal Shopping Patterns
-- ============================================================================
-- Business Question: When do customers shop most?
-- Write a query to analyze shopping patterns by day of week:
-- - Extract day of week from order_purchase_timestamp
-- - Group by day of week (Monday=1, Sunday=7)
-- - Calculate: order count, average order value, total revenue
-- - Sort by day of week

-- Your SQL query here:




-- ============================================================================
-- QUESTION 10: High-Value Customer Analysis
-- ============================================================================
-- Business Question: Who are our most valuable customers?
-- Write a query to identify high-value customers:
-- - Group by customer_id
-- - Calculate: total spent, number of orders, average order value
-- - Include first and last order dates
-- - Filter for customers who spent more than 1000 BRL total
-- - Sort by total spent (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 11: Product Pricing Analysis
-- ============================================================================
-- Business Question: How are products priced across categories?
-- Write a query to analyze pricing by category:
-- - Group by product_category_name
-- - Calculate: average price, minimum price, maximum price, price range
-- - Include count of products in each price range:
--   * Cheap: < 20 BRL
--   * Medium: 20-100 BRL  
--   * Expensive: > 100 BRL
-- - Sort by average price (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 12: Order Fulfillment Analysis
-- ============================================================================
-- Business Question: How efficient is our order processing?
-- Write a query to analyze order processing times:
-- - Calculate time differences between order stages:
--   * Order to approval time
--   * Approval to shipping time  
--   * Shipping to delivery time
-- - Group by order_status
-- - Show average processing times for each stage
-- - Include count of orders in each status

-- Your SQL query here:




-- ============================================================================