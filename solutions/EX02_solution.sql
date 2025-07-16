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

SELECT 
    customer_id,
    customer_city,
    customer_zip_code_prefix
FROM customers
WHERE customer_state = 'SP'
ORDER BY customer_city
LIMIT 25;

/* Output:
"customer_id","customer_city","customer_zip_code_prefix"
"ed35271185aa3ecf2e421970e47e473f","adamantina","17800"
"9c8238260ea546e75c56fc27c0fedfc8","adamantina","17800"
"f5219627819a30474a6ef14e1598e7f4","adamantina","17800"
"5684f8bf0ee27f2003ba2380c4ba8b08","adamantina","17800"
"cc6a744ba14a060493fb64b97087006c","adamantina","17800"
"9872961494c04c3939cc4fa43bfaeb75","adamantina","17800"
"4d32a98e390433a11d785b4078826807","adamantina","17800"
"370e9b111968bd747c429eb56c54c8e3","adamantina","17800"
"a54c7810d4a0a3563f11fb6ce6acf771","adamantina","17800"
"8d530bb376a32c1a88884c941bfa3789","adamantina","17800"
"60b2dc4d4414526a06f5fe22755855b5","adamantina","17800"
"7cc0b4bdda5ded8e2710e12b866a2cf3","adamantina","17800"
"c4ac325fd53cbbb5fefd94260aef1c04","adamantina","17800"
"cf143d2640cfdce2f9573ed4631b2cc1","adamantina","17800"
"0ab14736076aeefb2a545f8c89931f9f","adamantina","17800"
"ddc55f221691ae89eedd4bdcd17014e4","adamantina","17800"
"e3f08093f6e3b8dfb0fd0c7c165fbc6b","adamantina","17800"
"26cad29ce2fd0d9203145f2d71b7aa43","adamantina","17800"
"013b46f9a2576623a655fd9469b7c583","adamantina","17800"
"f134b34785e8dac47c9ef048c49f0916","adamantina","17800"
"6bec28a0162e9cf0dac2934b4c158954","adamantina","17800"
"fe5354f706b809fd278ab2bd1bed05c1","adamantina","17800"
"e99979ecd47f84f3d8be57c2a1080ef6","adamantina","17800"
"68795255746d33fae2c9d3557d4e64d6","adamantina","17800"
"88f6fc71994589a43aa54a32115c7c97","adamantina","17800"
*/


-- ============================================================================
-- QUESTION 4: Status-based Analysis
-- ============================================================================
-- Business Question: Which orders need attention?
-- Write a query to find orders that are NOT delivered:
-- - Show orders with status: 'shipped', 'processing', 'canceled'
-- - Include: order_id, customer_id, order_status, order_purchase_timestamp
-- - Sort by order_purchase_timestamp (oldest first)

-- Your SQL query here:

SELECT 
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    -- With delivery issue analysis:
    CASE 
        WHEN order_status = 'canceled' THEN 'Needs refund processing'
        WHEN order_status = 'processing' THEN 'Needs fulfillment attention'
        WHEN order_status = 'shipped' THEN 'In transit, monitor delivery'
        ELSE 'Review needed'
    END as action_needed
FROM orders
WHERE order_status IN ('shipped', 'processing', 'canceled')
ORDER BY order_purchase_timestamp ASC;

/* Output:
"order_id","customer_id","order_status","order_purchase_timestamp","action_needed"
"2e7a8482f6fb09756ca50c10d7bfc047","08c5351a6aca1c1589a38f244edeee9d","shipped","2016-09-04 21:15:19","In transit, monitor delivery"
"e5fa5a7210941f7d56d0208e4e071d35","683c54fc24d40ee9f8a6fc179fd9856c","canceled","2016-09-05 00:15:34","Needs refund processing"
"809a282bbd5dbcabb6f2f724fca862ec","622e13439d6b5a0b486c435618b2679e","canceled","2016-09-13 15:24:19","Needs refund processing"
"71303d7e93b399f5bcd537d124c0bcfa","b106b360fe2ef8849fbbd056f777b4d5","canceled","2016-10-02 22:07:52","Needs refund processing"
"65d1e226dfaeb8cdc42f665422522d14","70fc57eeae292675927697fe03ad3ff5","canceled","2016-10-03 21:01:41","Needs refund processing"
...
"a2ac6dad85cf8af5b0afb510a240fe8c","4c2ec60c29d10c34bd49cb88aa85cfc4","canceled","2018-10-03 18:55:29","Needs refund processing"
"b059ee4de278302d550a3035c4cdb740","856336203359aa6a61bf3826f7d84c49","canceled","2018-10-16 20:16:02","Needs refund processing"
"10a045cdf6a5650c21e9cfeb60384c16","a4b417188addbc05b26b72d5e44837a1","canceled","2018-10-17 17:30:18","Needs refund processing"
*/

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

