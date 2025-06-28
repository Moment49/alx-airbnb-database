USE Alx_AirBnB

-- This script seeds the database with initial data for the Airbnb clone project

INSERT into users(user_id, first_name, last_name, email, password_hash, phone_number, role) 
VALUES('a1b2c3d4-e5f6-7890-ab12-cd34ef56gh78', 'Alice', 'Johnson', 'alice.johnson@example.com', '$2b$12$eIXwlbdpW8yQJ5QhQ8QeU', '1234567890', 'host'),
('b2c3d4e5-f678-9012-ab34-cd56ef78gh90', 'Bob', 'Smith', 'bob.smith@example.com', '$2b$12$7s8d9f0g1h2j3k4l5m6n7o8p9q0r1s2t', '0987654321', 'guest');

INSERT into property(property_id, host_id, name, description, address, pricepernight)
VALUES
('c3d4e5f6-7890-1234-abcd-ef567890abcd', 'a1b2c3d4-e5f6-7890-ab12-cd34ef56gh78', 'Cozy Downtown Loft', 'A modern loft in the heart of the city, close to all attractions.', '123 Main St, Metropolis', 120.00),
('d4e5f678-9012-3456-bcde-f6789012cdef', 'a1b2c3d4-e5f6-7890-ab12-cd34ef56gh78', 'Beachside Bungalow', 'A relaxing bungalow just steps from the beach.', '456 Ocean Ave, Seaside', 200.00);

INSERT into booking (
  booking_id, property_id, user_id,
  start_date, end_date, total_price, status
) VALUES
('e5f6g7h8-9012-3456-ijkl-mn789012opqr', 'c3d4e5f6-7890-1234-abcd-ef567890abcd', 'b2c3d4e5-f678-9012-ab34-cd56ef78gh90', '2025-07-01', '2025-07-05', 480.00, 'confirmed'),
('f6g7h8i9-0123-4567-jklm-no890123pqrs', 'd4e5f678-9012-3456-bcde-f6789012cdef', 'b2c3d4e5-f678-9012-ab34-cd56ef78gh90', '2025-08-10', '2025-08-15', 500.00, 'pending');

INSERT into payment(payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('p1q2r3s4-t5u6-7890-vw12-xy34za56bc78', 'e5f6g7h8-9012-3456-ijkl-mn789012opqr', 480.00, '2025-06-25 10:00:00', 'credit_card'),
('q2r3s4t5-u6v7-8901-wx23-yz45ab67cd89', 'f6g7h8i9-0123-4567-jklm-no890123pqrs', 500.00, '2025-07-30 14:30:00', 'paypal');

INSERT into review(
  review_id, property_id, user_id, rating, comment, created_at
)
VALUES
('r1s2t3u4-v5w6-7890-xy12-za34bc56de78', 'c3d4e5f6-7890-1234-abcd-ef567890abcd', 'b2c3d4e5-f678-9012-ab34-cd56ef78gh90', 5, 'Amazing place, very clean and central!', '2025-07-06 12:00:00'),
('s2t3u4v5-w6x7-8901-yz23-ab45cd67ef89', 'd4e5f678-9012-3456-bcde-f6789012cdef', 'b2c3d4e5-f678-9012-ab34-cd56ef78gh90', 4, 'Great stay, loved the beach access.', '2025-08-16 10:30:00');

INSERT into payment(payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('p1q2r3s4-t5u6-7890-vw12-xy34za56bc78', 'e5f6g7h8-9012-3456-ijkl-mn789012opqr', 480.00, '2025-06-25 10:00:00', 'credit_card'),
('q2r3s4t5-u6v7-8901-wx23-yz45ab67cd89', 'f6g7h8i9-0123-4567-jklm-no890123pqrs', 500.00, '2025-07-30 14:30:00', 'paypal');


INSERT into message(
  message_id, sender_id, recipient_id, message_body, sent_at
)
VALUES
('m1n2o3p4-q5r6-7890-st12-uv34wx56yz78', 'b2c3d4e5-f678-9012-ab34-cd56ef78gh90', 'a1b2c3d4-e5f6-7890-ab12-cd34ef56gh78', 'Hi, is the loft available for early check-in?', '2025-06-20 09:15:00'),
('n2o3p4q5-r6s7-8901-tu23-vw45xy67za89', 'a1b2c3d4-e5f6-7890-ab12-cd34ef56gh78', 'b2c3d4e5-f678-9012-ab34-cd56ef78gh90', 'Yes, early check-in is possible. Let me know your arrival time.', '2025-06-20 10:00:00');
