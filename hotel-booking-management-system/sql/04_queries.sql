USE hotel_booking_management;

-- 1. Display Available Rooms

SELECT
    room_number,
    room_type,
    price,
    hotel_name
FROM Rooms
JOIN Hotels
    ON Rooms.hotel_id = Hotels.hotel_id
WHERE status = 'Available';


-- 2. Find Guests Staying Today

SELECT
    guest_name,
    hotel_name,
    room_number,
    check_in,
    check_out
FROM Guests
JOIN Bookings
    ON Guests.guest_id = Bookings.guest_id
JOIN Rooms
    ON Bookings.room_id = Rooms.room_id
JOIN Hotels
    ON Rooms.hotel_id = Hotels.hotel_id
WHERE CURDATE()
BETWEEN check_in AND check_out
AND booking_status = 'Active';


-- 3. Calculate Total Revenue

SELECT
    SUM(amount) AS Total_Revenue
FROM Payments
WHERE payment_status = 'Paid';


-- 4. Display Bookings Between Two Dates

SELECT
    booking_id,
    guest_name,
    hotel_name,
    check_in,
    check_out
FROM Bookings
JOIN Guests
    ON Bookings.guest_id = Guests.guest_id
JOIN Rooms
    ON Bookings.room_id = Rooms.room_id
JOIN Hotels
    ON Rooms.hotel_id = Hotels.hotel_id
WHERE check_in
BETWEEN '2026-07-25'
AND '2026-07-31';


-- 5. Find the Most Booked Room Type

SELECT
    room_type,
    COUNT(*) AS Total_Bookings
FROM Rooms
JOIN Bookings
    ON Rooms.room_id = Bookings.room_id
GROUP BY room_type
ORDER BY Total_Bookings DESC
LIMIT 1;


-- 6. Calculate Occupancy Rate

SELECT
    ROUND(
        (
            COUNT(CASE WHEN status = 'Occupied' THEN 1 END)
            * 100.0
            / COUNT(*)
        ), 2
    ) AS Occupancy_Rate
FROM Rooms;


-- 7. Display Cancelled Bookings

SELECT
    booking_id,
    guest_name,
    hotel_name,
    room_number
FROM Bookings
JOIN Guests
    ON Bookings.guest_id = Guests.guest_id
JOIN Rooms
    ON Bookings.room_id = Rooms.room_id
JOIN Hotels
    ON Rooms.hotel_id = Hotels.hotel_id
WHERE booking_status = 'Cancelled';


-- 8. Find Customers with Multiple Bookings

SELECT
    guest_name,
    COUNT(booking_id) AS Total_Bookings
FROM Guests
JOIN Bookings
    ON Guests.guest_id = Bookings.guest_id
GROUP BY guest_name
HAVING COUNT(*) > 1;


-- 9. Display Average Room Price

SELECT
    AVG(price) AS Average_Room_Price
FROM Rooms;


-- 10. Find Hotels with More Than 100 Rooms

SELECT
    hotel_name,
    COUNT(room_id) AS Total_Rooms
FROM Hotels
JOIN Rooms
    ON Hotels.hotel_id = Rooms.hotel_id
GROUP BY hotel_name
HAVING COUNT(room_id) > 100;


-- 11. Find the Highest-Paying Guest

SELECT
    g.guest_name,
    SUM(p.amount) AS Total_Spent
FROM Guests g
JOIN Bookings b
    ON g.guest_id = b.guest_id
JOIN Payments p
    ON b.booking_id = p.booking_id
GROUP BY g.guest_name
ORDER BY Total_Spent DESC
LIMIT 1;


-- 12. Hotel-Wise Revenue

SELECT
    h.hotel_name,
    SUM(p.amount) AS Revenue
FROM Hotels h
JOIN Rooms r
    ON h.hotel_id = r.hotel_id
JOIN Bookings b
    ON r.room_id = b.room_id
JOIN Payments p
    ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Paid'
GROUP BY h.hotel_name;


-- 13. Most Expensive Room

SELECT
    room_number,
    room_type,
    price
FROM Rooms
ORDER BY price DESC
LIMIT 1;


-- 14. Guests Who Have Never Made a Booking

SELECT
    g.guest_name
FROM Guests g
LEFT JOIN Bookings b
    ON g.guest_id = b.guest_id
WHERE b.booking_id IS NULL;


-- 15. Rank Hotels by Revenue

SELECT
    h.hotel_name,
    SUM(p.amount) AS Revenue,
    RANK() OVER (
        ORDER BY SUM(p.amount) DESC
    ) AS Revenue_Rank
FROM Hotels h
JOIN Rooms r
    ON h.hotel_id = r.hotel_id
JOIN Bookings b
    ON r.room_id = b.room_id
JOIN Payments p
    ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Paid'
GROUP BY h.hotel_name;