SELECT 
    op.order_id,
    op.payment_value,
    op.payment_installments
FROM order_payments op
WHERE op.payment_type = 'credit_card'
  AND op.payment_installments > 1
ORDER BY op.payment_value DESC
LIMIT 15;

/* Output:
"order_id","payment_value","payment_installments"
"0812eb902a67711a1cb742b3cdaa65ae","6929.31",8
"a96610ab360d42a2e5335a3998b4718a","4950.34",10
"b4c4b76c642808cbe472a32b86cddc95","4809.44",5
"199af31afc78c699f0dbf71fb178d4d4","4764.34",8
"8dbc85d1447242f3b127dda390d56e19","4681.78",8
"426a9742b533fc6fed17d1fd6d143d7e","4513.32",10
"68101694e5c5dc7330c91e1bbc36214f","4175.26",10
"9a3966c23190dbdbaabed08e8429c006","4042.74",5
"86c4eab1571921a6a6e248ed312f5a5a","4016.91",8
"9de73f3e6157169ad6c32b9f313c7dcb","3899.00",10
"a53e05ecd2ed1f46a2b8e1f5828be7c6","3826.80",10
"d3f66901a6743e15f9311547cc623b91","3792.59",8
"fc20b8e282da6f3fbcdd3a3cedecb723","3782.19",10
"e85c92ee6a3ba1ef47e41c23286314d9","3736.22",10
"3a4b013e014723cc38c9faa8ffdc6387","3526.46",8
*/

-- ============================================================================
-- QUESTION 6: Product Category Search
-- ============================================================================
-- Business Question: What electronics do we sell?
-- Write a query to find products in categories containing 'eletronicos':
-- - Use LIKE operator to find categories with 'eletronicos' in the name
-- - Show: product_id, product_category_name
-- - Count how many products are in electronics categories
-- - Sort by product_id

-- Your SQL query here:

SELECT 
    product_id,
    product_category_name,
    COUNT(*) AS total_electronic_products
FROM products
WHERE product_category_name LIKE '%eletronicos%'
GROUP BY product_id, product_category_name
ORDER BY product_id;

/* Output:
"product_id","product_category_name","total_electronic_products"
"00f8c37377b038c9c791128d2f928111","eletronicos","1"
"01604238fbc11ce379e537a76b26bc94","eletronicos","1"
"01cf56cd6138b926a4802d16fc304149","eletronicos","1"
"01ecf875ab885ebcae3dd2b1ccc4715f","eletronicos","1"
"026ddfe4a1a29002815e6da024d6128e","eletronicos","1"
"02b824e9f1158bc1005e058c4ea78e8d","eletronicos","1"
...
"ff8ff756fe1137ed22300ccd2190703a","eletronicos","1"
"ffa255211c5d16ec8ebadcb5729c96ce","eletronicos","1"
*/

-- Count total electronic products:
SELECT 
    COUNT(*) AS total_electronic_products
FROM products
WHERE product_category_name ILIKE '%eletronicos%';

/* Output:
"total_electronic_products"
"517"
*/

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

SELECT 
    review_id,
    order_id,
    review_score,
    review_creation_date
FROM order_reviews
WHERE review_score IN (1, 2)
ORDER BY review_creation_date DESC
LIMIT 10;

/* Output:
"review_id","order_id","review_score","review_creation_date"
"68e602e3915b6eb3af516cdb09de5961","f4544b707c2c9583440b3ea50b0fc3a6",1,"2018-08-31 00:00:00"
"0f5084fcf0c444f3d5dcf3a9906eaa23","e1618c8576ca46d8e460cd2219eb2750",1,"2018-08-31 00:00:00"
"3058dd3c26b382fae64f265dc1bd3274","829dd3ef512422255299763d6cce8f96",2,"2018-08-31 00:00:00"
"ba111b6b5d6264a80e54cd109c98398c","73a15e8fc5de8485d1f16639bc66a273",1,"2018-08-31 00:00:00"
"05d3874965dd1ba4330bab86c5fff9aa","cd5343ffb012a7157ddbcf5720100c01",1,"2018-08-31 00:00:00"
"eeec16a7667595b6bdd2e6b4c6d47216","e7c290bfc31d7eed478c3d3d2d4d2953",2,"2018-08-31 00:00:00"
"90ce115f3007a837435da45c6f9d6c72","e3ce941c85b5ae1ae2862a7344cbb845",2,"2018-08-31 00:00:00"
"8f28fc7d29a09403973697645d73b72a","00310b0c75bb13015ec4d82d341865a4",1,"2018-08-31 00:00:00"
"4ffd9f7aef49eccd6fe4cc4090f0429a","7d65ecd2eaff130dfa5beaec6aeb82d5",2,"2018-08-31 00:00:00"
"2b6649bd0a6f3d3370377e5cbfe7d256","a5875ee134166b373cc08cbea838760c",1,"2018-08-31 00:00:00"
*/


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

