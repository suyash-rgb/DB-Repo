CREATE database SQLDemo;

USE SQLdemo;

CREATE TABLE Employee( 
emp_id INT PRIMARY KEY, 
first_name VARCHAR(20),
last_name VARCHAR(20),
birth_date DATE,
sex CHAR(1),
salary DECIMAL(10,2),
branch_id INT,
super_id INT
);

INSERT INTO Employee(emp_id, first_name, last_name, birth_date, sex, salary, branch_id) VALUES ( 100, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 1);

INSERT INTO Employee VALUES ( 101, 'Michael', 'Scott', '1964-03-15', 'F', 75000, 2, 100);

UPDATE Employee SET sex ='M' WHERE emp_id=101;

INSERT INTO Employee VALUES ( 102, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 3, 100),
( 103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 2, 101),
( 104, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 3, 101);

CREATE TABLE Branch(
branch_id INT PRIMARY KEY, 
branch_name VARCHAR(50),
mgr_id INT
);

-- Adding foreign key to an existing Employee Table
ALTER TABLE Employee ADD CONSTRAINT fk_branch FOREIGN KEY (branch_id) REFERENCES Branch(branch_id);
-- 0	13	23:34:23	ALTER TABLE Employee ADD CONSTRAINT fk_branch FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sqldemo`.`#sql-1c60_a`, CONSTRAINT `fk_branch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`))	0.047 sec
-- FAILED

-- Dropping Employee TABLE and then Recreating it using Foreign Key as branch_id
DROP TABLE Employee;

CREATE TABLE Employee( 
emp_id INT PRIMARY KEY, 
first_name VARCHAR(20),
last_name VARCHAR(20),
birth_date DATE,
sex CHAR(1),
salary DECIMAL(10,2),
branch_id INT,
super_id INT, 
FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Entering the Records again
INSERT INTO Employee(emp_id, first_name, last_name, birth_date, sex, salary, branch_id) VALUES ( 100, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 1);
-- 0	16	23:39:32	INSERT INTO Employee(emp_id, first_name, last_name, birth_date, sex, salary, branch_id) VALUES ( 100, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 1)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sqldemo`.`employee`, CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`))	0.016 sec
-- Before running this query we need to ensure that there is a corresponding record in Branch table with branch_id. 
-- The table containing the foreign key as a primary key is the parent and the table containgin the foreign key as an attribute is the child.

INSERT INTO Branch (branch_id, branch_name, mgr_id) VALUES (2, 'Scranton', 101);
INSERT INTO Branch VALUES (3, 'Stamford', 102), (1,'Corporate', 108);
INSERT INTO Employee(emp_id, first_name, last_name, birth_date, sex, salary, branch_id) VALUES ( 100, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 1);

-- Add all records again
INSERT INTO Employee VALUES ( 101, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 2, 100),
( 102, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 3, 100),
( 103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 2, 101),
( 104, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 3, 101);

SELECT * FROM Employee;

UPDATE Employee SET first_name='Jenny' WHERE emp_id=100;

CREATE TABLE Branch_Supplier(
branch_id INT, 
supplier_name VARCHAR(100), 
supply_type VARCHAR(50), 
PRIMARY KEY (branch_id, supplier_name),
FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

INSERT INTO Branch_Supplier VALUES (1,'ABC Supplies', 'Office Supplies');

INSERT INTO Branch_Supplier VALUES (2,'Hammer Mill', 'Paper'),
(2,'Uni-Ball', 'Writing Utensils'),
(3,'Patriot Paper', 'Paper'),
(2,'J.T. Forms & Labels', 'Custom Forms'),
(3,'Uni-Ball', 'Writing Utensils'),
(3,'Hammer Mill', 'Paper'),
(3,'Stamford Labels', 'Custom Forms');


