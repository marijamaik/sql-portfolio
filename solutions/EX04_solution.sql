-- ============================================================================
-- SQL PORTFOLIO: EXERCISE 04 - JOINS & RELATIONSHIPS
-- ============================================================================
-- OBJECTIVE: Combine data from multiple tables using different JOIN types
-- SKILLS: INNER JOIN, LEFT JOIN, RIGHT JOIN, multi-table joins, relationship analysis
-- BUSINESS CONTEXT: Real business insights require combining data from multiple 
--                   related tables to get complete pictures
-- ============================================================================

-- ============================================================================
-- QUESTION 1: Customer Order Summary
-- ============================================================================
-- Business Question: What are the complete details of customer orders?
-- Write a query to show customer information with their orders:
-- - Customer ID, city, and state
-- - Order ID, purchase timestamp, and status
-- - Total order value (sum of all payments for the order)
-- - Number of payment installments used
-- Use INNER JOIN to show only customers who have placed orders
-- Sort by order purchase timestamp (most recent first)
-- Limit to 25 results

-- Your SQL query here:

SELECT 
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_id,
    o.order_purchase_timestamp,
    o.order_status,
    ROUND(SUM(op.payment_value), 2) as total_order_value,
    op.payment_installments as avg_installments
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_id, c.customer_city, c.customer_state, o.order_id, o.order_purchase_timestamp, o.order_status
ORDER BY o.order_purchase_timestamp DESC
LIMIT 25;

/* Output:
"customer_id","customer_city","customer_state","order_id","order_purchase_timestamp","order_status","total_order_value","total_installments"
"a4b417188addbc05b26b72d5e44837a1","sorocaba","SP","10a045cdf6a5650c21e9cfeb60384c16","2018-10-17 17:30:18","canceled","89.71","1"
"856336203359aa6a61bf3826f7d84c49","picos","PI","b059ee4de278302d550a3035c4cdb740","2018-10-16 20:16:02","canceled","222.03","1"
"4c2ec60c29d10c34bd49cb88aa85cfc4","registro","SP","a2ac6dad85cf8af5b0afb510a240fe8c","2018-10-03 18:55:29","canceled","197.55","1"
"bf6181a85bbb4115736c0a8db1a53be3","pirai","RJ","616fa7d4871b87832197b2a137a115d2","2018-10-01 15:30:09","canceled","80.38","1"
"2823ffda607a2316375088e0d00005ec","guarulhos","SP","392ed9afd714e3c74767d0c4d3e3f477","2018-09-29 09:13:03","canceled","137.03","1"
"55c9dad94ec1a2ba57998bdb376c230a","petropolis","RJ","869997fbe01f39d184956b5c6bccfdbe","2018-09-26 08:40:15","canceled","94.63","1"
"7a8a02e54cf3472df427e927f8b9c046","belo horizonte","MG","5aac76cf7b07dd06fa4d50bf461d2f40","2018-09-25 11:59:18","canceled","221.54","1"
"191984a8ba4cbb2145acb4fe35b69664","santa luzia","MG","ed3efbd3a87bea76c2812c66a0b32219","2018-09-20 13:54:16","canceled","191.46","1"
"ad2eb5d02c0808bcd8743117f6383cf6","belo horizonte","MG","bd35b677fd239386e9861d11ae98ab56","2018-09-17 17:21:16","canceled","84.58","1"
"6ddc45ad08e6a2c885ca2255fc52d6df","mafra","SC","ea844c92cf978ea23321fa7fe5871761","2018-09-13 09:56:12","canceled","414.04","1"
"d6441eef3f37c3edb0d5634c3c85120b","belo horizonte","MG","1ad22e16129698e1a3cc11e4350d2cb7","2018-09-12 15:32:16","canceled","84.58","1"
"fea4d57ed3a45455f89c25ef3dae8ee8","taubate","SP","87ae60ef8b08ae0e5f903cacb53a6904","2018-09-11 16:45:54","canceled","258.67","1"
"002b5342c72978cf0aba6aae1f5d5293","rio de janeiro","RJ","21a00b08cbeb5716bbb66105e3dbd850","2018-09-10 17:51:25","canceled","51.17","1"
"2f0524a7b1b3845a1a57fcf3910c4333","sao paulo","SP","a89abace0dcc01eeb267a9660b5ac126","2018-09-06 18:45:47","canceled","107.13","1"
"ead83a4f8f7be8c3034b2e98754a6147","santana de parnaiba","SP","4d59cc2a2e7bb6c0a851725f5888a9b5","2018-09-06 14:50:07","canceled","69.46","1"
"36b182c39933d55e307096ccc3fd2970","praia grande","SP","afb61112fb99b07fe17e591c68c0c84c","2018-09-06 10:48:12","canceled","2266.61","1"
"0ab5ac09913dfd3f247c7929a3799799","registro","SP","cfdfd7862e532c4ec1ed1c6a1b56d320","2018-09-03 18:45:34","canceled","197.55","1"
"a7c87c25dbdded68c26c640582cb5ddb","petropolis","RJ","0d3adebce4bebc1f80a7f36e9833f497","2018-09-03 18:40:50","canceled","94.63","1"
"a73c1f73f5772cf801434bf984b0b1a7","sao paulo","SP","4637ca194b6387e2d538dc89b124b0ee","2018-09-03 14:14:25","canceled","0.00","1"
"4b7decb9b58e2569548b8b4c8e20e8d7","sao paulo","SP","54282e97f61c23b78330c15b154c867d","2018-09-03 09:06:57","shipped","166.46","1"
"0b0d6095c5555fe083844281f6b093bb","santos","SP","3a3cddda5a7c27851bd96c3313412840","2018-08-31 16:13:44","canceled","63.89","1"
"93ccdc49f22d1b0e3664b2bc328cf23d","santana de parnaiba","SP","572c4bbf0f5f85a9b4a2c4fe0c7f04d5","2018-08-30 15:11:58","canceled","69.46","1"
"032a544bbe984490f6ff7450e3c8b0bc","presidente prudente","SP","2663ce3526465b7ee9809428adabdc45","2018-08-30 13:07:46","canceled","71.61","1"
"c2a1740e781cc978dbab71735cf3ce84","sao paulo","SP","bb8edfe0742a6a0279b7dff848289568","2018-08-30 10:24:34","canceled","72.98","1"
"8762d94c493b70216cd453ea2320234e","sumare","SP","0a472c47d928bf4cd8b6a7a30345eeb7","2018-08-30 10:14:00","canceled","490.99","1"
*/