SELECT 
    order_id,
    payment_value,
    payment_installments
FROM order_payments
WHERE payment_value < 50
ORDER BY payment_value ASC;

/* Output for small orders:
"order_id","payment_value","payment_installments"
"b23878b3e8eb4d25a158f57d96331b18","0.00",1
"6ccb433e00daae1283ccc956189c82ae","0.00",1
"45ed6e85398a87c253db47c2d9f48216","0.00",1
...
"4adbbb43be305843794e05fc4265f143","49.99",1
"9c82bca31120157620aa240857a67802","49.99",5
"7af96e4998e17a87ca43a79b93e112c9","49.99",1
*/

-- b) Large orders (> 500 BRL):

SELECT 
    order_id,
    payment_value,
    payment_installments
FROM order_payments
WHERE payment_value > 500
ORDER BY payment_value DESC;

/* Output for large orders:
"order_id","payment_value","payment_installments"
"03caa2c082116e1d31e67e9ae3700499","13664.08",1
"736e1922ae60d0d6a89247b851902527","7274.88",1
"0812eb902a67711a1cb742b3cdaa65ae","6929.31",8
...
"4ac61ca13c944e7c498a7b0a65f8dcc3","500.13",4
"661e77bbf3e487db278f9fdef584550b","500.04",10
*/

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

SELECT 
    order_id,
    order_purchase_timestamp,
    order_delivered_customer_date,
    DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp) AS days_to_deliver
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp) > 30
ORDER BY days_to_deliver DESC
LIMIT 20;

/* Output:
"order_id","order_purchase_timestamp","order_delivered_customer_date","days_to_deliver"
"ca07593549f1816d26a572e06dc1eab6","2017-02-21 23:31:27","2017-09-19 14:36:39","209"
"1b3190b2dfa9d789e1f14c05b647a14a","2018-02-23 14:57:35","2018-09-19 23:24:07","208"
"440d0d17af552815d15a9e41abe49359","2017-03-07 23:59:51","2017-09-19 15:12:50","195"
"285ab9426d6982034523a855f55a885e","2017-03-08 22:47:40","2017-09-19 14:00:04","194"
"0f4519c5f1c541ddec9f21b3bddd533a","2017-03-09 13:26:57","2017-09-19 14:38:21","194"
"2fb597c2f772eca01b1f5c561bf6cc7b","2017-03-08 18:09:02","2017-09-19 14:33:17","194"
"47b40429ed8cce3aee9199792275433f","2018-01-03 09:44:01","2018-07-13 20:51:31","191"
"2fe324febf907e3ea3f2aa9650869fa5","2017-03-13 20:17:10","2017-09-19 17:00:07","189"
"2d7561026d542c8dbd8f0daeadf67a43","2017-03-15 11:24:27","2017-09-19 14:38:18","188"
"c27815f7e3dd0b926b58552628481575","2017-03-15 23:23:17","2017-09-19 17:14:25","187"
"437222e3fd1b07396f1d9ba8c15fba59","2017-03-16 11:36:00","2017-09-19 16:28:58","187"
"dfe5f68118c2576143240b8d78e5940a","2017-03-17 12:32:22","2017-09-19 18:13:19","186"
"6e82dcfb5eada6283dba34f164e636f5","2017-05-17 19:09:02","2017-11-16 10:56:45","182"
"2ba1366baecad3c3536f27546d129017","2017-02-28 14:56:37","2017-08-28 16:23:46","181"
"d24e8541128cea179a11a65176e0a96f","2017-06-12 13:14:11","2017-12-04 18:36:29","175"
"3566eabb132f8d64741ae7b921bbd10e","2017-03-29 13:57:55","2017-09-19 15:07:09","174"
"ed8e9faf1b75f43ee027103957135663","2017-11-29 15:10:14","2018-05-21 18:22:18","173"
"2fa29503f2ebd9f53deba187160f3202","2017-03-31 15:03:51","2017-09-19 18:24:46","172"
"df6d8b7768a047c2981bae0a24afbb01","2017-04-04 10:46:22","2017-09-19 15:08:19","168"
"4fbc8d6f2f4db3e789d5a876fa349b56","2018-02-02 21:38:36","2018-07-20 23:37:50","168"
*/

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

