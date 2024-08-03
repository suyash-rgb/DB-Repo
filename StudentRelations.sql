CREATE DATABASE StudentRelations;

USE StudentRelations;

-- Table for Student
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    gpa DECIMAL(3, 2),
    clubs VARCHAR(100),
    has_honors BOOLEAN
);

ALTER TABLE Student ADD COLUMN name VARCHAR(101) GENERATED ALWAYS AS (CONCAT(fname, ' ', lname)) STORED;

-- Table for Class
CREATE TABLE Class (
    class_id INT PRIMARY KEY,
    total_participation INT
);

-- Table for Exam
CREATE TABLE Exam (
    exam_id INT PRIMARY KEY
);

-- Associative table for the relationship "Takes"
CREATE TABLE Takes (
    student_id INT,
    class_id INT,
    grade CHAR(1),
    PRIMARY KEY (student_id, class_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- Associative table for the relationship "Has"
CREATE TABLE Has (
    exam_id INT,
    class_id INT,
    PRIMARY KEY (exam_id, class_id),
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- Insert into Student table
INSERT INTO Student (student_id, fname, lname, gpa, clubs, has_honors)
VALUES 
(1, 'John', 'Doe', 3.5, 'Drama Club', TRUE),
(2, 'Jane', 'Smith', 3.8, 'Science Club', FALSE);

-- Insert into Class table
INSERT INTO Class (class_id, total_participation)
VALUES 
(101, 30),
(102, 25);

-- Insert into Exam table
INSERT INTO Exam (exam_id)
VALUES 
(1001),
(1002);

-- Insert into Takes table
INSERT INTO Takes (student_id, class_id, grade)
VALUES 
(1, 101, 'A'),
(2, 102, 'B');

-- Insert into Has table
INSERT INTO Has (exam_id, class_id)
VALUES 
(1001, 101),
(1002, 102);

UPDATE Takes SET grade='B' WHERE student_id = 1;
SELECT * FROM Takes;

INSERT INTO Student (student_id, fname, lname, gpa, clubs, has_honors)
VALUES 
(3, 'Alice', 'Johnson', 3.2, 'Math Club', TRUE),
(4, 'Bob', 'Brown', 2.9, 'Art Club', FALSE),
(5, 'Charlie', 'Davis', 3.1, 'Drama Club', FALSE),
(6, 'Daisy', 'Wilson', 3.6, 'Science Club', TRUE),
(7, 'Ethan', 'Thomas', 2.8, 'Math Club', FALSE),
(8, 'Fiona', 'Moore', 3.4, 'Art Club', TRUE),
(9, 'George', 'Taylor', 3.0, 'Drama Club', FALSE),
(10, 'Hannah', 'Anderson', 3.7, 'Science Club', TRUE);

INSERT INTO Class (class_id, total_participation)
VALUES 
(103, 20),
(104, 35),
(105, 28),
(106, 22),
(107, 27),
(108, 31),
(109, 26),
(110, 29);

INSERT INTO Exam (exam_id)
VALUES 
(1003),
(1004),
(1005),
(1006),
(1007),
(1008),
(1009),
(1010);

INSERT INTO Takes (student_id, class_id, grade)
VALUES 
(3, 103, 'B'),
(4, 104, 'C'),
(5, 105, 'B'),
(6, 106, 'B'),
(7, 107, 'C'),
(8, 108, 'B'),
(9, 109, 'B'),
(10, 110, 'B');

INSERT INTO Has (exam_id, class_id)
VALUES 
(1003, 103),
(1004, 104),
(1005, 105),
(1006, 106),
(1007, 107),
(1008, 108),
(1009, 109),
(1010, 110);


