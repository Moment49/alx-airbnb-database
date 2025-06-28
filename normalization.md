## 📦 Normalization of Database Schema – Airbnb Clone Project

## Objective Overview

The goal is to ensure the Airbnb clone database schema adheres to the Third Normal Form (3NF), promoting data integrity and eliminating redundancy.

---

### 1. First Normal Form (1NF)
- **Atomicity:** All table fields contain only indivisible values (no arrays or repeating groups).
- **Example:** Each `email`, `phone_number`, and `role` in the `User` table is a single value.

### 2. Second Normal Form (2NF)
- **Full Functional Dependency:** All non-key attributes are fully dependent on the entire primary key.
- **Application:** 
  - All tables use a single-column primary key (`UUID`), so partial dependencies do not exist.
  - For example, in the `Booking` table, `start_date`, `end_date`, and `total_price` depend entirely on `booking_id`.

### 3. Third Normal Form (3NF)
- **No Transitive Dependency:** Non-key attributes are not dependent on other non-key attributes.
- **Application:**
  - In the `User` table, attributes like `first_name`, `last_name`, `email`, etc., depend only on `user_id`.
  - In the `Property` table, all attributes depend solely on `property_id`.
  - Foreign keys (e.g., `host_id` in `Property`, `user_id` in `Booking`) reference primary keys in other tables, not non-key attributes.

---

### Additional Notes

- **No derived or calculated fields** are stored, ensuring no redundancy.
- **All relationships** are managed via foreign keys, not by duplicating data.
- **Enumerated types** (e.g., `role`, `status`, `payment_method`) are used for consistency and integrity.  
- The use of ENUMs for fields such as `status`, `roles`, and `payment_method` simplifies validation and enforces allowed values.  
- For stricter normalization (beyond 3NF), these ENUM fields could be replaced with separate lookup tables (e.g., `roles`, `statuses`, `payment_methods`) and referenced via foreign keys. This approach is optional.
---

**Conclusion:**  
The Airbnb clone database schema is structured to fully comply with 3NF, ensuring efficient storage, data consistency, and ease of