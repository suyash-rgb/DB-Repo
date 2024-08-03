USE SQLdemo;

CREATE TABLE BranchInfo(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(20),
mgr_id INT
);

INSERT INTO BranchInfo VALUES (2, 'Scranton', 101),
(3, 'Stamford', 102), 
(1,'Corporate', 108);

CREATE TABLE Client(
client_id INT PRIMARY KEY,
client_name VARCHAR(100),
branch_id INT,
FOREIGN KEY (branch_id) REFERENCES BranchInfo(branch_id)
);

CREATE TABLE EmployeeInfo(
emp_id INT PRIMARY KEY, 
first_name VARCHAR(20),
last_name VARCHAR(20),
birth_date DATE,
sex CHAR(1),
salary DECIMAL(10,2),
branch_id INT,
super_id INT 
);

INSERT INTO EmployeeInfo(emp_id, first_name, last_name, birth_date, sex, salary, branch_id) VALUES ( 100, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 1);

INSERT INTO EmployeeInfo VALUES ( 101, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 2, 100),
( 102, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 3, 100),
( 103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 2, 101),
( 104, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 3, 101);

CREATE TABLE Works_With ( 
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY (emp_id, client_id),
FOREIGN KEY (emp_id) REFERENCES EmployeeInfo(emp_id),
FOREIGN KEY (client_id) REFERENCES Client(client_id)
);
-- If a table consist of multiple Foreign Keys then their references should be decalred separately

INSERT INTO Works_With VALUES
(107, 400, 55000),
(101, 401, 267000),
(105, 402, 22500),
(104, 403, 5000),
(105, 403, 12000),
(107, 404, 33000);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sqldemo`.`works_with`, CONSTRAINT `works_with_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employeeinfo` (`emp_id`))	0.015 sec
-- The error you're encountering is because you're trying to insert records into the Works_With table that reference emp_id values which do not exist in the EmployeeInfo table

INSERT INTO Works_With VALUES
    (101, 401, 267000),
    (104, 403, 5000),
    (104, 404, 12000);
    
SELECT (WW.total_sales) AS total_sales_lackawanna
FROM Works_With WW
WHERE WW.client_id IN (
    SELECT client_id
    FROM Client
    WHERE client_name = 'Lackawana County' -- replace 'Client A' with the actual client name
);

-- If you wish to enter records into the Works_With table with emp_id and client_id values that do not exist in the EmployeeInfo and Client tables, you'll need to temporarily disable the foreign key constraints, perform the inserts, and then re-enable the constraints.
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Insert records into Works_With
INSERT INTO Works_With (emp_id, client_id, total_sales) VALUES
(107, 400, 55000),
(105, 402, 22500),
(107, 404, 33000);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM Works_With;

UPDATE Works_With SET client_id=403 WHERE total_sales=12000;
