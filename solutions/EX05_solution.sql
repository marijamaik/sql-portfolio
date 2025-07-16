-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 05 - CUSTOMER BEHAVIOR ANALYSIS
-- ============================================================================
-- OBJECTIVE: Analyze customer behavior patterns and value using Brazilian e-commerce data
-- SKILLS: Customer segmentation, behavioral analysis, value calculations
-- BUSINESS CONTEXT: Understanding customer behavior in Brazilian marketplace
-- FOCUS: Quality insights over quantity - 6 strategic questions
-- ============================================================================

-- ============================================================================
-- QUESTION 1: RFM Customer Segmentation
-- ============================================================================
-- Business Question: How can we segment customers using Recency, Frequency, and Monetary analysis?
-- 
-- Create a complete RFM (Recency, Frequency, and Monetary value) analysis to segment customers:
-- - Recency: Days since last purchase (lower is better)
-- - Frequency: Number of orders placed (higher is better)  
-- - Monetary: Total amount spent (higher is better)
-- - Assign RFM scores (1-5 scale) using NTILE
-- - Create customer segments based on RFM scores:
--   * Champions: High F, High M, Low R
--   * Loyal Customers: High F, Medium M
--   * Potential Loyalists: Medium F, Medium M, Low R
--   * At Risk: High F, High M, High R
--   * Cannot Lose: High F, High M, Very High R
--   * Others: Remaining combinations
-- 
-- Show customer segments with counts and average values
-- This is a cornerstone of customer analytics

-- Your SQL query here:

WITH customer_metrics AS (
    -- Calculate base RFM metrics for each customer
    SELECT 
        c.customer_id,
        c.customer_state,
        -- Recency: Days since last purchase (use current date or max date in dataset)
        EXTRACT(DAY FROM (CURRENT_DATE - MAX(o.order_purchase_timestamp))) AS recency_days,
        -- Frequency: Number of orders
        COUNT(DISTINCT o.order_id) AS frequency,
        -- Monetary: Total amount spent
        COALESCE(SUM(oi.price + oi.freight_value), 0) AS monetary_value
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered' 
        AND o.order_purchase_timestamp IS NOT NULL
    GROUP BY c.customer_id, c.customer_state
    HAVING COUNT(DISTINCT o.order_id) > 0
),
rfm_scores AS (
    -- Calculate RFM scores using NTILE (1-5 scale)
    SELECT 
        customer_id,
        customer_state,
        recency_days,
        frequency,
        monetary_value,
        -- Recency: Lower is better (recent customers get higher scores)
        6 - NTILE(5) OVER (ORDER BY recency_days) AS r_score,
        -- Frequency: Higher is better
        NTILE(5) OVER (ORDER BY frequency) AS f_score,
        -- Monetary: Higher is better
        NTILE(5) OVER (ORDER BY monetary_value) AS m_score
    FROM customer_metrics
),
customer_segments AS (
    -- Assign customer segments based on RFM scores
    SELECT 
        customer_id,
        customer_state,
        recency_days,
        frequency,
        monetary_value,
        r_score,
        f_score,
        m_score,
        CASE 
            WHEN f_score >= 4 AND m_score >= 4 AND r_score >= 4 THEN 'Champions'
            WHEN f_score >= 4 AND m_score >= 3 AND r_score >= 3 THEN 'Loyal Customers'
            WHEN f_score >= 3 AND m_score >= 3 AND r_score >= 4 THEN 'Potential Loyalists'
            WHEN f_score >= 4 AND m_score >= 4 AND r_score <= 2 THEN 'At Risk'
            WHEN f_score >= 4 AND m_score >= 4 AND r_score = 1 THEN 'Cannot Lose'
            WHEN r_score >= 4 AND f_score <= 2 THEN 'New Customers'
            WHEN r_score <= 2 AND f_score <= 2 THEN 'Lost Customers'
            ELSE 'Others'
        END AS customer_segment
    FROM rfm_scores
)
-- Final results with segment analysis
SELECT 
    customer_segment,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage,
    ROUND(AVG(recency_days), 1) AS avg_recency_days,
    ROUND(AVG(frequency), 1) AS avg_frequency,
    ROUND(AVG(monetary_value), 2) AS avg_monetary_value,
    ROUND(AVG(r_score), 1) AS avg_r_score,
    ROUND(AVG(f_score), 1) AS avg_f_score,
    ROUND(AVG(m_score), 1) AS avg_m_score
