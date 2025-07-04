USE  Alx_AirBnB;

-- This script creates the necessary tables/entities for the AirBnb Clone project 
CREATE TABLE IF NOT EXISTS users(
    user_id CHAR(60) UNIQUE PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    email VARCHAR(128) UNIQUE NOT NULL,
    password_hash VARCHAR(128) NOT NULL,
    phone_number VARCHAR(15) DEFAULT NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE IF NOT EXISTS property(
    property_id CHAR(60) UNIQUE PRIMARY KEY,
    host_id CHAR(60) NOT NULL,
    name VARCHAR(128) NOT NULL,
    description TEXT NOT NULL,
    address VARCHAR(256) NOT NULL,
    pricepernight DECIMAL(5,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id)
)

CREATE TABLE IF NOT EXISTS booking(
    booking_id CHAR(60) UNIQUE PRIMARY KEY,
    property_id CHAR(60) NOT NULL,
    user_id CHAR(60) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(5,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

)

CREATE TABLE IF NOT EXISTS review(
    review_id CHAR(60) UNIQUE PRIMARY KEY,
    property_id CHAR(60) NOT NULL,
    user_id CHAR(60) NOT NULL,
    rating INT NOT NULL,
    constraint rating_check
        CHECK( 
            rating >=1 AND rating <=5
        ),
    comment TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

)

CREATE TABLE IF NOT EXISTS message(
    message_id CHAR(60) UNIQUE PRIMARY KEY,
    sender_id CHAR(60) NOT NULL,
    recipient_id CHAR(60) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id)
)

CREATE TABLE IF NOT EXISTS payment(
    payment_id CHAR(60) UNIQUE PRIMARY KEY,
    booking_id CHAR(60) NOT NULL,
    amount DECIMAL (5, 2) NOT NULL,
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL
)


-- Include foreign keys to establish the relationships between the tables
ALTER TABLE booking 
ADD FOREIGN KEY (property_id) REFERENCES property(property_id)

ALTER TABLE booking 
ADD FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE payment 
ADD FOREIGN KEY (booking_id) REFERENCES booking(booking_id);

ALTER TABLE review 
ADD FOREIGN KEY (property_id) REFERENCES property(property_id);

ALTER TABLE review 
ADD FOREIGN KEY (user_id) REFERENCES users(user_id);

-- Show the tables in the database
SHOW TABLES;

DROP TABLE payment
