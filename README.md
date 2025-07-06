# SQL Skills Portfolio: E-Commerce Analytics

## Project Objective

This project demonstrates advanced SQL expertise through comprehensive analysis of e-commerce data. It showcases 25 progressively complex queries that solve real business problems while highlighting specific SQL techniques.

### Core SQL Competencies Showcased:
- **Complex JOINs** - Multi-table relationships with 5+ table joins
- **Subqueries** - Correlated and non-correlated, including EXISTS/NOT EXISTS patterns
- **Window Functions** - ROW_NUMBER, RANK, LAG/LEAD, NTILE, running totals
- **CTEs** - Common Table Expressions for readable complex logic
- **Recursive Queries** - Hierarchical data processing

### Query Complexity Levels:
- **Foundation (15 queries)** - Multi-table operations, basic analytics
- **Intermediate (10 queries)** - Window functions, CTEs, complex business logic


## Dataset: Brazilian E-Commerce Public Dataset

Source: Kaggle - Brazilian E-Commerce Public Dataset by Olist 

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

### Why This Dataset?

- Real business data - Actual e-commerce transactions from Brazil
- Rich relationships - 9 tables with realistic business connections
- Clean structure - Well-normalized, production-quality data
- Appropriate size - 100K orders, manageable for learning
- No sensitive data - Anonymized, safe for portfolio use

### Dataset Overview

- Orders: 99,441 orders from 2016-2018
- Customers: 99,441 unique customers
- Products: 32,951 products across 74 categories
- Reviews: 99,224 customer reviews with ratings
- Sellers: 3,095 sellers across Brazil
- Geography: Order locations across Brazilian states

## Query Categories
### Foundational Queries (15 total)
#### Data Exploration & Basic Analysis

- 01_basic_exploration.sql - Dataset overview and record counts
- 02_customer_analysis.sql - Customer demographics and behavior
- 03_product_performance.sql - Best-selling products and categories
- 04_geographic_analysis.sql - Sales by Brazilian states and cities
- 05_temporal_trends.sql - Monthly and seasonal sales patterns

#### Business Metrics & KPIs

- 06_order_analysis.sql - Order sizes, values, and fulfillment
- 07_seller_performance.sql - Top sellers and performance metrics
- 08_payment_analysis.sql - Payment methods and installment patterns
- 09_shipping_analysis.sql - Delivery times and logistics performance
- 10_review_analysis.sql - Customer satisfaction and review patterns

#### Advanced Filtering & Calculations

- 11_customer_value.sql - Customer lifetime value and spending tiers
- 12_product_categories.sql - Category performance and trends
- 13_price_analysis.sql - Pricing strategies and price ranges
- 14_seasonal_analysis.sql - Holiday and seasonal shopping patterns
- 15_data_quality.sql - Missing data analysis and cleanup

### Intermediate Queries (10 total)
#### Analytics & Segmentation

- 01_customer_segmentation.sql - RFM analysis and customer tiers
- 02_cohort_analysis.sql - Customer retention by acquisition month
- 03_product_recommendations.sql - Frequently bought together analysis
- 04_customer_journey.sql - Purchase patterns and lifecycle analysis

#### Advanced Calculations

- 05_moving_averages.sql - Sales trends with window functions
- 06_ranking_analysis.sql - Top performers with ranking functions
- 07_growth_analysis.sql - Year-over-year and month-over-month growth
- 08_geographic_insights.sql - Regional performance with CTEs

#### Business Intelligence

- 09_seller_analytics.sql - Seller performance scorecard
- 10_executive_summary.sql - Key metrics dashboard query
