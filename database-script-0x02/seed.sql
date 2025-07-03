USE Alx_AirBnB

-- This script seeds the database with initial data for the Airbnb clone project

INSERT into users(user_id, first_name, last_name, email, password_hash, phone_number, role) 
VALUES('c4b2c3d4-e5f6-7890-ab12-cd34ef56gh78', 'Elvis', 'Ibenacho', 'elv.ibe@example.com', '$2v$12$eIXwlbdpW8yQJ5QhQ8QeU', '1234567870', 'host'),
('d32c3d4e5-f678-9012-ab34-cd56ef78gh90', 'Adesola', 'Babatunde', 'ade.babs@example.com', '$2n$12$7s8d9f0g1h2j3k4l5m6n7o8p9q0r1s2t', '1987654321', 'guest');

INSERT into property(property_id, host_id, name, description, address, pricepernight)
VALUES
('r3e5f678-9012-3456-bcde-f6789012cdeu', 'a1b2c3d4-e5f6-7890-ab12-cd34ef56gh78', 'Uptown hill Bungalow', 'A relaxing bungalow just steps from the uptown.', '200 Ocean Ave, Seaside', 130.00),
('y3e5f678-9012-3456-bcde-f6789012cdei', 'a1b2c3d4-e5f6-7890-ab12-cd34ef56gh78', 'Lane Bungalow', 'A relaxing bungalow just steps from the lane.', '300 Ocean Ave, Seaside', 160.00);

INSERT into booking (
  booking_id, property_id, user_id,
  start_date, end_date, total_price, status
) VALUES
('e6f6g7h8-8012-3456-rjkl-jn789012opqr', 'c3d4e5f6-7890-1234-abcd-ef567890abcd', 'a1b2c3d4-e5f6-7890-ab12-cd34ef56gh78', '2025-07-01', '2025-07-05', 480.00, 'confirmed');


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
