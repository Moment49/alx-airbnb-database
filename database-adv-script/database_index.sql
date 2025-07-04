USE alx_airbnb;

-- Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).

SELECT * FROM users;
SELECT * FROM booking;
SELECT * FROM property;

-- Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

-- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.
EXPLAIN ANALYZE SELECT * FROM users
WHERE first_name = 'Bob';

CREATE INDEX idx_last_name
ON users (last_name);

-- DROP INDEX
ALTER TABLE users
DROP INDEX p_first_name;

CREATE INDEX idx_first_name
ON users (first_name);

CREATE INDEX idx_phone_number
ON users (phone_number);

CREATE INDEX idx_start_date
ON booking (start_date);
CREATE INDEX idx_end_date
ON booking (end_date);

CREATE INDEX idx_name
ON property (name);

CREATE INDEX idx_address
ON property (address);

EXPLAIN ANALYZE SELECT * FROM users
WHERE first_name = 'Bob';