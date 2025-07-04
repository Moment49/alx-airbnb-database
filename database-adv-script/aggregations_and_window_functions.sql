USE alx_airbnb;

-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) as TotalBookings
FROM booking b
INNER JOIN users u
ON (b.user_id = u.user_id)
GROUP BY user_id;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT * from property;
SELECT * from booking;

SELECT property_id, name FROM property;

SELECT property_id, COUNT(booking_id) as totalBooking,
  RANK() OVER (ORDER BY COUNT(booking_id) DESC), 
  ROW_NUMBER() OVER (ORDER BY COUNT(booking_id) DESC) 
from booking
GROUP BY property_id;
