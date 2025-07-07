-- ============================================================================
-- SQL PORTFOLIO: COMPLETE DATABASE SETUP
-- File: setup/database_setup.sql
-- Purpose: Create database schema and load Brazilian E-Commerce data
-- ============================================================================

-- Step 1: Create database (run this command separately first)
-- CREATE DATABASE ecommerce_portfolio;
-- \c ecommerce_portfolio;

-- Step 2: Drop existing tables for clean setup
DROP TABLE IF EXISTS order_reviews CASCADE;
DROP TABLE IF EXISTS order_payments CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS sellers CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS geolocation CASCADE;

-- ============================================================================
-- CREATE TABLES (matching CSV structure exactly)
-- ============================================================================

-- Customers table
CREATE TABLE customers (
    customer_id VARCHAR(32) PRIMARY KEY,
    customer_unique_id VARCHAR(32) NOT NULL,
    customer_zip_code_prefix VARCHAR(5),
    customer_city VARCHAR(100),
    customer_state VARCHAR(2)
);

-- Sellers table
CREATE TABLE sellers (
    seller_id VARCHAR(32) PRIMARY KEY,
    seller_zip_code_prefix VARCHAR(5),
    seller_city VARCHAR(100),
    seller_state VARCHAR(2)
);

-- Products table (note: original dataset has typo "lenght" instead of "length")
CREATE TABLE products (
    product_id VARCHAR(32) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INTEGER,
    product_description_lenght INTEGER,
    product_photos_qty INTEGER,
    product_weight_g DECIMAL(10,2),
    product_length_cm DECIMAL(10,2),
    product_height_cm DECIMAL(10,2),
    product_width_cm DECIMAL(10,2)
);

-- Geolocation table
CREATE TABLE geolocation (
    geolocation_zip_code_prefix VARCHAR(5),
    geolocation_lat DECIMAL(10,8),
    geolocation_lng DECIMAL(11,8),
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(2)
);

-- Orders table
CREATE TABLE orders (
    order_id VARCHAR(32) PRIMARY KEY,
    customer_id VARCHAR(32) NOT NULL REFERENCES customers(customer_id),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- Order items table
CREATE TABLE order_items (
    order_id VARCHAR(32) NOT NULL REFERENCES orders(order_id),
    order_item_id INTEGER NOT NULL,
    product_id VARCHAR(32) NOT NULL REFERENCES products(product_id),
    seller_id VARCHAR(32) NOT NULL REFERENCES sellers(seller_id),
    shipping_limit_date TIMESTAMP,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    PRIMARY KEY (order_id, order_item_id)
);

-- Order payments table
CREATE TABLE order_payments (
    order_id VARCHAR(32) NOT NULL REFERENCES orders(order_id),
    payment_sequential INTEGER NOT NULL,
    payment_type VARCHAR(20),
    payment_installments INTEGER,
    payment_value DECIMAL(10,2),
    PRIMARY KEY (order_id, payment_sequential)
);

-- Order reviews table
CREATE TABLE order_reviews (
    review_id VARCHAR(32) PRIMARY KEY,
    order_id VARCHAR(32) NOT NULL REFERENCES orders(order_id),
    review_score INTEGER CHECK (review_score >= 1 AND review_score <= 5),
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

-- ============================================================================
-- CREATE INDEXES FOR PERFORMANCE
-- ============================================================================

-- Customer indexes
CREATE INDEX idx_customers_state ON customers(customer_state);
CREATE INDEX idx_customers_city ON customers(customer_city);
CREATE INDEX idx_customers_zip ON customers(customer_zip_code_prefix);

-- Order indexes (most important for analytics)
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_status ON orders(order_status);
CREATE INDEX idx_orders_purchase_date ON orders(order_purchase_timestamp);
CREATE INDEX idx_orders_delivered_date ON orders(order_delivered_customer_date);

-- Order items indexes
CREATE INDEX idx_order_items_product ON order_items(product_id);
CREATE INDEX idx_order_items_seller ON order_items(seller_id);
CREATE INDEX idx_order_items_price ON order_items(price);

-- Product indexes
CREATE INDEX idx_products_category ON products(product_category_name);
CREATE INDEX idx_products_weight ON products(product_weight_g);

-- Payment indexes
CREATE INDEX idx_payments_type ON order_payments(payment_type);
CREATE INDEX idx_payments_value ON order_payments(payment_value);

-- Review indexes
CREATE INDEX idx_reviews_score ON order_reviews(review_score);
CREATE INDEX idx_reviews_date ON order_reviews(review_creation_date);

-- Seller indexes
CREATE INDEX idx_sellers_state ON sellers(seller_state);
CREATE INDEX idx_sellers_city ON sellers(seller_city);

-- Geolocation indexes
CREATE INDEX idx_geolocation_zip ON geolocation(geolocation_zip_code_prefix);
CREATE INDEX idx_geolocation_state ON geolocation(geolocation_state);

-- ============================================================================
-- SUCCESS MESSAGE
-- ============================================================================

SELECT 'Database schema created successfully.' as status;
SELECT 'Tables created: customers, sellers, products, geolocation, orders, order_items, order_payments, order_reviews' as tables_created;
SELECT 'Ready to load CSV data.' as next_step;

-- ============================================================================