-- ============================================================================
-- QUESTION 2: Product Sales Performance
-- ============================================================================
-- Business Question: Which products are selling well and what are their details?
-- Write a query combining products and order_items:
-- - Product ID and category name
-- - Product weight and dimensions (length, height, width)
-- - Total quantity sold (sum of quantity from order_items)
-- - Total revenue (sum of price from order_items)
-- - Average selling price per unit
-- - Number of different orders this product appeared in
-- Include only products that have been sold at least once
-- Sort by total revenue (highest first)
-- Show top 20 products

-- Your SQL query here:

SELECT 
    p.product_id,
    p.product_category_name,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm,
    COUNT(oi.order_item_id) as total_quantity_sold,
    ROUND(SUM(oi.price), 2) as total_revenue,
    ROUND(AVG(oi.price), 2) as avg_selling_price,
    COUNT(DISTINCT oi.order_id) as unique_orders
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_category_name, p.product_weight_g, p.product_length_cm, p.product_height_cm, p.product_width_cm
ORDER BY total_revenue DESC
LIMIT 20;

/* Output:
"product_id","product_category_name","product_weight_g","product_length_cm","product_height_cm","product_width_cm","total_quantity_sold","total_revenue","avg_selling_price","unique_orders"
"bb50f2e236e5eea0100680137654686c","beleza_saude","400.00","34.00","4.00","22.00","195","63885.00","327.62","187"
"6cdd53843498f92890544667809f1595","beleza_saude","900.00","25.00","12.00","38.00","156","54730.20","350.83","151"
"d6160fb7873f184099d9bc95e30376af","pcs","2600.00","16.00","31.00","39.00","35","48899.34","1397.12","35"
"d1c427060a0f73f6b889a5c7c61f2ac4","informatica_acessorios","6550.00","20.00","20.00","20.00","343","47214.51","137.65","323"
"99a4788cb24856965c36a24e339b6058","cama_mesa_banho","1383.00","50.00","10.00","40.00","488","43025.56","88.17","467"
"3dd2a17168ec895c781a9191c1e95ad7","informatica_acessorios","533.00","22.00","11.00","20.00","274","41082.60","149.94","255"
"25c38557cf793876c5abdd5931f922db","bebes","15800.00","38.00","62.00","57.00","38","38907.32","1023.88","38"
"5f504b3a1c75b73d6151be81eb05bdc9","cool_stuff","15350.00","47.00","40.00","47.00","63","37733.90","598.95","63"
"53b36df67ebb7c41585e8d54d6772e08","relogios_presentes","584.00","16.00","11.00","13.00","323","37683.42","116.67","306"
"aca2eb7d00ea1a7b8ebd4e68314663af","moveis_decoracao","2600.00","50.00","10.00","30.00","527","37608.90","71.36","431"
"e0d64dcfaa3b6db5c54ca298ae101d05","relogios_presentes","4338.00","17.00","12.00","14.00","194","31786.82","163.85","194"
"d285360f29ac7fd97640bf0baef03de0","relogios_presentes","363.00","18.00","13.00","13.00","123","31623.81","257.10","122"
"7a10781637204d8d10485c71a6108a2e","relogios_presentes","342.00","18.00","13.00","15.00","143","30467.50","213.06","142"
"f1c7f353075ce59d8a6f3cf58f419c9c","cama_mesa_banho","9750.00","35.00","12.00","30.00","154","29997.36","194.79","150"
"f819f0c84a64f02d3a5606ca95edd272","relogios_presentes","710.00","19.00","13.00","14.00","45","29024.48","644.99","45"
"588531f8ec37e7d5ff5b7b22ea0488f8","pcs","2750.00","16.00","31.00","39.00","20","28291.99","1414.60","19"
"422879e10f46682990de24d770e7f83d","ferramentas_jardim","1550.00","30.00","22.00","30.00","484","26577.22","54.91","352"
"16c4e87b98a9370a9cbc3a4658a3f45b","instrumentos_musicais","18000.00","105.00","30.00","40.00","13","25034.00","1925.69","13"
"5a848e4ab52fd5445cdc07aab1c40e48",NULL,"400.00","20.00","12.00","15.00","197","24229.03","122.99","194"
"a62e25e09e05e6faf31d90c6ec1aa3d1","relogios_presentes","1000.00","53.00","8.00","18.00","226","24051.00","106.42","172"
*/

