-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 07 - TEMPORAL ANALYSIS
-- ============================================================================
-- OBJECTIVE: Analyze time-based patterns, trends, and seasonal behaviors
-- SKILLS: Time series analysis, trend calculations, seasonal patterns, growth metrics
-- BUSINESS CONTEXT: Understanding temporal patterns is crucial for forecasting,
--                   inventory planning, and identifying business cycles
-- ============================================================================

-- ============================================================================
-- QUESTION 1: Monthly Sales Trends
-- ============================================================================
-- Business Question: How do sales trends change month over month?
-- Write a query to analyze monthly sales patterns:
-- - Year and month
-- - Total orders
-- - Total revenue
-- - Average order value
-- - Number of unique customers
-- - Month-over-month growth rate (orders)
-- - Month-over-month growth rate (revenue)
-- - 3-month moving average (orders)
-- - Cumulative revenue for the year
-- Sort chronologically
-- Show all months with data

-- Your SQL query here:




-- ============================================================================
-- QUESTION 2: Day of Week Analysis
-- ============================================================================
-- Business Question: How does customer behavior vary by day of the week?
-- Write a query to analyze weekly patterns:
-- - Day of week (Monday, Tuesday, etc.)
-- - Total orders
-- - Total revenue
-- - Average order value
-- - Number of unique customers
-- - Percentage of weekly orders
-- - Peak hour pattern (if order times available)
-- - Order distribution by day
-- Calculate which day is best for:
--   * Total volume
--   * Average order value
--   * Customer acquisition
-- Sort by day of week (Monday to Sunday)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 3: Seasonal Analysis
-- ============================================================================
-- Business Question: How do sales patterns change seasonally?
-- Write a query to analyze seasonal behaviors:
-- - Season (Q1, Q2, Q3, Q4)
-- - Year
-- - Total orders
-- - Total revenue
-- - Average order value
-- - Number of unique customers
-- - Seasonal index (season revenue / quarterly average)
-- - Year-over-year growth by season
-- - Most popular product categories per season
-- Group by year and season
-- Sort by year, then season

-- Your SQL query here:




-- ============================================================================
-- QUESTION 4: Business Growth Analysis
-- ============================================================================
-- Business Question: How is the business growing over time?
-- Write a query to analyze business growth:
-- - Year and month
-- - New customers acquired
-- - Returning customers
-- - Customer retention rate
-- - Revenue from new customers
-- - Revenue from returning customers
-- - Monthly growth rate (total revenue)
-- - Cumulative customer base
-- - Customer lifetime value trend
-- Sort chronologically
-- Show growth trajectory over time

-- Your SQL query here:




-- ============================================================================
-- QUESTION 5: Time-to-Purchase Analysis
-- ============================================================================
-- Business Question: How long does it take customers to make repeat purchases?
-- Write a query to analyze purchase timing:
-- - Customer ID
-- - First order date
-- - Second order date (if exists)
-- - Days between first and second order
-- - Average days between all orders for this customer
-- - Total orders
-- - Purchase frequency classification:
--   * Frequent: < 30 days between orders
--   * Regular: 30-90 days between orders
--   * Occasional: > 90 days between orders
-- Include only customers with at least 2 orders
-- Sort by days between first and second order

-- Your SQL query here:




-- ============================================================================
-- QUESTION 6: Holiday and Event Analysis
-- ============================================================================
-- Business Question: How do sales spike during holidays and events?
-- Write a query to analyze specific date patterns:
-- - Date
-- - Day of week
-- - Total orders
-- - Total revenue
-- - Order volume vs. average daily volume
-- - Revenue vs. average daily revenue
-- - Percentage increase over normal days
-- Identify potential holiday dates:
--   * Christmas season (Dec 20-31)
--   * Black Friday equivalent (Nov dates with high volume)
--   * Mother's Day (May high volume days)
--   * Valentine's Day (Feb high volume days)
-- Sort by revenue (highest first)
-- Show top 20 peak days

-- Your SQL query here:




-- ============================================================================
-- QUESTION 7: Customer Lifecycle Timeline
-- ============================================================================
-- Business Question: How does customer behavior change over their lifecycle?
-- Write a query to analyze customer lifecycle stages:
-- - Days since first order (customer age)
-- - Customer age groups: 0-30, 31-90, 91-180, 181-365, 365+ days
-- - Number of customers in each age group
-- - Average orders per customer in each group
-- - Average total spent per customer in each group
-- - Average order value by customer age group
-- - Repeat purchase rate by age group
-- - Customer retention by age group
-- Sort by customer age group

-- Your SQL query here:




-- ============================================================================
-- QUESTION 8: Revenue Forecasting Preparation
-- ============================================================================
-- Business Question: What patterns can help us forecast future revenue?
-- Write a query to prepare forecasting data:
-- - Year and month
-- - Total revenue
-- - Revenue trend (increasing/decreasing/stable)
-- - Seasonal adjustment factor
-- - Monthly growth rate
-- - 6-month moving average
-- - Standard deviation of monthly revenue
-- - Coefficient of variation (stability measure)
-- - Forecast confidence indicator
-- Sort chronologically
-- Include calculations for trend analysis

-- Your SQL query here:




-- ============================================================================
-- QUESTION 9: Product Launch Timeline Analysis
-- ============================================================================
-- Business Question: How do products perform after launch?
-- Write a query to analyze product launch patterns:
-- - Product category
-- - Launch date (first order date)
-- - Days since launch
-- - Sales in first 30 days
-- - Sales in first 90 days
-- - Sales in first 180 days
-- - Current sales rate (last 30 days)
-- - Launch success classification:
--   * Strong: High sales in first 30 days
--   * Moderate: Medium sales in first 30 days
--   * Weak: Low sales in first 30 days
-- Sort by launch date (most recent first)
-- Show products launched in last 12 months

-- Your SQL query here:




-- ============================================================================
-- QUESTION 10: Time Series Decomposition
-- ============================================================================
-- Business Question: Can we separate trend, seasonal, and irregular components?
-- Write a query to decompose time series:
-- - Year and month
-- - Actual revenue
-- - 12-month moving average (trend)
-- - Seasonal component (actual / trend)
-- - Deseasonalized revenue
-- - Month-over-month change (trend)
-- - Seasonal index by month
-- - Irregular component
-- - Trend direction (up/down/flat)
-- Sort chronologically
-- Show complete time series

-- Your SQL query here:




-- ============================================================================
-- QUESTION 11: Customer Timing Patterns
-- ============================================================================
-- Business Question: When do customers typically place orders?
-- Write a query to analyze order timing:
-- - Hour of day (0-23)
-- - Day of week
-- - Total orders
-- - Average order value
-- - Order concentration (% of daily orders)
-- - Customer type (new vs returning)
-- - Product category preferences by time
-- Identify peak hours and days
-- Calculate business hours optimization
-- Sort by hour of day, then day of week

-- Your SQL query here:




-- ============================================================================
-- QUESTION 12: Cohort Temporal Analysis
-- ============================================================================
-- Business Question: How do customer cohorts behave over time?
-- Write a query for advanced cohort analysis:
-- - Cohort month (first order month)
-- - Months since first order (0, 1, 2, 3, etc.)
-- - Cohort size (customers in original cohort)
-- - Active customers (customers ordering in this month)
-- - Retention rate (active customers / cohort size)
-- - Revenue per cohort
-- - Cumulative revenue per cohort
-- - Average order value by cohort age
-- Create a cohort table showing retention rates
-- Sort by cohort month, then months since first order

-- Your SQL query here:




-- ============================================================================
