-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 05 - CUSTOMER ANALYSIS
-- ============================================================================
-- OBJECTIVE: Analyze customer behavior, demographics, and value patterns
-- SKILLS: Customer segmentation, behavioral analysis, demographic insights
-- BUSINESS CONTEXT: Understanding customers is crucial for marketing, retention,
--                   and business growth strategies
-- ============================================================================

-- ============================================================================
-- QUESTION 1: Customer Value Segmentation
-- ============================================================================
-- Business Question: How can we segment customers by their spending behavior?
-- Write a query to create customer value tiers:
-- - Customer ID and location (state, city)
-- - Total amount spent across all orders
-- - Number of orders placed
-- - Average order value
-- - First order date and last order date
-- - Customer lifespan in days
-- - Assign value tier based on total spent:
--   * VIP: > 1000 BRL
--   * Premium: 500-1000 BRL
--   * Standard: 100-500 BRL
--   * Low: < 100 BRL
-- Sort by total spent (highest first)
-- Show top 30 customers

-- Your SQL query here:




-- ============================================================================
-- QUESTION 2: Customer Geographic Distribution
-- ============================================================================
-- Business Question: Where are our customers located and how active are they?
-- Write a query to analyze customer distribution by state:
-- - Customer state
-- - Number of customers
-- - Percentage of total customers
-- - Number of orders from this state
-- - Average orders per customer in this state
-- - Total revenue from this state
-- - Average customer lifetime value in this state
-- Include only states with at least 50 customers
-- Sort by number of customers (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 3: Customer Purchase Frequency Analysis
-- ============================================================================
-- Business Question: How often do customers make repeat purchases?
-- Write a query to analyze purchase frequency:
-- - Group customers by number of orders (1 order, 2 orders, 3+ orders)
-- - Count customers in each group
-- - Calculate percentage of total customers
-- - Show average total spent per customer in each group
-- - Calculate average days between first and last order
-- - Include average order value for each group
-- This helps understand customer loyalty and retention

-- Your SQL query here:




-- ============================================================================
-- QUESTION 4: Customer Acquisition Analysis
-- ============================================================================
-- Business Question: How has customer acquisition changed over time?
-- Write a query to analyze customer acquisition by month:
-- - Year and month of first order (customer acquisition date)
-- - Number of new customers acquired
-- - Total revenue from new customers in their first month
-- - Average first order value
-- - Percentage of new customers who made a second order
-- Group by acquisition month
-- Sort chronologically (earliest to latest)
-- Show last 18 months of data

-- Your SQL query here:




-- ============================================================================
-- QUESTION 5: Customer Loyalty Analysis
-- ============================================================================
-- Business Question: Who are our most loyal customers?
-- Write a query to identify loyal customers:
-- - Customer ID and location
-- - Number of orders placed
-- - Total amount spent
-- - Average days between orders
-- - Customer lifespan (days from first to last order)
-- - Order frequency (orders per 30 days)
-- - Average review score given (if any reviews)
-- Filter for customers with at least 3 orders
-- Sort by order frequency (highest first)
-- Show top 25 loyal customers

-- Your SQL query here:




-- ============================================================================
-- QUESTION 6: Customer Churn Analysis
-- ============================================================================
-- Business Question: Which customers might be at risk of churning?
-- Write a query to identify potentially churned customers:
-- - Customer ID and location
-- - Last order date
-- - Days since last order
-- - Total historical orders
-- - Total historical spend
-- - Average order value
-- - Customer lifetime in days
-- Define "at risk" as customers who:
--   * Have made at least 2 orders historically
--   * Haven't ordered in the last 90 days
--   * Had their last order before 2018-07-01
-- Sort by days since last order (longest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 7: Customer Payment Behavior
-- ============================================================================
-- Business Question: How do customers prefer to pay and does it vary by value?
-- Write a query analyzing payment preferences by customer value:
-- - Customer value tier (based on total spent)
-- - Payment method
-- - Number of customers using this payment method
-- - Average payment value
-- - Average number of installments
-- - Percentage of total payments for this tier
-- Group by customer value tier and payment method
-- Sort by customer tier, then by payment count

-- Your SQL query here:




-- ============================================================================
-- QUESTION 8: Customer Review Behavior
-- ============================================================================
-- Business Question: How do customers engage with reviews?
-- Write a query to analyze customer review patterns:
-- - Customer ID and location
-- - Total orders placed
-- - Total reviews written
-- - Review rate (reviews / orders)
-- - Average review score given
-- - Average days between order and review
-- - Customer satisfaction category based on avg review score:
--   * Promoter: 4.5-5.0
--   * Passive: 3.5-4.4
--   * Detractor: 1.0-3.4
-- Include only customers who have written at least 2 reviews
-- Sort by review rate (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 9: Customer Seasonal Behavior
-- ============================================================================
-- Business Question: How does customer behavior change seasonally?
-- Write a query to analyze seasonal purchasing patterns:
-- - Customer ID
-- - Orders in Q1 (Jan-Mar)
-- - Orders in Q2 (Apr-Jun)
-- - Orders in Q3 (Jul-Sep)
-- - Orders in Q4 (Oct-Dec)
-- - Most active quarter
-- - Total annual orders
-- - Seasonal preference score (% of orders in most active quarter)
-- Include only customers with at least 4 orders total
-- Sort by seasonal preference score (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 10: Customer Category Preferences
-- ============================================================================
-- Business Question: What product categories do different customer segments prefer?
-- Write a query to analyze category preferences by customer value:
-- - Customer value tier (VIP, Premium, Standard, Low)
-- - Product category
-- - Number of customers in this tier buying this category
-- - Total quantity purchased
-- - Total revenue from this tier-category combination
-- - Average price per item
-- - Percentage of tier's total purchases
-- Group by customer tier and product category
-- Sort by customer tier, then by revenue

-- Your SQL query here:




-- ============================================================================
-- QUESTION 11: Customer Lifetime Value Prediction
-- ============================================================================
-- Business Question: Can we predict customer lifetime value?
-- Write a query to calculate CLV metrics:
-- - Customer ID and location
-- - Total orders
-- - Total spent (actual CLV)
-- - Average order value
-- - Average days between orders
-- - Customer lifespan in days
-- - Predicted annual value (based on order frequency and AOV)
-- - CLV efficiency (actual CLV / customer lifespan in days)
-- Include only customers with at least 30 days of history
-- Sort by predicted annual value (highest first)
-- Show top 25 customers

-- Your SQL query here:




-- ============================================================================
-- QUESTION 12: Customer Cohort Analysis
-- ============================================================================
-- Business Question: How do customer cohorts perform over time?
-- Write a query for cohort analysis:
-- - Acquisition month (month of first order)
-- - Cohort size (number of customers acquired)
-- - Revenue in month 1 (acquisition month)
-- - Revenue in month 2 (if they ordered again)
-- - Revenue in month 3 (if they ordered again)
-- - Retention rate month 2 (% who ordered again)
-- - Retention rate month 3 (% who ordered in month 3)
-- - Average customer value in first 3 months
-- Group by acquisition month
-- Sort chronologically
-- Show cohorts from 2017 only

-- Your SQL query here:




-- ============================================================================