-- ============================================================================
-- QUESTION 3: Order Fulfillment Analysis
-- ============================================================================
-- Business Question: How are orders being processed and delivered?
-- Write a query combining orders, customers, and order_payments:
-- - Order ID and customer location (city, state)
-- - Order timestamps (purchase, approved, delivered to carrier, delivered to customer)
-- - Payment type and total payment value
-- - Days from purchase to delivery (if delivered)
-- - Order status
-- Use LEFT JOIN to include all orders even if some timestamp data is missing
-- Filter for orders from 2018 only
-- Sort by delivery time (longest first, NULLs last)

-- Your SQL query here:

SELECT 
    o.order_id,
    c.customer_city,
    c.customer_state,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    op.payment_type,
    ROUND(SUM(op.payment_value), 2) as total_payment_value,
    EXTRACT(DAY FROM (o.order_delivered_customer_date - o.order_purchase_timestamp)) as days_to_delivery,
    o.order_status
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN order_payments op ON o.order_id = op.order_id
WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) = 2018
GROUP BY o.order_id, c.customer_city, c.customer_state, o.order_purchase_timestamp, o.order_approved_at, o.order_delivered_carrier_date, o.order_delivered_customer_date, op.payment_type, o.order_status
ORDER BY days_to_delivery DESC NULLS LAST;

/* Output:
"order_id","customer_city","customer_state","order_purchase_timestamp","order_approved_at","order_delivered_carrier_date","order_delivered_customer_date","payment_type","total_payment_value","days_to_delivery","order_status"
"1b3190b2dfa9d789e1f14c05b647a14a","rio de janeiro","RJ","2018-02-23 14:57:35","2018-02-23 15:16:14","2018-02-26 18:49:07","2018-09-19 23:24:07","credit_card","162.25","208","delivered"
"47b40429ed8cce3aee9199792275433f","salto","SP","2018-01-03 09:44:01","2018-01-03 10:31:15","2018-02-06 01:48:28","2018-07-13 20:51:31","credit_card","453.33","191","delivered"
"4fbc8d6f2f4db3e789d5a876fa349b56","capinzal do norte","MA","2018-02-02 21:38:36","2018-02-03 20:10:18","2018-02-08 01:04:18","2018-07-20 23:37:50","credit_card","307.24","168","delivered"
...
"24c30ddeb5a4b85a61bbb58b9e3d66c9","itu","SP","2018-08-07 16:57:23","2018-08-09 03:35:18",NULL,NULL,"boleto","50.45",NULL,"canceled"
"14a05c02d483800864e5c19a3a7f0ee2","sao paulo","SP","2018-08-18 06:29:22","2018-08-20 16:35:15","2018-08-21 14:43:00",NULL,"debit_card","124.22",NULL,"shipped"
*/