FROM customer_segments
GROUP BY customer_segment
ORDER BY avg_monetary_value DESC;


/* Output:
"customer_segment","customer_count","percentage","avg_recency_days","avg_frequency","avg_monetary_value","avg_r_score","avg_f_score","avg_m_score"
"Potential Loyalists","7817","8.10","2604.7","1.0","422.87","4.5","3.0","4.8"
"Others","26190","27.15","2831.8","1.0","222.81","2.2","2.8","3.3"
"Champions","8869","9.19","2604.0","1.0","164.92","4.5","4.9","4.1"
"At Risk","7978","8.27","2906.2","1.0","163.65","1.5","4.9","4.1"
"Loyal Customers","14882","15.43","2672.3","1.0","123.88","3.7","4.3","3.3"
"Lost Customers","15908","16.49","2909.9","1.0","54.75","1.5","1.5","1.5"
"New Customers","14834","15.38","2602.8","1.0","53.67","4.5","1.5","1.5"
*/

-- ============================================================================
-- QUESTION 2: Customer Lifetime Value & Cohort Analysis
-- ============================================================================
-- Business Question: How do customers acquired in different months perform over time?
-- 
-- Perform cohort analysis to understand customer retention and value:
-- - Group customers by acquisition month (first order month)
-- - Calculate cohort performance metrics:
--   * Cohort size (customers acquired)
--   * Month 1, 2, 3, 6 retention rates
--   * Average revenue per customer by cohort age
--   * Cumulative customer lifetime value
-- - Identify best and worst performing cohorts
-- - Calculate cohort-specific insights for marketing strategy
-- 
-- This reveals customer acquisition quality and retention patterns

-- Your SQL query here:



-- ============================================================================
-- QUESTION 3: Geographic Customer Insights
-- ============================================================================
-- Business Question: How does customer behavior vary across Brazilian states?
-- 
-- Analyze customer behavior differences by state:
-- - Customer value distribution by state (high/medium/low value percentages)
-- - Average order frequency and size by state
-- - Payment method preferences by state
-- - Review engagement rates by state
-- - Seasonal purchasing patterns by state
-- - Identify states with highest growth potential
-- 
-- Focus on actionable insights for regional marketing and expansion

-- Your SQL query here:




-- ============================================================================
-- QUESTION 4: Customer Purchase Journey Analysis
-- ============================================================================
-- Business Question: What are the patterns in customer purchase sequences?
-- 
-- Analyze customer purchase journey patterns:
-- - Customer order sequences and time gaps between purchases
-- - Category switching behavior (what categories customers buy across orders)
-- - Value progression (do customers spend more over time?)
-- - Seasonal purchase timing patterns
-- - Identify customers with expanding vs. contracting purchase patterns
-- - Calculate customer lifecycle stage classifications
-- 
-- This helps understand customer development and predict future behavior

-- Your SQL query here:




-- ============================================================================
-- QUESTION 5: Payment Behavior & Customer Segmentation
-- ============================================================================
-- Business Question: How do payment preferences reveal customer segments?
-- 
-- Analyze payment behavior for customer insights:
-- - Payment method preferences by customer value tier
-- - Installment usage patterns and implications
-- - Geographic payment preference patterns
-- - Correlation between payment methods and customer loyalty
-- - Risk assessment based on payment patterns
-- - Identify opportunities for payment optimization
-- 
-- Payment behavior is a strong indicator of customer psychology and economics

-- Your SQL query here:




-- ============================================================================
-- QUESTION 6: Customer Satisfaction & Retention Drivers
-- ============================================================================
-- Business Question: What drives customer satisfaction and repeat purchases?
-- 
-- Analyze factors affecting customer satisfaction and retention:
-- - Review patterns by customer value segments
-- - Correlation between delivery time and repeat purchases
-- - Impact of product categories on customer satisfaction
-- - Relationship between review scores and customer lifetime value
-- - Identify at-risk customers based on satisfaction patterns
-- - Calculate customer satisfaction impact on business metrics
-- 
-- This connects customer experience to business outcomes

-- Your SQL query here:



-- ============================================================================