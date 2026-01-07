
-- Module End Assignment --
-- “Analyzing E-Learning Platform Purchases using MySQL” --

-- 1. Create the database and schema. Populate the Schema --

CREATE DATABASE E_learning_DB;
USE E_learning_DB;

CREATE TABLE Learners (
    Learner_id INT PRIMARY KEY,
    Full_name VARCHAR(50),
    Country VARCHAR(40)
);

CREATE TABLE Courses (
    Course_id INT PRIMARY KEY,
    Course_name VARCHAR(100),
    Category VARCHAR(70),
    Unit_price DECIMAL(10, 2)
);

CREATE TABLE Purchases (
    Purchase_id INT PRIMARY KEY,
    Learner_id INT,
    Course_id INT,
    Quantity INT,
    Purchase_date DATE,
    FOREIGN KEY (learner_id) REFERENCES Learners(Learner_id),
    FOREIGN KEY (course_id) REFERENCES Courses(Course_id)
);

INSERT INTO Learners (Learner_id, Full_name, Country) VALUES
(1, 'Arjun Kumar', 'India'),
(2, 'Sophia Williams', 'USA'),
(3, 'Daniel Smith', 'UK'),
(4, 'Mei Lin', 'China'),
(5, 'Carlos Fernandez', 'Spain');

INSERT INTO Courses (Course_id, Course_name, Category, Unit_price) VALUES
(101, 'Introduction to Data Analytics', 'Data Science', 4999.00),
(102, 'SQL for Beginners', 'Database', 2999.50),
(103, 'Python Programming', 'Programming', 3999.00),
(104, 'Machine Learning Basics', 'Artificial Intelligence', 6999.99),
(105, 'Power BI Dashboard Design', 'Business Intelligence', 5499.00);

INSERT INTO Purchases (Purchase_id, Learner_id, Course_id, Quantity, Purchase_date) 
VALUES
(1, 1, 101, 1, '2024-01-10'),
(2, 2, 102, 2, '2024-01-12'),
(3, 3, 103, 1, '2024-01-15'),
(4, 4, 104, 1, '2024-01-18'),
(5, 5, 105, 3, '2024-01-20'),
(6, 1, 102, 1, '2024-02-05'),
(7, 2, 103, 2, '2024-02-10'),
(8, 3, 104, 1, '2024-02-14');
 
SELECT * FROM Learners;
SELECT * FROM Courses;
SELECT * FROM Purchases;

DESC Learners;
DESC Courses;
DESC Purchases;

-- 2. Data Exploration Using Joins --

-- Format currency values to 2 decimal places --
-- Use aliases for column names (e.g., AS total_revenue) --

SELECT 
    ROUND(SUM(Quantity * Unit_price) , 2) AS Total_revenue
FROM Purchases P
JOIN Courses C
	 ON P.Course_id = C.Course_id;
     
-- Sort results appropriately (e.g., highest total_spent first) --
     
SELECT 
    L.Full_name AS learner_name,
    C.Course_name,
    C.Category,
    ROUND(SUM(P.Quantity * C.Unit_price), 2) AS Highest_total_spent
FROM Purchases P
JOIN Learners L 
    ON P.learner_id = L.Learner_id
JOIN Courses C 
    ON P.Course_id = C.Course_id
GROUP BY 
    L.Full_name,
    C.Course_name,
    C.Category
ORDER BY Highest_total_spent DESC
LIMIT 1;

-- Use SQL INNER JOIN, LEFT JOIN, and RIGHT JOIN to --
-- Combine learner, course, and purchase data --

-- INNER JOIN --

SELECT 
    L.Learner_id,
    L.Full_name AS Learner_name,
    L.Country,
    C.Course_id,
    C.Course_name,
    C.Category,
    C.Unit_price,
    P.Purchase_id,
    P.Quantity,
    P.Purchase_date
FROM Purchases P
INNER JOIN Learners L
    ON P.Learner_id = L.Learner_id
