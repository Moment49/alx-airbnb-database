## SQL Joins Practice: Bookings, Users, Properties, and Reviews

### Objective
Master SQL joins by writing complex queries using different types of joins.

### Instructions & Tables to Retrieve

#### 1. INNER JOIN
**Tables involved:** Bookings, Users
- **Query:** Retrieve all bookings and the respective users who made those bookings.
- **Columns to retrieve:**
  - Booking ID, Booking Date, User ID, User Name, User Email

#### 2. LEFT JOIN
**Tables involved:** Properties, Reviews
- **Query:** Retrieve all properties and their reviews, including properties that have no reviews.
- **Columns to retrieve:**
  - Property ID, Property Name, Review ID, Review Text, Review Rating

#### 3. FULL OUTER JOIN
**Tables involved:** Users, Bookings
- **Query:** Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
- **Columns to retrieve:**
  - User ID, User Name, Booking ID, Booking Date
