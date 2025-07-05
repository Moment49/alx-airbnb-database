USE alx_airbnb;

-- Create a partitioned table for Booking
-- To achieve partitioning in the start_date column we will have to make the start_date a primary key


DROP TABLE IF EXISTS booking;

SELECT * FROM booking;

SHOW TABLES;

CREATE TABLE booking(
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(7, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)
    PARTITION BY RANGE(YEAR(start_date))(
    PARTITION p2021 VALUES LESS THAN (2021),
    PARTITION p2022 VALUES LESS THAN (2022),
    PARTITION p2023 VALUES LESS THAN (2023),
    PARTITION p2024 VALUES LESS THAN (2024),
    PARTITION p2025 VALUES LESS THAN (2025),
    PARTITION p2026 VALUES LESS THAN MAXVALUE
);

ALTER TABLE booking
ADD PRIMARY KEY(booking_id, start_date)

INSERT into booking (
  booking_id,  user_id, property_id,
  start_date, end_date, total_price, status
) VALUES
(1, 1, 21, '2024-07-01', '2025-07-05', 480.00, 'confirmed'),
(2, 2, 21, '2022-07-01', '2021-07-05', 180.00, 'confirmed');


-- Alternative to add the partition to an existing table, note that the 
-- table has no primary key as partitions to a PRIMARY KEY column not the partitioned column will be flagged
-- As the sql would not know how to partition the table without a primary key for the column
ALTER TABLE booking PARTITION BY RANGE(YEAR(start_date))(
    PARTITION p2021 VALUES LESS THAN (2021),
    PARTITION p2022 VALUES LESS THAN (2022),
    PARTITION p2023 VALUES LESS THAN (2023),
    PARTITION p2024 VALUES LESS THAN (2024),
    PARTITION p2025 VALUES LESS THAN (2025),
    PARTITION p2026 VALUES LESS THAN MAXVALUE
);

-- Test the performance of queries on the partitioned table
EXPLAIN ANALYZE SELECT * FROM Booking
WHERE start_date BETWEEN '2021-01-01' AND '2024-01-31';