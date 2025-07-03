USE alx_airbnb;

-- This script is to create an Inner Joine query for Booking and Users

SELECT * FROM booking;

SELECT * FROM users;

SELECT * FROM property;

SELECT * FROM review;


-- INNER JOIN query to get booking details along with user information
SELECT b.booking_id, b.property_id, b.start_date, b.end_date, b.total_price, b.status, u.first_name, u.last_name
FROM booking b
INNER JOIN users u
ON (b.user_id = u.user_id);

-- LEFT JOIN query to get all properties and reviews, including properties without reviews
SELECT p.property_id, p.host_id, p.name, p.description, p.address, p.pricepernight, r.review_id, r.rating, r.comment, r.user_id
FROM property p
LEFT JOIN review r
ON (p.property_id = r.property_id);

-- FULL OUTER JOIN to get retrieve all users and bookings even if user does not have booking and vise versa
SELECT u.user_id, u.first_name, u.last_name, u.role, b.booking_id, b.property_id, b.total_price, b.status
FROM users u
LEFT JOIN booking b
ON (u.user_id = b.user_id)
UNION
SELECT u.user_id, u.first_name, u.last_name, u.role, b.booking_id, b.property_id, b.total_price, b.status
FROM users u
RIGHT JOIN booking b
ON (u.user_id = b.user_id);