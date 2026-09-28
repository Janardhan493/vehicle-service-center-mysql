USE hotel_booking_management;

-- Insert Hotels
INSERT INTO Hotels(hotel_name, city, star_rating)
VALUES
('Grand Palace','Chennai',5),
('Royal Inn','Bangalore',4),
('Blue Moon','Hyderabad',3);


-- Insert Rooms
INSERT INTO Rooms(hotel_id,room_number,room_type,price,status)
VALUES
(1,'101','Standard',2500,'Available'),
(1,'102','Deluxe',4000,'Occupied'),
(1,'103','Suite',7000,'Occupied'),
(2,'201','Standard',2200,'Available'),
(2,'202','Deluxe',3800,'Occupied'),
(3,'301','Standard',1800,'Available'),
(3,'302','Suite',6000,'Occupied');


-- Insert Guests
INSERT INTO Guests(guest_name,phone,city)
VALUES
('Rahul','9876543210','Chennai'),
('Priya','9876543211','Bangalore'),
('Arun','9876543212','Hyderabad'),
('Sneha','9876543213','Coimbatore'),
('Karthik','9876543214','Mumbai');


-- Insert Bookings
INSERT INTO Bookings(
    guest_id,
    room_id,
    check_in,
    check_out,
    booking_status
)
VALUES
(1,2,'2026-07-25','2026-07-30','Completed'),
(2,3,'2026-07-28','2026-08-02','Active'),
(3,5,'2026-07-29','2026-08-01','Active'),
(4,7,'2026-07-20','2026-07-22','Completed'),
(1,1,'2026-08-05','2026-08-08','Booked'),
(5,4,'2026-07-31','2026-08-03','Cancelled');


-- Insert Payments
INSERT INTO Payments(
    booking_id,
    amount,
    payment_status
)
VALUES
(1,20000,'Paid'),
(2,35000,'Paid'),
(3,12000,'Pending'),
(4,15000,'Paid'),
(5,7500,'Pending'),
(6,0,'Refunded');