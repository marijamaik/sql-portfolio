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

SELECT 
    order_id,
    customer_id,
    order_purchase_timestamp,
    order_status
FROM orders
WHERE EXTRACT(YEAR FROM order_purchase_timestamp) = 2017
/* Alternative date range filter:
WHERE order_purchase_timestamp >= '2017-01-01'
  AND order_purchase_timestamp < '2018-01-01'
*/
ORDER BY order_purchase_timestamp DESC
LIMIT 20;

/* Output:
"order_id","customer_id","order_purchase_timestamp","order_status"
"070a76f4c338fe3cda93745a22e51270","de4f592a5c6155b2fe6f87b30aaeec9c","2017-12-31 23:29:31","delivered"
"8acda261d8c76b3206d9cb5279d0a18a","dc3daad47c0792f3bd4366246a7955dc","2017-12-31 23:24:10","delivered"
"18f39cbc016f34a22c870ef03cba5641","92566e623b70efba98063150b200cba4","2017-12-31 22:14:53","delivered"
"43e38490d21c8c490334f75c5a7c2861","2f368064b4e6646a7784a46b03b4bcbc","2017-12-31 21:17:54","delivered"
"60d98124c3228470422ecadff6550e3c","98a1a1e41310f70974831b79bf01e4e6","2017-12-31 21:10:02","delivered"
"136f44c4aee8436faeb4d831e83344ef","ce3fd019ee6c37bef63731c9aa9ae70e","2017-12-31 21:03:13","delivered"
"0c355e13567802628373895daf5f0a61","3e3cb27f0d01f9763177c6de2d4bf139","2017-12-31 20:17:14","delivered"
"f813be1cdc38407e8e55a3ff18509b8d","58aad244991735b54dffc6781d3a508d","2017-12-31 19:38:28","delivered"
"35298b52820bdcc64b7bf71ccc28a36c","52496ddf0025f7b0ec3cb640a97990f8","2017-12-31 19:28:24","delivered"
"d9009d1d046dfcfcdc8deb608482e570","7e1936a6225e2de4e07205ba49dc7de7","2017-12-31 19:10:00","delivered"
"29049da83627b9d57b5f4f9bf861378c","c277744e507e2e184d51d5e438b90103","2017-12-31 18:40:52","delivered"
"bfde1814043e239cb93af22b6b09214b","f10f70292bca6ab2abd34b96b08d312d","2017-12-31 18:35:45","delivered"
"ac305427188e9565c90c55a300d21206","13e36720b99a82c65a4701e93acdd6a4","2017-12-31 18:15:52","delivered"
"048e6e4623dbf118c43e0f5572016faa","7c43cc8f6953deea674d34207a646886","2017-12-31 17:57:21","delivered"
"56f67ddc4dcd366ecf0d6ac941581ac3","2b135100730ee38ba51b4e01aa8d23bf","2017-12-31 17:56:51","delivered"
"b72528954592dd3225bff1b524a08dda","68dd34002f944ab9a6fa25771296a550","2017-12-31 17:55:07","delivered"
"5d33903bb05adb5e3110148fef46e92e","bf7c8f97ec53670a016b95248a03528e","2017-12-31 17:42:13","delivered"
"203dfaee9b8175009f58d07065d8ee8f","6b05152bdc92e7134f747c0d0db61d37","2017-12-31 17:38:44","delivered"
"a08091683d8adb340e3b204a12e48b02","bb633302ed9e9ab6619faf5f96beeb57","2017-12-31 17:23:20","delivered"
"20e6ee55f4ed8d49e64540668547a14e","7e1cc7ea671a5c655c0ed5f06c897f95","2017-12-31 16:56:09","delivered"
*/


-- ============================================================================
-- QUESTION 2: Price Range Analysis
-- ============================================================================
-- Business Question: What are our high-value products?
-- Write a query to find products with price greater than 100 BRL:
-- - Show: product_id, product_category_name, price
-- - Order by price (highest first)
-- - Include only products that have been ordered at least once

-- Your SQL query here:

SELECT DISTINCT
    p.product_id,
    p.product_category_name,
    oi.price
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.price > 100
ORDER BY oi.price DESC;

/* Output:
"product_id","product_category_name","price"
"489ae2aa008f021502940f251d4cce7f","utilidades_domesticas","6735.00"
"69c590f7ffc7bf8db97190b6cb6ed62e","pcs","6729.00"
"1bdf5e6731585cf01aa8169c7028d6ad","artes","6499.00"
"a6492cc69376c469ab6f61d8f44de961","eletroportateis","4799.00"
...
"2b62c18e1379676edad99be2c9bf9a9d","malas_acessorios","100.33"
"5192b3aef1e52554497d72e7f5b97f28","cama_mesa_banho","100.21"
"f9259c9e7c0f12c70f7a81409680a5ff","esporte_lazer","100.13"
"c21bd5b6be0663cddb80ec6744d6ca24","esporte_lazer","100.01"
*/


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