-- ============================================================================
-- QUESTION 4: Seller Performance Analysis
-- ============================================================================
-- Business Question: How are sellers performing across different metrics?
-- Write a query joining sellers and order_items:
-- - Seller ID and location (city, state)
-- - Total number of items sold (sum of quantity from order_items)
-- - Total revenue generated (sum of price from order_items)
-- - Average item price
-- - Number of unique products sold
-- - Number of unique orders handled
-- Include only sellers who have made at least 10 sales
-- Sort by total revenue (highest first)
-- Show top 15 sellers

-- Your SQL query here:

SELECT 
    s.seller_id,
    s.seller_city,
    s.seller_state,
    COUNT(oi.order_item_id) as total_items_sold,
    ROUND(SUM(oi.price), 2) as total_revenue,
    ROUND(AVG(oi.price), 2) as avg_item_price,
    COUNT(DISTINCT oi.product_id) as unique_products,
    COUNT(DISTINCT oi.order_id) as unique_orders
FROM sellers s
INNER JOIN order_items oi ON s.seller_id = oi.seller_id
GROUP BY s.seller_id, s.seller_city, s.seller_state
HAVING COUNT(oi.order_item_id) >= 10
ORDER BY total_revenue DESC
LIMIT 15;

/* Output:
"seller_id","seller_city","seller_state","total_items_sold","total_revenue","avg_item_price","unique_products","unique_orders"
"4869f7a5dfa277a7dca6462dcf3b52b2","guariba","SP","1156","229472.63","198.51","95","1132"
"53243585a1d6dc2643021fd1853d8905","lauro de freitas","BA","410","222776.05","543.36","23","358"
"4a3ca9315b744ce9f8e9374361493884","ibitinga","SP","1987","200472.92","100.89","399","1806"
"fa1c13f2614d7b5c4749cbc52fecda94","sumare","SP","586","194042.03","331.13","289","585"
"7c67e1448b00f6e969d365cea6b010ab","itaquaquecetuba","SP","1364","187923.89","137.77","198","982"
"7e93a43ef30c4f03f38b393420bc753a","barueri","SP","340","176431.87","518.92","186","336"
"da8622b14eb17ae2831f4ac5b9dab84a","piracicaba","SP","1551","160236.57","103.31","222","1314"
"7a67c85e85bb2ce8582c35f2203ad736","sao paulo","SP","1171","141745.53","121.05","149","1160"
"1025f0e2d44d7041d6cf58b6550e0bfa","sao paulo","SP","1428","138968.55","97.32","154","915"
"955fee9216a65b617aa5c0531780ce60","sao paulo","SP","1499","135171.70","90.17","104","1287"
"46dc3b2cc0980fb8ec44634e21d2718e","rio de janeiro","RJ","542","128111.19","236.37","189","521"
"6560211a19b47992c3666cc44a7e94c0","sao paulo","SP","2033","123304.83","60.65","256","1854"
"620c87c171fb2a6dd6e8bb4dec959fc6","petropolis","RJ","798","114774.50","143.83","129","740"
"7d13fca15225358621be4086e1eb0964","ribeirao preto","SP","578","113628.97","196.59","57","565"
"5dceca129747e92ff8ef7a997dc4f8ca","santa barbara d´oeste","SP","346","112155.53","324.15","48","325"
*/



-- ============================================================================
-- QUESTION 5: Customer Review Analysis
-- ============================================================================
-- Business Question: What are customers saying about their orders?
-- Write a query joining order_reviews, orders, and customers:
-- - Customer location (city, state)
-- - Order purchase date
-- - Review score and creation date
-- - Review title and message length (use LENGTH function)
-- - Days between order and review
-- Use INNER JOIN to show only reviews with complete information
-- Filter for reviews with scores of 1 or 2 (poor reviews)
-- Sort by review creation date (most recent first)
-- Limit to 20 results

-- Your SQL query here:

SELECT 
    c.customer_city,
    c.customer_state,
    o.order_purchase_timestamp as order_date,
    r.review_score,
    r.review_creation_date as review_date,
    r.review_comment_title,
    LENGTH(COALESCE(r.review_comment_message, '')) as message_length,
    EXTRACT(DAY FROM (r.review_creation_date - o.order_purchase_timestamp)) as days_to_review
FROM order_reviews r
INNER JOIN orders o ON r.order_id = o.order_id
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE r.review_score IN (1, 2)
ORDER BY r.review_creation_date DESC
LIMIT 20;

