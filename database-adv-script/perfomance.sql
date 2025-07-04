-- Objective: Retrieve all bookings with user, property, and payment details
-- Initial query for performance analysis

USE alx_airbnb;

SELECT * FROM users;
SELECT * FROM property;
SELECT * FROM booking;
SELECT * FROM payment;

SELECT b.booking_id, b.property_id, b.start_date, b.end_date, b.status, b.total_price,
       u.user_id, u.first_name, u.last_name, u.email,
       p.name, p.address, p.description, p.pricepernight, pay.payment_id, pay.amount, pay.payment_date, pay.payment_method
    FROM booking b
    INNER JOIN users u ON (b.user_id = u.user_id)
    INNER JOIN property p ON (b.property_id = p.property_id)
    LEFT JOIN payment pay ON(b.booking_id = pay.booking_id)
    WHERE b.status = 'confirmed'
    AND pay.payment_method IN ('credit_card', 'paypal');


-- To analyze performance, run:
-- EXPLAIN SELECT ... (the above query)

EXPLAIN ANALYZE SELECT b.booking_id, b.property_id, b.start_date, b.end_date, b.status, b.total_price,
       u.user_id, u.first_name, u.last_name, u.email,
       p.name, p.address, p.description, p.pricepernight, pay.payment_id, pay.amount, pay.payment_date, pay.payment_method
    FROM booking b
    INNER JOIN users u ON (b.user_id = u.user_id)
    INNER JOIN property p ON (b.property_id = p.property_id)
    LEFT JOIN payment pay ON(b.booking_id = pay.booking_id)
    WHERE b.status = 'confirmed'
    AND pay.payment_method IN ('credit_card', 'paypal');

CREATE INDEX idx_payment_date
ON payment(payment_date);

CREATE INDEX idx_booking_status
ON booking(status);

CREATE INDEX idx_booking_property_id
ON booking(property_id);

CREATE INDEX idx_booking_status
ON property(status);

ALTER TABLE booking
DROP INDEX idx_booking_status;

-- After analysis, refactor as needed for optimization.
