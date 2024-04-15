create database final;
use final;

--Lab 1:
-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    address VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

-- Insert data into Customers table
INSERT INTO Customers (customer_id, customer_name, address, email, phone_number) VALUES
(1, 'PharmaCo Inc.', '123 Pharma St., Pharma City', 'info@pharmaco.com', '123-456-7890'),
(2, 'MediCare Solutions', '456 Health Blvd., Medtown', 'contact@medicare.com', '234-567-8901'),
(3, 'PharmaPlus Ltd.', '789 Wellness Ave., Pharmaville', 'support@pharmaplus.com', '345-678-9012'),
(4, 'HealLife Pharmaceuticals', '987 Cure Road, Healville', 'info@heallife.com', '456-789-0123');

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_category VARCHAR(50)
);

-- Insert data into Products table
INSERT INTO Products (product_id, product_name, product_category) VALUES
(101, 'Product A', 'Category 1'),
(102, 'Product B', 'Category 2'),
(103, 'Product C', 'Category 1'),
(104, 'Product D', 'Category 3'),
(105, 'Product E', 'Category 2'),
(106, 'Product F', 'Category 1'),
(107, 'Product G', 'Category 3'),
(108, 'Product H', 'Category 2');

-- Create Sales_Records table
CREATE TABLE Sales_Records (
    record_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sales_amount DECIMAL(10, 2),
    sales_date DATE
);

-- Insert data into Sales_Records table
INSERT INTO Sales_Records (record_id, customer_id, product_id, sales_amount, sales_date) VALUES
(1, 1, 101, 1000.50, '2024-03-01'),
(2, 2, 102, 2000.75, '2024-03-02'),
(3, 1, 103, 1500.25, '2024-03-03'),
(4, 3, 104, 3000.00, '2024-03-04'),
(5, 4, 105, 1200.90, '2024-03-05'),
(6, 2, 106, 1800.30, '2024-03-06'),
(7, 1, 107, 2500.60, '2024-03-07'),
(8, 3, 108, 4000.75, '2024-03-08');



-- --Lab 2:
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10),
    departure_airport VARCHAR(50),
    arrival_airport VARCHAR(50),
    departure_date DATE,
    arrival_date DATE,
    base_price DECIMAL(10, 2)
);

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    frequent_flyer_status BOOLEAN
);

CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    ticket_price DECIMAL(10, 2),
    ticket_date DATE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);


INSERT INTO Flights VALUES (1, 'FL123', 'JFK', 'LAX', '2024-04-01', '2024-04-01', 500.00);
INSERT INTO Flights VALUES (2, 'FL456', 'LAX', 'ORD', '2024-04-02', '2024-04-02', 400.00);
INSERT INTO Flights VALUES (3, 'FL789', 'ORD', 'DFW', '2024-04-03', '2024-04-03', 300.00);

INSERT INTO Passengers VALUES (1, 'John Doe', 35, 'Male', true);
INSERT INTO Passengers VALUES (2, 'Jane Smith', 28, 'Female', false);
INSERT INTO Passengers VALUES (3, 'Michael Johnson', 40, 'Male', true);

INSERT INTO Tickets VALUES (101, 1, 1, 500.00, '2024-03-30');
INSERT INTO Tickets VALUES (102, 2, 2, 400.00, '2024-03-31');
INSERT INTO Tickets VALUES (103, 3, 3, 300.00, '2024-04-01');
INSERT INTO Tickets VALUES (104, 1, 2, 500.00, '2024-03-30');
INSERT INTO Tickets VALUES (105, 2, 3, 400.00, '2024-03-31');
INSERT INTO Tickets VALUES (106, 3, 1, 300.00, '2024-04-01');

-- --Lab3:
-- Create Players table
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(255),
    player_email VARCHAR(255),
    registration_date DATE
);

-- Create Games table
CREATE TABLE Games (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(255),
    game_genre VARCHAR(255),
    release_date DATE
);

-- Create PlayerScores table
CREATE TABLE PlayerScores (
    score_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    score INT,
    play_date DATE,
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);



-- Insert statements for Players table
INSERT INTO Players (player_id, player_name, player_email, registration_date) VALUES
(1, 'John Doe', 'johndoe@example.com', '2023-01-15'),
(2, 'Jane Smith', 'janesmith@example.com', '2023-02-20'),
(3, 'Mark Johnson', 'markjohnson@example.com', '2023-03-10');

