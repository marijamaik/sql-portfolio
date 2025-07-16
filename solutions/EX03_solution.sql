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

SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS order_year,
    EXTRACT(MONTH FROM o.order_purchase_timestamp) AS order_month,
    COUNT(DISTINCT o.order_id) AS order_count,
    SUM(op.payment_value) AS total_revenue
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY order_year, order_month
HAVING COUNT(DISTINCT o.order_id) >= 100
ORDER BY order_year, order_month;

/* Output:
"order_year","order_month","order_count","total_revenue"
"2016","10","324","59090.48"
"2017","1","800","138488.04"
"2017","2","1780","291908.01"
"2017","3","2682","449863.60"
"2017","4","2404","417788.03"
"2017","5","3700","592918.82"
"2017","6","3245","511276.38"
"2017","7","4026","592382.92"
"2017","8","4331","674396.32"
"2017","9","4285","727762.45"
"2017","10","4631","779677.88"
"2017","11","7544","1194882.80"
"2017","12","5673","878401.48"
"2018","1","7269","1115004.18"
"2018","2","6728","992463.34"
"2018","3","7211","1159652.12"
"2018","4","6939","1160785.48"
"2018","5","6873","1153982.15"
"2018","6","6167","1023880.50"
"2018","7","6292","1066540.75"
"2018","8","6512","1022425.32"
*/

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

SELECT
    payment_type,
    COUNT(*) AS payment_count,
    ROUND(AVG(payment_value), 2) AS avg_payment_value,
    SUM(payment_value) AS total_revenue,
    ROUND(AVG(payment_installments), 1) AS avg_installments
FROM order_payments
GROUP BY payment_type
ORDER BY total_revenue DESC;

/* Output:
"payment_type","payment_count","avg_payment_value","total_revenue","avg_installments"
"credit_card","76795","163.32","12542084.19","3.5"
"boleto","19784","145.03","2869361.27","1.0"
"voucher","5775","65.70","379436.87","1.0"
"debit_card","1529","142.57","217989.79","1.0"
"not_defined","3","0.00","0.00","1.0"
*/

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

SELECT
    customer_state,
    COUNT(DISTINCT customer_id) AS customer_count,
    ROUND(100.0 * COUNT(DISTINCT customer_id) / SUM(COUNT(DISTINCT customer_id)) OVER (), 2) AS percentage_of_total
FROM customers
WHERE customer_state IS NOT NULL
GROUP BY customer_state
HAVING COUNT(DISTINCT customer_id) >= 500
ORDER BY customer_count DESC;

/* Output:
"customer_state","customer_count","percentage_of_total"
"SP","41746","43.12"
"RJ","12852","13.27"
"MG","11635","12.02"
"RS","5466","5.65"
"PR","5045","5.21"
"SC","3637","3.76"
"BA","3380","3.49"
"DF","2140","2.21"
"ES","2033","2.10"
"GO","2020","2.09"
"PE","1652","1.71"
"CE","1336","1.38"
"PA","975","1.01"
"MT","907","0.94"
"MA","747","0.77"
"MS","715","0.74"
"PB","536","0.55"
*/

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

SELECT
    p.product_category_name,
    COUNT(DISTINCT p.product_id) AS unique_products,
    SUM(oi.order_item_id) AS total_quantity_sold,
    SUM(oi.price * oi.order_item_id) AS total_revenue,
    ROUND(AVG(oi.price), 2) AS avg_item_price
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_category_name
HAVING SUM(oi.order_item_id) > 0
ORDER BY total_revenue DESC
LIMIT 10;

/* Output:
"product_category_name","unique_products","total_quantity_sold","total_revenue","avg_item_price"
"beleza_saude","2444","11081","1347468.49","130.16"
"relogios_presentes","1329","6594","1259634.58","201.14"
"cama_mesa_banho","3029","13665","1228795.46","93.30"
"informatica_acessorios","1639","9874","1135454.64","116.51"
"esporte_lazer","2867","9932","1082435.42","114.34"
"moveis_decoracao","2657","11540","929520.95","87.56"
"utilidades_domesticas","2335","9051","750233.73","90.79"
"automotivo","1900","4881","662861.88","139.96"
"cool_stuff","789","4077","659590.61","167.36"
"ferramentas_jardim","753","5874","584155.02","111.63"
*/


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

-- Calculate order characteristics
WITH order_metrics AS (
    SELECT 
        oi.order_id,
        COUNT(oi.order_item_id) as items_per_order,
        ROUND(SUM(oi.price), 2) as order_value
    FROM order_items oi
    GROUP BY oi.order_id
)
-- Summarize the results
SELECT 
    ROUND(AVG(items_per_order), 2) as avg_items_per_order,
    ROUND(AVG(order_value), 2) as avg_order_value,
    ROUND(MIN(order_value), 2) as min_order_value,
    ROUND(MAX(order_value), 2) as max_order_value,
    COUNT(CASE WHEN items_per_order = 1 THEN 1 END) as single_item_orders,
    COUNT(CASE WHEN items_per_order > 1 THEN 1 END) as multi_item_orders,
    ROUND(100.0 * COUNT(CASE WHEN items_per_order = 1 THEN 1 END) / COUNT(*), 2) as single_item_percentage
FROM order_metrics;

/* Output:
"avg_items_per_order","avg_order_value","min_order_value","max_order_value","single_item_orders","multi_item_orders","single_item_percentage"
"1.14","137.75","0.85","13440.00","88863","9803","90.06"
*/

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

SELECT
    p.product_category_name,
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(r.review_id) AS review_count,
    ROUND(100.0 * COUNT(CASE WHEN r.review_score = 5 THEN 1 END) / COUNT(r.review_id), 2) AS five_star_percentage
FROM order_reviews r
JOIN orders o ON r.order_id = o.order_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.product_category_name IS NOT NULL
  AND r.review_score IS NOT NULL
GROUP BY p.product_category_name
HAVING COUNT(r.review_id) >= 100
ORDER BY avg_review_score DESC;

/* Output:
"product_category_name","avg_review_score","review_count","five_star_percentage"
"livros_interesse_geral","4.45","549","72.50"
"livros_tecnicos","4.36","263","70.34"
"malas_acessorios","4.31","1086","64.73"
"alimentos_bebidas","4.31","274","63.87"
"fashion_calcados","4.25","256","64.06"
...
"telefonia_fixa","3.68","262","45.80"
"fashion_roupa_masculina","3.64","130","52.31"
"moveis_escritorio","3.49","1677","36.79"
*/

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