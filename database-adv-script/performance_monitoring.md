# 🚀 Database Performance Optimization Report

## 🎯 Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

## 📊 Performance Monitoring

- Used `EXPLAIN ANALYZE` to check the execution time and query plans for frequently used queries, such as:
  - `SELECT * FROM users WHERE first_name = "Bob";`
  - Complex joins involving `booking`, `users`, `property`, and `payment` tables.

## 🔍 Bottleneck Identification

- Detected slow performance on queries filtering by `first_name` in the `users` table and on joins involving the `booking` and `payment` tables.
- Noticed that some queries were not using indexes efficiently, leading to full table scans.

## 🛠️ Schema Adjustments & Indexing

- Added indexes to improve query performance:
  - `CREATE INDEX idx_users_first_name ON users(first_name);`
  - `CREATE INDEX idx_booking_status ON booking(status);`
  - `CREATE INDEX idx_booking_property_id ON booking(property_id);`
  - `CREATE INDEX idx_payment_date ON payment(payment_date);`
- Dropped redundant or unused indexes to avoid overhead.

## 📈 Observed Improvements

- Query execution time for `SELECT * FROM users WHERE first_name = "Bob"` decreased from **0.0200s** to **0.0188s**.
- Rows changed: The number of rows processed by the query was reduced due to better index usage.
- Joins and date-based queries on `booking` and `payment` tables became faster, as confirmed by improved `EXPLAIN ANALYZE` results.
- Overall, the database now handles frequent queries more efficiently, with reduced I/O and faster response times.

## 📝 Conclusion

Regularly analyzing query plans and refining indexes/schema leads to measurable performance gains, especially as data volume grows.