-- Insert statements for Games table
INSERT INTO Games (game_id, game_name, game_genre, release_date) VALUES
(1, 'Fortnite', 'Battle Royale', '2020-07-25'),
(2, 'Minecraft', 'Sandbox', '2011-11-18'),
(3, 'League of Legends', 'MOBA', '2009-10-27');

-- Insert statements for PlayerScores table
INSERT INTO PlayerScores (score_id, player_id, game_id, score, play_date) VALUES
(1, 1, 1, 250, '2023-01-20'),
(2, 1, 2, 500, '2023-02-01'),
(3, 2, 1, 300, '2023-02-15'),
(4, 2, 3, 700, '2023-03-05'),
(5, 3, 1, 400, '2023-03-20'),
(6, 3, 2, 600, '2023-03-25'),
(7, 3, 3, 800, '2023-04-01');


-- --Lab 4:
-- Create Patients table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    admission_date DATE,
    discharge_date DATE,
    diagnosis VARCHAR(100),
    bill_amount DECIMAL(10, 2)
);

-- Insert data into Patients table
INSERT INTO Patients (patient_id, patient_name, age, gender, admission_date, discharge_date, diagnosis, bill_amount)
VALUES
    (1, 'John Doe', 45, 'Male', '2023-01-15', '2023-01-30', 'Hypertension', 1500.00),
    (2, 'Jane Smith', 30, 'Female', '2023-02-10', '2023-02-20', 'Diabetes', 2000.00),
    (3, 'Michael Johnson', 65, 'Male', '2023-03-05', '2023-03-20', 'Stroke', 3500.00),
    (4, 'Emily Wilson', 50, 'Female', '2023-04-12', '2023-04-25', 'Pneumonia', 2800.00),
    (5, 'David Brown', 55, 'Male', '2023-05-20', '2023-06-05', 'Heart Attack', 5000.00);

-- Create Doctors table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    years_of_experience INT
);

-- Insert data into Doctors table
INSERT INTO Doctors (doctor_id, doctor_name, specialization, years_of_experience)
VALUES
    (101, 'Dr. Smith', 'Cardiology', 10),
    (102, 'Dr. Johnson', 'Neurology', 15),
    (103, 'Dr. Brown', 'Endocrinology', 8),
    (104, 'Dr. Wilson', 'Pulmonology', 12),
    (105, 'Dr. White', 'Internal Medicine', 5);

-- Create Treatments table
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    treatment_name VARCHAR(100),
    treatment_date DATE,
    cost DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Insert data into Treatments table
INSERT INTO Treatments (treatment_id, patient_id, doctor_id, treatment_name, treatment_date, cost)
VALUES
    (1, 1, 101, 'Angioplasty', '2023-01-20', 5000.00),
    (2, 2, 103, 'Insulin Therapy', '2023-02-15', 1000.00),
    (3, 3, 102, 'Physical Therapy', '2023-03-10', 2000.00),
    (4, 4, 104, 'Oxygen Therapy', '2023-04-15', 1500.00),
    (5, 5, 101, 'Heart Surgery', '2023-05-25', 10000.00);

-- Lab 5:
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50),
    enrollment_year INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT,
    department VARCHAR(50)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2),
    semester VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);



-- Inserting data into the Students table
INSERT INTO Students (student_id, student_name, major, enrollment_year) VALUES
(1, 'John Doe', 'Computer Science', 2020),
(2, 'Jane Smith', 'Biology', 2021),
(3, 'Alice Johnson', 'History', 2019),
(4, 'Michael Brown', 'Mathematics', 2020),
(5, 'Emily Wilson', 'Psychology', 2021),
(6, 'David Lee', 'Economics', 2019);

-- Inserting data into the Courses table
INSERT INTO Courses (course_id, course_name, credits, department) VALUES
(101, 'Introduction to Computer Science', 3, 'Computer Science'),
(102, 'Cell Biology', 4, 'Biology'),
(103, 'World History', 3, 'History'),
(104, 'Calculus I', 4, 'Mathematics'),
(105, 'Introduction to Psychology', 3, 'Psychology'),
(106, 'Microeconomics', 3, 'Economics');