/* Output:
"customer_city","customer_state","order_date","review_score","review_date","review_comment_title","message_length","days_to_review"
"sao jose do rio preto","SP","2018-08-24 02:13:16",1,"2018-08-31 00:00:00","Não recomendo.",193,"6"
"botucatu","SP","2018-08-24 14:26:53",1,"2018-08-31 00:00:00",NULL,64,"6"
"franco da rocha","SP","2018-08-22 07:25:32",2,"2018-08-31 00:00:00",NULL,125,"8"
"dourados","MS","2018-08-14 18:03:56",1,"2018-08-31 00:00:00","ruim",94,"16"
"sao paulo","SP","2018-08-26 12:38:57",1,"2018-08-31 00:00:00","Produto faltando ",118,"4"
"sao paulo","SP","2018-08-28 22:30:32",2,"2018-08-31 00:00:00",NULL,39,"2"
"timburi","SP","2018-08-23 18:27:44",2,"2018-08-31 00:00:00","Bom",94,"7"
"belo horizonte","MG","2018-08-15 14:29:08",1,"2018-08-31 00:00:00",NULL,0,"15"
"osasco","SP","2018-08-25 11:42:43",2,"2018-08-31 00:00:00","Produto riscado",0,"5"
"sao paulo","SP","2018-08-24 14:30:31",1,"2018-08-31 00:00:00",NULL,108,"6"
"sao paulo","SP","2018-08-24 13:59:41",1,"2018-08-31 00:00:00",NULL,0,"6"
"sao paulo","SP","2018-08-18 06:29:22",2,"2018-08-31 00:00:00","Entrega de encomenda",109,"12"
"jau","SP","2018-08-06 15:26:36",1,"2018-08-31 00:00:00","Informação\preocupada",167,"24"
"sao paulo","SP","2018-08-24 18:00:29",1,"2018-08-31 00:00:00",NULL,0,"6"
"campo bom","RS","2018-08-21 12:26:53",1,"2018-08-31 00:00:00","Não recebi meu produto",79,"9"
"rio de janeiro","RJ","2018-08-22 14:18:02",1,"2018-08-31 00:00:00","Vcs precisam melhorar",199,"8"
"sao paulo","SP","2018-08-29 12:25:59",1,"2018-08-31 00:00:00","Muito frágil !!!",125,"1"
"brasilia","DF","2018-08-19 21:37:17",1,"2018-08-31 00:00:00",NULL,0,"11"
"santo andre","SP","2018-08-26 11:44:34",1,"2018-08-31 00:00:00","O arejador veio errado",151,"4"
"sao paulo","SP","2018-08-24 17:02:19",1,"2018-08-31 00:00:00",NULL,10,"6"
*/

-- ============================================================================
-- QUESTION 6: Geographic Sales Analysis
-- ============================================================================
-- Business Question: How do sales vary by customer location?
-- Write a query combining customers, orders, and order_payments:
-- - Customer state
-- - Number of customers in each state
-- - Total number of orders from each state
-- - Total revenue from each state
-- - Average order value by state
-- - Average number of orders per customer by state
-- Use LEFT JOIN to include all customers even those without orders
-- Group by state and include only states with at least 100 customers
-- Sort by total revenue (highest first)

-- Your SQL query here:

SELECT 
    c.customer_state,
    COUNT(DISTINCT c.customer_id) as customer_count,
    COUNT(o.order_id) as total_orders,
    ROUND(SUM(op.payment_value), 2) as total_revenue,
    ROUND(AVG(op.payment_value), 2) as avg_order_value,
    ROUND(COUNT(o.order_id)::DECIMAL / COUNT(DISTINCT c.customer_id), 2) as avg_orders_per_customer
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_state
HAVING COUNT(DISTINCT c.customer_id) >= 100
ORDER BY total_revenue DESC NULLS LAST;

