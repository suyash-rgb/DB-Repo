USE SQLDemo;

SHOW TABLES;

DESCRIBE student;
ALTER TABLE student ADD gpa DECIMAL(3,2);
DESCRIBE student;
ALTER TABLE student DROP COLUMN gpa;
DESCRIBE student;

INSERT INTO student VALUES (1, 'Jack', 'Biology'),
(2, 'Kate', 'Sociology'),
(3, 'Claire', 'English'),
(4, 'Jack', 'Biology'),
(5, 'Mike', 'Computer Science');

SELECT * FROM student;

DROP TABLE student;

CREATE TABLE student(
student_id INT PRIMARY KEY,
name VARCHAR(20),
major VARCHAR(30) DEFAULT 'undecided'
);

INSERT INTO student VALUES (1, 'Jack', 'Biology'),
(2, 'Kate', 'Sociology'),
(3, 'Claire', 'English'),
(4, 'Jack', 'Biology'),
(5, 'Mike', 'Computer Science');

SELECT * FROM student;

INSERT INTO student(student_id, name) VALUES (7, 'Jack');
SELECT * FROM student;

DROP TABLE student;
CREATE TABLE student(
student_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20),
major VARCHAR(30) DEFAULT 'undecided'
);

INSERT INTO student(name, major) VALUES ('Jack', 'Biology');
INSERT INTO student(name, major) VALUES
('Kate', 'Sociology'),
('Claire', 'English'),
('Jack', 'Biology'),
('Mike', 'Computer Science');

SELECT * FROM student;
-- column count mismatch will cause an error so even if a column is auto incremented you need to specify for which columns the data is being inserted
INSERT INTO student(name, major) VALUES
('Kade', 'Sociology'),
('Claire', 'English'),
('Jackson', 'Biology'),
('Mikhael', 'Computer Science');

UPDATE student SET major='Biotechnology' WHERE major='Biology';

SELECT Student.name, Student.major FROM Student ORDER BY student_id DESC;

SELECT Student.student_id, Student.name, Student.major FROM Student ORDER BY student_id DESC;

SELECT * FROM Student ORDER BY student_id ASC;

-- ORDER BY on the basis of major and if there are multiple records with the same major ORDER BY on the basis of student_id
SELECT * FROM Student ORDER BY major, student_id ;
-- ORDER BY on the basis of descending order of major and if there are multiple records with the same major ORDER BY on the basis of descending order of major student_id
SELECT * FROM Student ORDER BY major, student_id DESC ;

-- To limit the results from the database i.e., to limit the records shown as output of the Query one can use LIMIT
SELECT * 
FROM Student 
ORDER BY major, student_id DESC 
LIMIT 2;

UPDATE Student SET major='Chemistry' WHERE student_id=4;

SELECT * FROM Student;

SELECT name, major FROM Student WHERE major= 'Chemistry' OR major = 'Biology';

SELECT name, major FROM Student WHERE major= 'Chemistry' OR name = 'Kate';
SELECT name, major FROM Student WHERE student_id <=3;

-- One can use <> for applying 'not equal to' condition 
SELECT * FROM Student WHERE student_id <=3 AND name <> 'Jack';
-- IN('','','',......n) allows to retrieve records on the basis of an attribute from the group of provided values
SELECT * FROM Student WHERE name IN ('Claire','Kate','Jackson');



