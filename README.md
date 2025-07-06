# SQL Skills Portfolio: E-Commerce Analytics

## Project Objective

This project demonstrates advanced SQL expertise through comprehensive analysis of e-commerce data. It showcases 43 progressively complex queries that solve real business problems while highlighting specific SQL techniques.

**Why E-Commerce Domain?**
- Universal business context
- Rich data relationships enabling complex query patterns
- Real-world analytics scenarios (customer segmentation, revenue analysis, cohort studies)

### Core SQL Competencies Showcased:
- **Complex JOINs** - Multi-table relationships with 5+ table joins
- **Subqueries** - Correlated and non-correlated, including EXISTS/NOT EXISTS patterns
- **Window Functions** - ROW_NUMBER, RANK, LAG/LEAD, NTILE, running totals
- **CTEs** - Common Table Expressions for readable complex logic
- **Recursive Queries** - Hierarchical data processing
- **Advanced Analytics** - Statistical functions, percentiles, cohort analysis
- **Performance Optimization** - Index strategies, query tuning, execution plans
- **Business Intelligence** - Customer segmentation, RFM analysis, retention metrics

### Query Complexity Levels:
- **Foundation (15 queries)** - Multi-table operations, basic analytics
- **Intermediate (10 queries)** - Window functions, CTEs, complex business logic  
- **Advanced (10 queries)** - Recursive patterns, statistical analysis, optimization
- **Business Intelligence (8 queries)** - Complete analytical frameworks

## Database Design

### Schema Overview (6 Tables - Intentionally Lean)

**Why Only 6 Tables?**
The schema is designed for maximum learning impact with minimal complexity:
- **Focus on Relationships**: Every table connects meaningfully to others
- **Real-World Patterns**: Mirrors actual e-commerce database structures
- **Query Opportunities**: Each relationship enables different SQL techniques
- **Manageable Scope**: Complex enough for advanced queries, simple enough to understand quickly

```
customers ──┐
            ├── orders ──── order_items ──── products ──── categories
            └── reviews ─────────────────────┘
```

### Table Relationships & Rationale:

**customers → orders (1:many)**
- Enables customer analytics, cohort analysis, lifetime value calculations
- Supports window functions for customer ranking and segmentation

**orders → order_items (1:many)**  
- Classic order header/detail pattern for realistic business queries
- Enables aggregation challenges and complex JOIN scenarios

**products ← order_items → orders**
- Many-to-many through junction table for product performance analysis
- Supports complex analytics on buying patterns and product rankings

**categories → products (1:many)**
- Hierarchical relationship enabling recursive query demonstrations
- Category-level analytics and roll-up reporting

**customers → reviews ← products (many:many)**
- Direct customer-product feedback relationship
- Enables sentiment analysis and product recommendation queries