/* Output:
"customer_state","customer_count","total_orders","total_revenue","avg_order_value","avg_orders_per_customer"
"SP","41746","43623","5998226.96","137.50","1.04"
"RJ","12852","13527","2144379.69","158.53","1.05"
"MG","11635","12102","1872257.26","154.71","1.04"
"RS","5466","5668","890898.54","157.18","1.04"
"PR","5045","5262","811156.38","154.15","1.04"
"SC","3637","3754","623086.43","165.98","1.03"
"BA","3380","3610","616645.82","170.82","1.07"
"DF","2140","2204","355141.08","161.13","1.03"
"GO","2020","2112","350092.31","165.76","1.05"
"ES","2033","2107","325967.55","154.71","1.04"
"PE","1652","1728","324850.44","187.99","1.05"
"CE","1336","1398","279464.03","199.90","1.05"
"PA","975","1011","218295.85","215.92","1.04"
"MT","907","958","187029.29","195.23","1.06"
"MA","747","767","152523.02","198.86","1.03"
"PB","536","570","141545.72","248.33","1.06"
"MS","715","736","137534.84","186.87","1.03"
"PI","495","524","108523.97","207.11","1.06"
"RN","485","522","102718.13","196.78","1.08"
"AL","413","427","96962.06","227.08","1.03"
"SE","350","361","75246.25","208.44","1.03"
"TO","280","301","61485.33","204.27","1.08"
"RO","253","261","60866.20","233.20","1.03"
"AM","148","154","27966.93","181.60","1.04"
*/


-- ============================================================================
-- QUESTION 7: Product Category Performance
-- ============================================================================
-- Business Question: Which product categories generate the most revenue?
-- Write a query using products and order_items:
-- - Product category name
-- - Number of unique products in category
-- - Total quantity sold across all products in category
-- - Total revenue for the category
-- - Average price per item in category
-- - Number of orders containing products from this category
-- Filter for categories that are not NULL
-- Sort by total revenue (highest first)
-- Show top 12 categories

-- Your SQL query here:

SELECT 
    p.product_category_name,
    COUNT(DISTINCT p.product_id) as unique_products,
    COUNT(oi.order_item_id) as total_quantity_sold,
    ROUND(SUM(oi.price), 2) as total_revenue,
    ROUND(AVG(oi.price), 2) as avg_price_per_item,
    COUNT(DISTINCT oi.order_id) as orders_containing_category
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
WHERE p.product_category_name IS NOT NULL
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 12;

/* Output:
"product_category_name","unique_products","total_quantity_sold","total_revenue","avg_price_per_item","orders_containing_category"
"beleza_saude","2444","9670","1258681.34","130.16","8836"
"relogios_presentes","1329","5991","1205005.68","201.14","5624"
"cama_mesa_banho","3029","11115","1036988.68","93.30","9417"
"esporte_lazer","2867","8641","988048.97","114.34","7720"
"informatica_acessorios","1639","7827","911954.32","116.51","6689"
"moveis_decoracao","2657","8334","729762.49","87.56","6449"
"cool_stuff","789","3796","635290.85","167.36","3632"
"utilidades_domesticas","2335","6964","632248.66","90.79","5884"
"automotivo","1900","4235","592720.11","139.96","3897"
"ferramentas_jardim","753","4347","485256.46","111.63","3518"
"brinquedos","1411","4117","483946.60","117.55","3886"
"bebes","919","3065","411764.89","134.34","2885"
*/


-- ============================================================================
-- QUESTION 8: Customer Lifetime Value Analysis
-- ============================================================================
-- Business Question: What is the complete customer purchasing behavior?
-- Write a query joining customers, orders, and order_payments:
-- - Customer ID and location (city, state)
-- - Total amount spent across all orders
-- - Number of orders placed
-- - Average order value
-- - First order date and last order date
-- - Customer lifespan in days (last order - first order)
-- Use INNER JOIN to show only customers who have made purchases
-- Sort by total spent (highest first)
-- Limit to 25 results

-- Your SQL query here:

SELECT 
    c.customer_id,
    c.customer_city,
    c.customer_state,
    ROUND(SUM(op.payment_value), 2) as total_spent,
    COUNT(DISTINCT o.order_id) as total_orders,
    ROUND(AVG(op.payment_value), 2) as avg_order_value,
    MIN(o.order_purchase_timestamp) as first_order_date,
    MAX(o.order_purchase_timestamp) as last_order_date,
    EXTRACT(DAY FROM (MAX(o.order_purchase_timestamp) - MIN(o.order_purchase_timestamp))) as customer_lifespan_days
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_id, c.customer_city, c.customer_state
ORDER BY total_spent DESC
LIMIT 25;

