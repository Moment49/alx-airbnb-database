USE alx_airbnb;

-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT * FROM property

-- This is a Multi-row subquery that retrieves all properties with an rating greater than 4.0
SELECT property_id, host_id, name, description, address, pricepernight
FROM property
WHERE property_id IN (
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)

-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT user_id, first_name, last_name
FROM users u
WHERE (SELECT COUNT(*) FROM booking b
        where b.user_id = u.user_id) > 3;