SELECT 
    seller_id,
    seller_city,
    seller_state
FROM sellers
WHERE LOWER(seller_city) IN ('sao paulo', 'rio de janeiro', 'belo horizonte')
ORDER BY seller_state, seller_city;

/* Output:
"seller_id","seller_city","seller_state"
"6df688df543f90e9b38f4319e75a9d88","belo horizonte","MG"
"6cd68b3ed6d59aaa9fece558ad360c0a","belo horizonte","MG"
...
"d05ae8f7a5bd1d2a690a44cd079e4e27","rio de janeiro","RJ"
"579891617139df7d8671d373f0669622","rio de janeiro","RJ"
"392f7f2c797e4dc077e4311bde2ab8ce","rio de janeiro","RN"
"289cdb325fb7e7f891c38608bf9e0962","belo horizonte","SP"
...
"95b293867b5862941c9cd74f756a3c68","sao paulo","SP"
"e62b2d6ac10570a035a30bafcf01d263","sao paulo","SP"
*/


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

SELECT 
    order_id,
    order_purchase_timestamp,
    order_delivered_customer_date,
    DATE_PART('day', order_delivered_customer_date - order_purchase_timestamp) AS delivery_time_days
FROM orders
WHERE EXTRACT(YEAR FROM order_purchase_timestamp) = 2017
  AND EXTRACT(MONTH FROM order_purchase_timestamp) = 12
  AND order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
ORDER BY delivery_time_days ASC;

/* Output:
"order_id","order_purchase_timestamp","order_delivered_customer_date","delivery_time_days"
"0ad3d55b3745d0afb5dd2d9f86c25dbb","2017-12-28 00:09:13","2017-12-29 16:02:55","1"
"3e30e6710e775ebfeecbd90fad476396","2017-12-11 18:18:04","2017-12-13 17:29:13","1"
...
"e52c9dfec957c503bed5d050a39c740f","2017-12-09 18:49:23","2018-03-27 01:57:14","107"
"29c3b79aace1b72a82b1232bf494e16f","2017-12-16 10:04:35","2018-04-28 15:51:50","133"
"0b7b12a402b064d880d3cb31051f6d29","2017-12-02 14:49:30","2018-04-19 21:18:52","138"
*/

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

SELECT 
    order_id,
    order_status,
    order_purchase_timestamp,
    order_delivered_customer_date
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NULL
ORDER BY order_purchase_timestamp;

/* Output:
"order_id","order_status","order_purchase_timestamp","order_delivered_customer_date"
"2d858f451373b04fb5c984a1cc2defaf","delivered","2017-05-25 23:22:43",NULL
"2d1e2d5bf4dc7227b3bfebb81328c15f","delivered","2017-11-28 17:44:07",NULL
"ab7c89dc1bf4a1ead9d6ec1ec8968a84","delivered","2018-06-08 12:09:39",NULL
"f5dd62b788049ad9fc0526e3ad11a097","delivered","2018-06-20 06:58:43",NULL
"20edc82cf5400ce95e1afacc25798b31","delivered","2018-06-27 16:09:12",NULL
"2ebdfc4f15f23b91474edf87475f108e","delivered","2018-07-01 17:05:11",NULL
"0d3268bad9b086af767785e3f0fc0133","delivered","2018-07-01 21:14:02",NULL
"e69f75a717d64fc5ecdfae42b2e8e086","delivered","2018-07-01 22:05:55",NULL
*/

-- ============================================================================

/*
Insights:
- High-value products are primarily in electronics and home appliances.
- São Paulo has the highest number of customers, indicating a strong market presence.
- Many orders are delayed, with some taking over 200 days to deliver.
- Credit card payments dominate, especially for high-value orders.
- Electronics categories are diverse, with many products available.
- Poor reviews are rare, but when they occur, they often relate to delivery issues.
- Small orders are common, but large orders (> 500 BRL) are significant for revenue.
- Data quality issues exist with missing delivery dates for delivered orders, indicating potential system errors.
- Major cities like São Paulo and Rio de Janeiro have a significant number of sellers, indicating strong market competition.
- December 2017 saw a mix of fast and slow deliveries, with some orders taking over 100 days to deliver despite being marked as 'delivered'.
- NULL values in delivery dates for delivered orders suggest data integrity issues that need to be addressed.
- Overall, the dataset provides valuable insights into customer behavior, product performance, and operational challenges.
*/