/* Output:
"customer_id","customer_city","customer_state","total_spent","total_orders","avg_order_value","first_order_date","last_order_date","customer_lifespan_days"
"1617b1357756262bfa56ab541c47bc16","rio de janeiro","RJ","13664.08","1","13664.08","2017-09-29 15:24:52","2017-09-29 15:24:52","0"
"ec5b2ba62e574342386871631fafd3fc","vila velha","ES","7274.88","1","7274.88","2018-07-15 14:49:44","2018-07-15 14:49:44","0"
"c6e2731c5b391845f6800c97401a43a9","campo grande","MS","6929.31","1","6929.31","2017-02-12 20:37:36","2017-02-12 20:37:36","0"
"f48d464a0baaea338cb25f816991ab1f","vitoria","ES","6922.21","1","6922.21","2018-07-25 18:10:17","2018-07-25 18:10:17","0"
"3fd6777bbce08a352fddd04e4a7cc8f6","marilia","SP","6726.66","1","6726.66","2017-05-24 18:14:34","2017-05-24 18:14:34","0"
"05455dfa7cd02f13d132aa7a6a9729c6","divinopolis","MG","6081.54","1","6081.54","2017-11-24 11:03:35","2017-11-24 11:03:35","0"
"df55c14d1476a9a3467f131269c2477f","araruama","RJ","4950.34","1","4950.34","2017-04-01 15:58:40","2017-04-01 15:58:40","0"
"e0a2412720e9ea4f26c1ac985f6a7358","goiania","GO","4809.44","1","4809.44","2018-07-12 12:08:36","2018-07-12 12:08:36","0"
"24bbf5fd2f2e1b359ee7de94defc4a15","maua","SP","4764.34","1","4764.34","2017-04-18 18:50:13","2017-04-18 18:50:13","0"
"3d979689f636322c62418b6346b1c6d2","joao pessoa","PB","4681.78","1","4681.78","2018-06-22 12:23:19","2018-06-22 12:23:19","0"
"1afc82cd60e303ef09b4ef9837c9505c","sao paulo","SP","4513.32","1","4513.32","2018-08-03 21:10:16","2018-08-03 21:10:16","0"
"cc803a2c412833101651d3f90ca7de24","niteroi","RJ","4445.50","1","4445.50","2018-05-31 22:57:07","2018-05-31 22:57:07","0"
"926b6a6fb8b6081e00b335edaf578d35","brasilia","DF","4194.76","1","2097.38","2017-04-18 20:37:26","2017-04-18 20:37:26","0"
"35a413c7ca3c69756cb75867d6311c0d","bom jesus do galho","MG","4175.26","1","4175.26","2018-03-29 10:31:29","2018-03-29 10:31:29","0"
"e9b0d0eb3015ef1c9ce6cf5b9dcbee9f","nova lima","MG","4163.51","1","4163.51","2018-07-29 08:39:48","2018-07-29 08:39:48","0"
"3be2c536886b2ea4668eced3a80dd0bb","belem","PA","4042.74","1","4042.74","2017-02-04 18:54:15","2017-02-04 18:54:15","0"
"eb7a157e8da9c488cd4ddc48711f1097","jundiai","SP","4034.44","1","2017.22","2018-06-05 12:45:17","2018-06-05 12:45:17","0"
"c6695e3b1e48680db36b487419fb0398","sao paulo","SP","4016.91","1","4016.91","2017-03-18 20:08:04","2017-03-18 20:08:04","0"
"31e83c01fce824d0ff786fcd48dad009","rio de janeiro","RJ","3979.55","1","3979.55","2018-05-14 15:15:30","2018-05-14 15:15:30","0"
"addc91fdf9c2b3045497b57fc710e820","para de minas","MG","3826.80","1","3826.80","2018-01-26 14:30:21","2018-01-26 14:30:21","0"
"19b32919fa1198aefc0773ee2e46e693","recife","PE","3792.59","1","3792.59","2018-03-21 15:06:34","2018-03-21 15:06:34","0"
"58acc4e2788bf6fc445fddcce9c1db03","mafra","SC","3782.19","1","3782.19","2017-03-01 10:02:02","2017-03-01 10:02:02","0"
"66657bf1753d82d0a76f2c4719ab8b85","brasilia","DF","3736.22","1","3736.22","2017-02-10 10:19:22","2017-02-10 10:19:22","0"
"7d03bf20fa96e80468bbf678eebbcb3f","gaspar","SC","3666.42","1","3666.42","2017-05-10 15:05:47","2017-05-10 15:05:47","0"
"39d6658037b1b5a07d0a24d423f0bd19","brasilia","DF","3602.47","1","3602.47","2017-02-21 18:35:38","2017-02-21 18:35:38","0"
*/

