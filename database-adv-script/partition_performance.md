# Partitioning Performance Report

## Objective

Implement table partitioning to optimize queries on large datasets, specifically for the `Booking` table using the `start_date` column.

## Implementation

- The `Booking` table was partitioned by the `start_date` column using range partitioning.
- The partitioning SQL script is saved in `partitioning.sql`.

## Performance Testing

- Ran queries to fetch bookings by date range before and after partitioning.
- Example query:
  ```sql
  SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-01-31';