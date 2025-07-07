-- ============================================================================
-- SQL PORTFOLIO: DATA VALIDATION & QUALITY CHECK
-- File: setup/data_validation.sql
-- Purpose: Verify data was loaded correctly and check quality
-- ============================================================================

-- ============================================================================
-- SECTION 1: RECORD COUNT VALIDATION
-- ============================================================================

SELECT 'DATA LOADING VERIFICATION' as check_section;

-- Check if all tables have expected record counts
SELECT 
    'customers' as table_name,
    COUNT(*) as actual_count,
    '99,441' as expected_count,
    CASE 
        WHEN COUNT(*) > 99000 THEN 'SUCCESS'
        WHEN COUNT(*) > 0 THEN 'PARTIAL' 
        ELSE 'FAILED'
    END as status
FROM customers

UNION ALL

SELECT 
    'sellers',
    COUNT(*),
    '3,095',
    CASE 
        WHEN COUNT(*) > 3000 THEN 'SUCCESS'
        WHEN COUNT(*) > 0 THEN 'PARTIAL'
        ELSE 'FAILED'
    END
FROM sellers

UNION ALL

SELECT 
    'products',
    COUNT(*),
    '32,951',
    CASE 
        WHEN COUNT(*) > 32000 THEN 'SUCCESS'
        WHEN COUNT(*) > 0 THEN 'PARTIAL'
        ELSE 'FAILED'
    END
FROM products

UNION ALL

SELECT 
    'orders',
    COUNT(*),
    '99,441',
    CASE 
        WHEN COUNT(*) > 99000 THEN 'SUCCESS'
        WHEN COUNT(*) > 0 THEN 'PARTIAL'
        ELSE 'FAILED'
    END
FROM orders

UNION ALL

SELECT 
    'order_items',
    COUNT(*),
    '112,650',
    CASE 
        WHEN COUNT(*) > 112000 THEN 'SUCCESS'
        WHEN COUNT(*) > 0 THEN 'PARTIAL'
        ELSE 'FAILED'
    END
FROM order_items

UNION ALL

SELECT 
    'order_payments',
    COUNT(*),
    '103,886',
    CASE 
        WHEN COUNT(*) > 103000 THEN 'SUCCESS'
        WHEN COUNT(*) > 0 THEN 'PARTIAL'
        ELSE 'FAILED'
    END
FROM order_payments

UNION ALL

SELECT 
    'order_reviews',
    COUNT(*),
    '98,410',
    CASE 
        WHEN COUNT(*) > 98000 THEN 'SUCCESS'
        WHEN COUNT(*) > 0 THEN 'PARTIAL'
        ELSE 'FAILED'
    END
FROM order_reviews

UNION ALL

SELECT 
    'geolocation',
    COUNT(*),
    '1,000,163',
    CASE 
        WHEN COUNT(*) > 1000000 THEN 'SUCCESS'
        WHEN COUNT(*) > 0 THEN 'PARTIAL'
        ELSE 'FAILED'
    END
FROM geolocation

ORDER BY table_name;

-- ============================================================================
-- SECTION 2: FOREIGN KEY INTEGRITY CHECKS
-- ============================================================================

SELECT 'FOREIGN KEY INTEGRITY CHECKS' as check_section;

-- Check for orphaned orders (orders without valid customers)
SELECT 
    'Orders without valid customers' as check_name,
    COUNT(*) as violation_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'FAIL - Data integrity issue'
    END as status
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Check for order_items without valid orders
SELECT 
    'Order items without valid orders' as check_name,
    COUNT(*) as violation_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'FAIL - Data integrity issue'
    END as status
FROM order_items oi
LEFT JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Check for order_items without valid products
SELECT 
    'Order items without valid products' as check_name,
    COUNT(*) as violation_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'FAIL - Data integrity issue'
    END as status
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Check for order_items without valid sellers
SELECT 
    'Order items without valid sellers' as check_name,
    COUNT(*) as violation_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'FAIL - Data integrity issue'
    END as status
FROM order_items oi
LEFT JOIN sellers s ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;

-- ============================================================================
-- SECTION 3: DATA QUALITY CHECKS
-- ============================================================================

