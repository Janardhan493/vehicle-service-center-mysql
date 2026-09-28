CREATE DATABASE vehicle_service_center;
USE vehicle_service_center;

-- =========================
-- 1. CUSTOMERS
-- =========================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(30)
);

INSERT INTO Customers(customer_name, phone, city)
VALUES
('Rahul','9876543210','Chennai'),
('Priya','9876543211','Bangalore'),
('Arun','9876543212','Hyderabad'),
('Sneha','9876543213','Coimbatore'),
('Karthik','9876543214','Mumbai');


-- =========================
-- 2. VEHICLES
-- =========================

CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    vehicle_number VARCHAR(15),
    vehicle_model VARCHAR(50),
    vehicle_type VARCHAR(30),
    FOREIGN KEY(customer_id)
        REFERENCES Customers(customer_id)
);

INSERT INTO Vehicles(customer_id, vehicle_number, vehicle_model, vehicle_type)
VALUES
(1,'TN10AB1234','Hyundai i20','Car'),
(2,'KA05XY5678','Honda City','Car'),
(3,'TS08PQ4321','Royal Enfield','Bike'),
(4,'TN22KL9090','Maruti Swift','Car'),
(5,'MH12AA1111','TVS Apache','Bike');


-- =========================
-- 3. MECHANICS
-- =========================

CREATE TABLE Mechanics (
    mechanic_id INT PRIMARY KEY AUTO_INCREMENT,
    mechanic_name VARCHAR(50),
    specialization VARCHAR(50),
    experience INT
);

INSERT INTO Mechanics(mechanic_name, specialization, experience)
VALUES
('Ramesh','Engine',10),
('Suresh','Electrical',8),
('Mahesh','General Service',6),
('Ganesh','Painting',12);


-- =========================
-- 4. SERVICE RECORDS
-- =========================

CREATE TABLE Service_Records (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_id INT,
    mechanic_id INT,
    service_type VARCHAR(50),
    service_date DATE,
    cost DECIMAL(10,2),
    FOREIGN KEY(vehicle_id)
        REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY(mechanic_id)
        REFERENCES Mechanics(mechanic_id)
);

INSERT INTO Service_Records
(vehicle_id, mechanic_id, service_type, service_date, cost)
VALUES
(1,1,'Engine Repair','2026-07-10',8000),
(1,2,'Electrical Repair','2026-07-20',3000),
(2,3,'General Service','2026-07-21',2500),
(3,1,'Engine Repair','2026-07-15',5000),
(4,3,'General Service','2026-07-18',2200),
(5,2,'Electrical Repair','2026-06-30',1800),
(2,4,'Painting','2026-07-25',7000),
(3,3,'General Service','2026-07-27',2000);


-- =========================
-- 5. BILLS
-- =========================

CREATE TABLE Bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    service_id INT,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY(service_id)
        REFERENCES Service_Records(service_id)
);

INSERT INTO Bills(service_id, total_amount, payment_status)
VALUES
(1,8000,'Paid'),
(2,3000,'Paid'),
(3,2500,'Pending'),
(4,5000,'Paid'),
(5,2200,'Paid'),
(6,1800,'Pending'),
(7,7000,'Paid'),
(8,2000,'Pending');