INNER JOIN Courses C
    ON P.Course_id = C.Course_id;
    
-- LEFT JOIN--

SELECT 
    L.Learner_id,
    L.Full_name AS Learner_name,
    L.Country,
    C.Course_id,
    C.Course_name,
    C.Category,
    C.Unit_price,
    P.Purchase_id,
    P.Quantity,
    P.Purchase_date
FROM Purchases P
LEFT JOIN Learners L
    ON P.learner_id = L.Learner_id
LEFT JOIN Courses C
    ON P.Course_id = C.Course_id;
    
-- RIGHT JOIN --

SELECT 
    L.Learner_id,
    L.Full_name AS Learner_name,
    L.Country,
    C.Course_id,
    C.Course_name,
    C.Category,
    C.Unit_price,
    P.Purchase_id,
    P.Quantity,
    P.Purchase_date
FROM Purchases P
RIGHT JOIN Learners L
    ON P.learner_id = L.Learner_id
RIGHT JOIN Courses C
    ON P.course_id = C.Course_id;
    
-- Display each learner’s purchase details (course name, category, quantity, total amount, and purchase date) --

SELECT 
	 L.Full_name AS Learner_name,
     C.Category,
     C.Course_name,
     P.Quantity,
     P.Purchase_date,
     ROUND(SUM(P.Quantity * C.Unit_price) ,2) AS Total_amount
FROM
     Purchases P 
JOIN Learners L
	 ON P.Learner_id = L.Learner_id
JOIN Courses C
     ON P.Course_id = C.Course_id
GROUP BY 
	 L.Full_name,
     C.Category,
     C.Course_name,
     P.Quantity,
     P.Purchase_date
ORDER BY
     Learner_name,
     Total_amount DESC;
     
-- 3. Analytical Queries --

-- Q1. Display each learner’s total spending (quantity × unit_price) along with their country --

SELECT
      L.Full_name AS Learner_name,
      L.Country,
      ROUND(SUM(P.Quantity * C.Unit_price) ,2) AS Total_spending_amount
FROM Purchases P
JOIN Learners L
     ON P.Learner_id = L.Learner_id
JOIN Courses C
	 ON P.Course_id = C.Course_id
GROUP BY
	 L.Full_name,
     L.Country
ORDER BY
	 Total_spending_amount DESC;
      
-- Q2. Find the top 3 most purchased courses based on total quantity sold --

SELECT
     C.Course_name,
     C.Category,
     SUM(P.Quantity) AS Total_quantity_sold
FROM 
     Purchases P
JOIN Courses C
	 ON P.Course_id = C.Course_id
GROUP BY 
     C.Course_name,
     C.Category
ORDER BY Total_quantity_sold DESC
LIMIT 3;

-- Q3. Show each course category’s total revenue and the number of unique learners who purchased from that category --

SELECT 
      C.Category,
      ROUND(SUM(P.Quantity * C.Unit_price) , 2) AS Total_revenue,
      COUNT(DISTINCT P.Learner_id) AS Unique_learners
FROM Purchases P
JOIN Courses C
     ON P.Course_id = C.Course_id
GROUP BY 
     C.Category
ORDER BY Total_revenue DESC;

-- Q4. List all learners who have purchased courses from more than one category --

SELECT
	 L.Learner_id,
	 L.Full_name AS Learner_name,
     COUNT(DISTINCT C.CATEGORY) AS Category_count
FROM Courses C
JOIN Purchases P
     ON P.Course_id = C.Course_id
JOIN Learners L
	 ON P.Learner_id = L.Learner_id
GROUP BY
	 L.Learner_id,
	 L.Full_name
HAVING COUNT(DISTINCT C.CATEGORY) > 1;

-- Q5. Identify courses that have not been purchased at all --

SELECT
      C.Course_id,
      C.Course_name,
      C.Category,
      C.Unit_price
FROM Courses C
LEFT JOIN Purchases P
      ON P.Course_id = C.Course_id
WHERE P.Course_id IS NULL;


