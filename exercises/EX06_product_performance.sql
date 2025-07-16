-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 06 - PRODUCT PERFORMANCE ANALYSIS
-- ============================================================================
-- OBJECTIVE: Evaluate product sales, popularity, and performance metrics
-- SKILLS: Product rankings, category analysis, pricing insights, inventory analytics
-- BUSINESS CONTEXT: Product performance analysis drives inventory decisions,
--                   pricing strategies, and product development priorities
-- ============================================================================

-- ============================================================================
-- QUESTION 1: Top Performing Products
-- ============================================================================
-- Business Question: Which products are our best sellers by different metrics?
-- Write a query to rank products by performance:
-- - Product ID and category
-- - Total quantity sold
-- - Total revenue generated
-- - Number of unique orders
-- - Average selling price
-- - Average review score (if available)
-- - Number of reviews
-- - Rank by revenue (1 = highest revenue)
-- Include only products sold at least 10 times
-- Sort by total revenue (highest first)
-- Show top 25 products

-- Your SQL query here:




-- ============================================================================
-- QUESTION 2: Product Category Performance
-- ============================================================================
-- Business Question: How do different product categories perform?
-- Write a query to analyze category-level metrics:
-- - Category name
-- - Number of unique products in category
-- - Total products sold (quantity)
-- - Total revenue
-- - Average price per item
-- - Average review score for category
-- - Number of reviews in category
-- - Market share (% of total revenue)
-- Sort by total revenue (highest first)
-- Include all categories with at least 100 items sold

-- Your SQL query here:




-- ============================================================================
-- QUESTION 3: Product Pricing Analysis
-- ============================================================================
-- Business Question: How does pricing affect product performance?
-- Write a query to analyze pricing patterns:
-- - Create price tiers: Low (<50 BRL), Medium (50-200 BRL), High (>200 BRL)
-- - For each price tier show:
--   * Number of products
--   * Total quantity sold
--   * Total revenue
--   * Average review score
--   * Average items per order
-- - Calculate revenue per product in each tier
-- - Show conversion rate (quantity sold / number of products)
-- Sort by price tier

-- Your SQL query here:




-- ============================================================================
-- QUESTION 4: Seasonal Product Performance
-- ============================================================================
-- Business Question: How does product performance vary by season?
-- Write a query to analyze seasonal patterns:
-- - Product category
-- - Q1 sales (Jan-Mar)
-- - Q2 sales (Apr-Jun)
-- - Q3 sales (Jul-Sep)
-- - Q4 sales (Oct-Dec)
-- - Peak quarter (quarter with highest sales)
-- - Seasonal variation (max quarter sales / min quarter sales)
-- Include only categories with sales in all 4 quarters
-- Sort by seasonal variation (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 5: Product Review Analysis
-- ============================================================================
-- Business Question: How do reviews correlate with product success?
-- Write a query to analyze review patterns:
-- - Product ID and category
-- - Total quantity sold
-- - Total revenue
-- - Number of reviews
-- - Average review score
-- - Review rate (reviews / quantity sold)
-- - Percentage of 5-star reviews
-- - Percentage of 1-star reviews
-- - Review quality score (5-star% - 1-star%)
-- Sort by review quality score (highest first)
-- Include only products with at least 5 reviews

-- Your SQL query here:




-- ============================================================================
-- QUESTION 6: Product Inventory Analysis
-- ============================================================================
-- Business Question: Which products need inventory attention?
-- Write a query to identify inventory insights:
-- - Product ID and category
-- - Total quantity sold
-- - Last order date
-- - Days since last order
-- - Average monthly sales (total quantity / months since launch)
-- - Product status classification:
--   * Hot: Sold in last 30 days with high volume
--   * Warm: Sold in last 60 days with medium volume
--   * Cold: Not sold in last 60 days
--   * Dead: Not sold in last 90 days
-- Sort by days since last order (longest first)
-- Show products that need attention

-- Your SQL query here:




-- ============================================================================
-- QUESTION 7: Product Cross-Category Analysis
-- ============================================================================
-- Business Question: How do products perform across different regions?
-- Write a query to analyze geographic product performance:
-- - Product category
-- - Customer state
-- - Number of customers buying this category
-- - Total quantity sold
-- - Total revenue
-- - Average price per item
-- - Market penetration (% of state's customers buying this category)
-- Group by category and state
-- Include only combinations with at least 20 customers
-- Sort by market penetration (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 8: Product Lifecycle Analysis
-- ============================================================================
-- Business Question: What is the lifecycle performance of our products?
-- Write a query to analyze product lifecycle:
-- - Product ID and category
-- - Launch date (first order date)
-- - Days since launch
-- - Total lifetime sales (quantity)
-- - Total lifetime revenue
-- - Peak month sales
-- - Current month sales (last 30 days)
-- - Lifecycle stage based on performance:
--   * Growth: Current sales > 50% of peak
--   * Mature: Current sales 20-50% of peak
--   * Decline: Current sales < 20% of peak
-- Sort by days since launch (newest first)
-- Show products launched at least 90 days ago

-- Your SQL query here:




-- ============================================================================
-- QUESTION 9: Product Profitability Analysis
-- ============================================================================
-- Business Question: Which products are most profitable?
-- Write a query to analyze product profitability:
-- - Product ID and category
-- - Total quantity sold
-- - Total revenue
-- - Average selling price
-- - Number of orders containing this product
-- - Revenue per order (total revenue / number of orders)
-- - Sales velocity (quantity sold / days since first sale)
-- - Efficiency score (revenue / number of orders)
-- Calculate profit margin category based on average selling price:
--   * Premium: > 200 BRL
--   * Standard: 50-200 BRL
--   * Budget: < 50 BRL
-- Sort by efficiency score (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 10: Product Competition Analysis
-- ============================================================================
-- Business Question: How do products compete within their categories?
-- Write a query to analyze within-category competition:
-- - Product ID and category
-- - Total revenue
-- - Market share within category (% of category revenue)
-- - Rank within category (by revenue)
-- - Revenue gap to category leader
-- - Price position (above/below category average)
-- - Review score position (above/below category average)
-- - Competitive status:
--   * Leader: Top 3 in category
--   * Challenger: Top 10 in category
--   * Follower: Others
-- Sort by category, then by market share (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 11: Product Recommendation Analysis
-- ============================================================================
-- Business Question: Which products are frequently bought together?
-- Write a query to identify product affinity:
-- - Product A (base product)
-- - Product B (companion product)
-- - Number of orders containing both products
-- - Total orders containing product A
-- - Association strength (% of A orders that also contain B)
-- - Average order value when both products present
-- - Average order value when only product A present
-- - Value uplift from product B
-- Include only product pairs with at least 5 joint orders
-- Sort by association strength (highest first)

-- Your SQL query here:




-- ============================================================================
-- QUESTION 12: Product Performance Trends
-- ============================================================================
-- Business Question: How are product performance trends evolving?
-- Write a query to analyze monthly product trends:
-- - Product category
-- - Current month sales (quantity)
-- - Previous month sales (quantity)
-- - 3-month average sales
-- - Month-over-month growth rate
-- - Trend classification:
--   * Growing: MoM growth > 10%
--   * Stable: MoM growth -10% to +10%
--   * Declining: MoM growth < -10%
-- - Velocity trend (increasing/decreasing/stable)
-- Group by category
-- Sort by month-over-month growth (highest first)
-- Show last 6 months of data

-- Your SQL query here:




-- ============================================================================