-- Inserting data into the Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, grade, semester) VALUES
(1, 1, 101, 85.0, 'Fall'),
(2, 1, 104, 78.5, 'Fall'),
(3, 2, 102, 92.0, 'Spring'),
(4, 3, 103, 88.5, 'Fall'),
(5, 3, 106, 95.0, 'Spring'),
(6, 4, 101, 90.0, 'Fall'),
(7, 4, 104, 85.5, 'Spring'),
(8, 5, 105, 87.5, 'Fall'),
(9, 5, 106, 91.0, 'Spring'),
(10, 6, 106, 94.0, 'Fall');

select * from customers;
select * from products;
select * from sales_records;

select p.product_category,avg(s.sales_amount) as avg_sales ,s.sales_date from products p
join sales_records s using (product_id)
group by p.product_category,s.sales_date;

select p.product_id,p.product_name,s.sales_amount as total_sales from products p
join sales_records s using (product_id)
where year(sales_date)=year(now())
order by total_sales desc
limit 3;-- round(percent_rank() over(order by s.sales_amount) * 100, 2) as ;

select c.customer_name,
round(percent_rank() over(order by s.sales_amount) * 100, 2) as contribution_percentage,
rank() over (order by s.sales_amount desc) as rnk
 from customers c
join sales_records s using (customer_id);

select customer_id,count(customer_id),
case 
	when count(customer_id)>4 then "Consistent Buyers"
    else "Occasional Buyers"
    end as buyer_type
from sales_records
group by customer_id;

select * from flights;
select * from passengers;
select * from tickets;

select f.flight_number,f.departure_airport,f.arrival_airport,avg(t.ticket_price) from flights f
join tickets t using (flight_id)
group by f.flight_number,f.departure_airport,f.arrival_airport;

select f.flight_number,f.departure_date,count(t.passenger_id) as tickets_sold from flights f
join tickets t using (flight_id)
where month(departure_date) = 4
group by f.flight_number,f.departure_date
order by count(t.passenger_id) desc;

select p.passenger_name,sum(t.ticket_price) as total_amount_spent,p.frequent_flyer_status
from passengers p join tickets t using(passenger_id)
group by p.passenger_name,p.frequent_flyer_status
order by sum(t.ticket_price) desc
limit 5;

select month(ticket_date) as month,count(ticket_id) as tickets_sold,sum(ticket_price) as ticket_price from tickets
group by month(ticket_date)
order by tickets_sold desc
limit 1;

select * from players;
select * from games;
select * from playerscores;

select p.player_name,g.game_genre,avg(s.play_date-p.registration_date) as play_time
from players p join playerscores s using (player_id)
join games g using (game_id)
group by p.player_name,g.game_genre;

select g.game_name,count(s.player_id) as no_of_players,sum(s.game_id) as total_players
from players p join playerscores s using (player_id)
join games g using (game_id)
group by g.game_name
order by total_players desc
limit 3;

select g.game_name,avg(s.score) as avg_score,max(s.score) as highest_score,sum(s.game_id) as total_players
from players p join playerscores s using (player_id)
join games g using (game_id)
group by g.game_name;

select p.player_name,p.registration_date,s.play_date
from players p join playerscores s using (player_id)
join games g using (game_id)
where s.play_date-p.registration_date > 30;

select * from patients;
select * from doctors;
select * from treatments;

select d.doctor_name,sum(t.cost) as total_cost from doctors d
join treatments t using (doctor_id)
group by d.doctor_name;

select treatment_name,sum(cost) as total_revenue,
round(percent_rank() over(order by sum(cost)) * 100, 2) as contribution_percentage
from treatments
group by treatment_name;

select patient_id,patient_name,admission_date,discharge_date from patients
join treatments using (patient_id)
where admission_date - treatment_date <> 1
order by admission_date asc;

select gender,diagnosis,discharge_date-admission_date as LOS 
from patients;

select * from students;
select * from courses;
select * from enrollments;

select c.department,e.semester,avg(e.grade) from courses c
join enrollments e using(course_id)
group by c.department,e.semester;

select major,count(student_id) as no_of_students ,enrollment_year from students 
group by major ,enrollment_year
order by no_of_students desc;

select s.student_id,s.student_name,e.semester,sum(c.credits) as total_credits
from students s join enrollments e using (student_id)
join courses c using (course_id)
group by s.student_id,s.student_name,e.semester
having total_credits>50;

select c.course_name,s.enrollment_year,count(s.student_id) as no_of_students_enrolled
from students s join enrollments e using (student_id)
join courses c using (course_id)
group by c.course_name,s.enrollment_year
order by no_of_students_enrolled desc
limit 3;