SELECT 'DATA QUALITY CHECKS' as check_section;

-- Check for null customer IDs in orders
SELECT 
    'Orders with null customer_id' as check_name,
    COUNT(*) as issue_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'WARNING - Missing customer references'
    END as status
FROM orders
WHERE customer_id IS NULL;

-- Check for negative prices
SELECT 
    'Negative prices in order_items' as check_name,
    COUNT(*) as issue_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'WARNING - Invalid pricing data'
    END as status
FROM order_items
WHERE price < 0;

-- Check for invalid review scores
SELECT 
    'Invalid review scores (not 1-5)' as check_name,
    COUNT(*) as issue_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'WARNING - Invalid review scores'
    END as status
FROM order_reviews
WHERE review_score IS NOT NULL 
AND (review_score < 1 OR review_score > 5);

-- Check order status values
SELECT 
    'Order status distribution' as check_name,
    COUNT(DISTINCT order_status) as unique_statuses,
    'INFO' as status
FROM orders;

-- Show actual order statuses
SELECT 
    order_status,
    COUNT(*) as count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) as percentage
FROM orders
GROUP BY order_status
ORDER BY count DESC;

-- ============================================================================
-- SECTION 4: DATE RANGE VALIDATION
-- ============================================================================

SELECT 'DATE RANGE VALIDATION' as check_section;

-- Check order date ranges
SELECT 
    'Order date range' as check_name,
    MIN(order_purchase_timestamp)::DATE as earliest_date,
    MAX(order_purchase_timestamp)::DATE as latest_date,
    (MAX(order_purchase_timestamp)::DATE - MIN(order_purchase_timestamp)::DATE) as date_span_days,
    'INFO' as status
FROM orders
WHERE order_purchase_timestamp IS NOT NULL;

-- Check for future dates (data quality issue)
SELECT 
    'Orders with future dates' as check_name,
    COUNT(*) as issue_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'WARNING - Future dated orders'
    END as status
FROM orders
WHERE order_purchase_timestamp > CURRENT_TIMESTAMP;

-- Check delivery date logic
SELECT 
    'Orders delivered before purchase' as check_name,
    COUNT(*) as issue_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'WARNING - Invalid delivery dates'
    END as status
FROM orders
WHERE order_delivered_customer_date < order_purchase_timestamp;

-- ============================================================================
-- SECTION 5: SAMPLE DATA PREVIEW
-- ============================================================================

SELECT 'SAMPLE DATA PREVIEW' as check_section;

-- Show sample customer data
SELECT 'Customer Sample' as data_type;
SELECT customer_id, customer_city, customer_state
FROM customers
LIMIT 3;

-- Show sample order data
SELECT 'Order Sample' as data_type;
SELECT order_id, customer_id, order_status, order_purchase_timestamp::DATE
FROM orders
ORDER BY order_purchase_timestamp DESC
LIMIT 3;

-- Show sample product data
SELECT 'Product Sample' as data_type;
SELECT product_id, product_category_name, product_weight_g
FROM products
WHERE product_category_name IS NOT NULL
LIMIT 3;

-- ============================================================================
-- SECTION 6: INDEX VERIFICATION
-- ============================================================================

SELECT 'INDEX VERIFICATION' as check_section;

-- Count created indexes
SELECT 
    'Total indexes created' as metric,
    COUNT(*) as count,
    'INFO' as status
FROM pg_indexes 
WHERE schemaname = 'public' 
AND indexname LIKE 'idx_%';

-- ============================================================================
-- FINAL SUMMARY
-- ============================================================================

SELECT 'VALIDATION COMPLETE' as final_status;
SELECT 'If all checks show SUCCESS or PASS, your database is ready.' as message;

-- Show basic dataset overview
SELECT 
    (SELECT COUNT(*) FROM customers) as customers,
    (SELECT COUNT(*) FROM orders) as orders,
    (SELECT COUNT(*) FROM order_items) as order_items,
    (SELECT COUNT(*) FROM products) as products,
    (SELECT COUNT(*) FROM sellers) as sellers,
    (SELECT COUNT(*) FROM order_reviews) as reviews;