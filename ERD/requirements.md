# 🏠 Airbnb Clone Project – Database Schema (EDR) Overview

This document outlines the foundational database structure for an Airbnb clone. The schema aims to deliver a reliable, scalable solution that prioritizes data integrity and minimizes redundancy.


## 🗺️ ER DIAGRAM
![Airbnb Database ERD](https://github.com/Moment49/alx-airbnb-database/blob/main/ERD/ERD%20-%20AirBnB.jpg)



## 📦 Core Entities & Their Attributes

### 1. User
| Field           | Data Type | Constraints                                 |
|-----------------|-----------|-----------------------------------------------------|
| user_id         | UUID      | Primary Key, Indexed                                |
| first_name      | VARCHAR   | Not Null                                            |
| last_name       | VARCHAR   | Not Null                                            |
| email           | VARCHAR   | Unique, Required, Indexed                           |
| password_hash   | VARCHAR   | Required                                            |
| phone_number    | VARCHAR   | Optional                                            |
| role            | ENUM      | Required (`guest`, `host`, `admin`)                 |
| created_at      | TIMESTAMP | Defaults to current timestamp                       |

---

### 2. Property
| Field           | Data Type | Constraints                                 |
|-----------------|-----------|-----------------------------------------------------|
| property_id     | UUID      | Primary Key, Indexed                                |
| host_id         | UUID      | Foreign Key → User(user_id)                         |
| name            | VARCHAR   | Not Null                                             |
| description     | TEXT      | Not Null                                             |
| location        | VARCHAR   | Not Null                                             |
| pricepernight   | DECIMAL   | Not Null                                             |
| created_at      | TIMESTAMP | Defaults to current timestamp                       |
| updated_at      | TIMESTAMP | Updates on modification                             |

---

### 3. Booking
| Field           | Data Type | Constraints                                 |
|-----------------|-----------|-----------------------------------------------------|
| booking_id      | UUID      | Primary Key, Indexed                                |
| property_id     | UUID      | Foreign Key → Property(property_id)                 |
| user_id         | UUID      | Foreign Key → User(user_id)                         |
| start_date      | DATE      | Not Null                                             |
| end_date        | DATE      | Not Null                                             |
| total_price     | DECIMAL   | Not Null                                             |
| status          | ENUM      | Not Null (`pending`, `confirmed`, `canceled`)       |
| created_at      | TIMESTAMP | Defaults to current timestamp                       |

---

### 4. Payment
| Field           | Data Type | Constraints                                 |
|-----------------|-----------|-----------------------------------------------------|
| payment_id      | UUID      | Primary Key, Indexed                                |
| booking_id      | UUID      | Foreign Key → Booking(booking_id)                   |
| amount          | DECIMAL   | Not Null                                             |
| payment_date    | TIMESTAMP | Defaults to current timestamp                       |
| payment_method  | ENUM      | Required (`credit_card`, `paypal`, `stripe`)        |

---

### 5. Review
| Field           | Data Type | Constraints                                 |
|-----------------|-----------|-----------------------------------------------------|
| review_id       | UUID      | Primary Key, Indexed                                |
| property_id     | UUID      | Foreign Key → Property(property_id)                 |
| user_id         | UUID      | Foreign Key → User(user_id)                         |
| rating          | INTEGER   | Required, Must be between 1 and 5                   |
| comment         | TEXT      | Required                                            |
| created_at      | TIMESTAMP | Defaults to current timestamp                       |

---

### 6. Message
| Field           | Data Type | Constraints                                 |
|-----------------|-----------|-----------------------------------------------------|
| message_id      | UUID      | Primary Key, Indexed                                |
| sender_id       | UUID      | Foreign Key → User(user_id)                         |
| recipient_id    | UUID      | Foreign Key → User(user_id)                         |
| message_body    | TEXT      | Not Null                                            |
| sent_at         | TIMESTAMP | Defaults to current timestamp                       |

---

