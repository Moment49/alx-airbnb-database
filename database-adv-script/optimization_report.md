# Optimization Report: Refactoring Complex Queries for Performance

## Objective
Refactor complex queries to improve performance.

## Initial Query
The following query retrieves all bookings along with user details, property details, and payment details:


## Performance Analysis
To analyze the query's performance, use the `EXPLAIN` statement:

```sql
EXPLAIN SELECT ... (as above)
```

### Potential Inefficiencies
- Full table scans if indexes are missing on join columns (`user_id`, `property_id`, `booking_id`).
- Unnecessary columns or joins may increase execution time.
- LEFT JOIN on `payment` may be slow if not indexed.

## Refactored Query & Recommendations
- Ensure indexes exist on all foreign key columns used in joins.
- Only select necessary columns.
- Use INNER JOIN for `payment` if every booking always has a payment (otherwise, keep LEFT JOIN).

### Example Indexes
```sql
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_payment_booking_id ON payment(booking_id);
```

### Refactored Query
```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.address,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON b.booking_id = pay.booking_id;
```

## Summary
- Added indexes to improve join performance.
- Kept only necessary columns in SELECT.
- Use EXPLAIN to verify improved query plan and reduced execution time.

---

