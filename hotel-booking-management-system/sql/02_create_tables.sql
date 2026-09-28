USE hotel_booking_management;

CREATE TABLE Hotels (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(50),
    city VARCHAR(30),
    star_rating INT
);

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    room_number VARCHAR(10),
    room_type VARCHAR(20),
    price DECIMAL(10,2),
    status VARCHAR(20),

    FOREIGN KEY (hotel_id)
    REFERENCES Hotels(hotel_id)
);

CREATE TABLE Guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_name VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(30)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    booking_status VARCHAR(20),

    FOREIGN KEY (guest_id)
    REFERENCES Guests(guest_id),

    FOREIGN KEY (room_id)
    REFERENCES Rooms(room_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),

    FOREIGN KEY (booking_id)
    REFERENCES Bookings(booking_id)
);