-- ============================================================================
-- QUESTION 9: Product and Seller Relationship
-- ============================================================================
-- Business Question: How do products and sellers work together?
-- Write a query using products, order_items, and sellers:
-- - Product category and seller location (city, state)
-- - Number of transactions between this category-seller combination
-- - Total revenue for this combination
-- - Average price per item
-- - Number of unique products sold by this seller in this category
-- Use INNER JOIN to show only actual transactions
-- Group by product category and seller state
-- Filter for combinations with at least 5 transactions
-- Sort by total revenue (highest first)

-- Your SQL query here:

SELECT 
    p.product_category_name,
    s.seller_city,
    s.seller_state,
    COUNT(oi.order_item_id) as transaction_count,
    ROUND(SUM(oi.price), 2) as total_revenue,
    ROUND(AVG(oi.price), 2) as avg_price_per_item,
    COUNT(DISTINCT p.product_id) as unique_products_sold
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
INNER JOIN sellers s ON oi.seller_id = s.seller_id
GROUP BY p.product_category_name, s.seller_city, s.seller_state
HAVING COUNT(oi.order_item_id) >= 5
ORDER BY total_revenue DESC;

/* Output:
"product_category_name","seller_city","seller_state","transaction_count","total_revenue","avg_price_per_item","unique_products_sold"
"cama_mesa_banho","ibitinga","SP","6039","503829.64","83.43","1659"
"cool_stuff","sao paulo","SP","1970","286211.73","145.29","287"
...
"livros_interesse_geral","mogi mirim","SP","5","54.50","10.90","2"
"perfumaria","colombo","PR","5","50.70","10.14","4"
NULL,"araucaria","PR","7","33.46","4.78","1"
*/


-- ============================================================================
-- QUESTION 10: Payment Analysis by Location
-- ============================================================================
-- Business Question: How do payment preferences vary by region?
-- Write a query combining customers, orders, and order_payments:
-- - Customer state
-- - Payment type
-- - Number of payments of this type in this state
-- - Total payment value
-- - Average payment value
-- - Average number of installments
-- - Percentage of state's total payments
-- Use window functions for percentage calculations
-- Group by state and payment type
-- Sort by state, then by payment count (highest first)

-- Your SQL query here:

SELECT 
    c.customer_state,
    op.payment_type,
    COUNT(op.order_id) as payment_count,
    ROUND(SUM(op.payment_value), 2) as total_payment_value,
    ROUND(AVG(op.payment_value), 2) as avg_payment_value,
    ROUND(AVG(op.payment_installments), 2) as avg_installments,
    ROUND(100.0 * COUNT(op.order_id) / SUM(COUNT(op.order_id)) OVER (PARTITION BY c.customer_state), 2) as pct_of_state_payments
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_state, op.payment_type
ORDER BY c.customer_state, payment_count DESC;

/* Output:
"customer_state","payment_type","payment_count","total_payment_value","avg_payment_value","avg_installments","pct_of_state_payments"
"AC","credit_card","61","14625.41","239.76","4.5","72.62"
"AC","boleto","16","3908.46","244.28","1.0","19.05"
"AC","voucher","5","797.13","159.43","1.0","5.95"
...
"TO","boleto","76","13287.28","174.83","1.0","25.25"
"TO","voucher","24","1442.07","60.09","1.0","7.97"
"TO","debit_card","4","896.65","224.16","1.0","1.33"
*/

-- ============================================================================
-- QUESTION 11: Comprehensive Order Details
-- ============================================================================
-- Business Question: What are the complete details of each order item?
-- Write a query joining order_items, products, orders, customers, and sellers:
-- - Order item details (order_id, product_id, quantity, price, freight_value)
-- - Product category and weight
-- - Order purchase date and status
-- - Customer location (city, state)
-- - Seller location (city, state)
-- Use appropriate JOIN types to preserve all order_items
-- Filter for orders from Q4 2017 (Oct-Dec 2017)
-- Sort by order purchase date, then by order_id
-- Limit to 50 results

-- Your SQL query here:




-- ============================================================================
-- QUESTION 12: Data Quality Assessment
-- ============================================================================
-- Business Question: What data relationships might be missing?
-- Write queries to identify potential data quality issues:
-- a) Orders without any payment information
-- b) Orders without any order items
-- c) Order items without corresponding orders
-- d) Reviews without corresponding orders
-- e) Products that have never been ordered
-- Use LEFT JOIN and IS NULL to find missing relationships
-- Count the number of missing records in each category

-- Your SQL queries here:

-- a) Orders without payment information:


-- b) Orders without order items:


-- c) Order items without corresponding orders:


-- d) Reviews without corresponding orders:


-- e) Products never ordered:




-- ============================================================================
