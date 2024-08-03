CREATE DATABASE Company;

USE Company;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    sex CHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

CREATE TABLE branch(
branch_id INT PRIMARY KEY, 
branch_name VARCHAR(40),
mgr_id INT, 
mgr_start_date DATE,
FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE Employee ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;

ALTER TABLE Employee ADD FOREIGN KEY(super_id) REFERENCES Employee(emp_id) ON DELETE SET NULL;

CREATE TABLE client(
client_id INT PRIMARY KEY,
client_name VARcHAR(40),
branch_id INT,
FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE Works_With(
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY(emp_id, client_id),
FOREIGN KEY(emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier( 
branch_id INT, 
supplier_name VARCHAR(40),
supply_type VARCHAR(40),
PRIMARY KEY(branch_id, supplier_name),
FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- Populate all the tables
INSERT INTO Employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE Employee 
SET branch_id = 1
WHERE emp_id=100;

INSERT INTO Employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

INSERT INTO Employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, NULL, NULL);

INSERT INTO branch VALUES(2, 'Scanton', 102, '1992-04-06');

UPDATE Employee 
SET branch_id = 2
WHERE emp_id=102;	

INSERT INTO Employee VALUES
(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000.00, 102, 2),
(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000.00, 102, 2),
(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000.00, 102, 2);

INSERT INTO Employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, NULL, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE Employee 
SET branch_id = 3
WHERE emp_id=106;

-- Insert records into the Employee table for emp_id 107 and 108
INSERT INTO Employee VALUES
(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000.00, 106, 3),
(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000.00, 106, 3);

UPDATE Employee 
SET super_id = 100
WHERE emp_id=102 OR emp_id=106;

SELECT * FROM Employee;

INSERT INTO Branch_Supplier VALUES
(2, 'Hammer Mill', 'Paper'),
(2, 'Uni-ball', 'Writing Utensils'),
(3, 'Patriot Paper', 'Paper'),
(2, 'J.T. Forms & Labels', 'Custom Forms'),
(3, 'Uni-ball', 'Writing Utensils'),
(3, 'Hammer Mill', 'Paper'),
(3, 'Stamford Lables', 'Custom Forms');

INSERT INTO client VALUES
(400, 'Dunmore Highschool', 2),
(401, 'Lackawana Country', 2),
(402, 'FedEx', 3),
(403, 'John Daly Law, LLC', 3),
(404, 'Scranton Whitepages', 2),
(405, 'Times Newspaper', 3),
(406, 'FedEx', 2);

INSERT INTO Works_With VALUES
(105, 400, 55000),
(102, 401, 267000),
(108, 402, 22500),
(107, 403, 5000),
(108, 403, 12000),
(105, 404, 33000),
(107, 405, 26000),
(102, 406, 15000),
(105, 406, 130000);

SELECT * FROM Employee;
SELECT * FROM branch;
SELECT * FROM client;
SELECT * FROM Works_With;

SELECT * FROM Employee ORDER BY salary;
SELECT * FROM Employee ORDER BY salary DESC;

SELECT * FROM Employee ORDER BY sex, first_name, last_name;

UPDATE Employee SET first_name='Jenny' WHERE emp_id=101;
SELECT * FROM Employee;
-- First 5
SELECT * FROM Employee LIMIT 5;

SELECT first_name, last_name FROM Employee;

SELECT first_name AS 'Forename', last_name AS 'Surname' FROM Employee;

SELECT DISTINCT sex FROM Employee;
SELECT DISTINCT branch_id FROM Employee;

-- Functions
SELECT COUNT(emp_id) FROM Employee;
SELECT COUNT(super_id) FROM Employee;

-- Find the number of female employees born after 1970
SELECT COUNT(emp_id)
FROM Employee
WHERE sex='F' AND birth_date > 1970-01-01;

-- Find the average of all employee salaries
SELECT AVG(salary) FROM Employee;
-- Find the average of all salaries of male employees
SELECT AVG(salary) FROM Employee WHERE sex='M';
-- Find the sum of all employee salary
SELECT SUM(salary) FROM Employee;

USE Company;
-- Aggregation Function 
SELECT COUNT(sex), sex FROM Employee GROUP BY sex;

-- Find the total sales of each employee
SELECT SUM(total_sales), emp_id FROM Works_With GROUP BY emp_id;

-- Find the total sales to each client
SELECT SUM(total_sales), client_id FROM Works_With GROUP BY client_id;

-- Find any client's who are in LLC
SELECT * FROM client WHERE client_name LIKE '%LLC';

-- Find any branch suppliers that are in the label business
SELECT * FROM branch_supplier WHERE supplier_name LIKE '%Labels';

UPDATE branch_supplier SET supplier_name = 'Stamford Labels' WHERE branch_id = 3 AND supply_type = 'Custom Forms';
SELECT * FROM branch_supplier;

SELECT * FROM branch_supplier WHERE supplier_name LIKE '%Labels';
-- For more accurate results 
SELECT * FROM branch_supplier WHERE supplier_name LIKE '% Labels%';

-- Find an employee born in October
SELECT * FROM Employee WHERE birth_date LIKE '____-10%';
-- Find an employee born in February
SELECT * FROM Employee WHERE birth_date LIKE '____-02%';
-- Find the client name who are schools
SELECT * FROM client WHERE client_name LIKE '%school%';

-- Union
-- Find a list of employees and branch names
SELECT first_name FROM Employee
UNION
SELECT branch_name FROM branch;
-- For UNIONs to work both the queries should be returning the same number of columns
SELECT first_name FROM Employee
UNION
SELECT branch_name FROM branch
UNION 
SELECT client_name FROM client;

-- Find a list of all clients and branch_suppliers
SELECT client_name FROM client 
UNION
SELECT supplier_name FROM branch_supplier;

SELECT client_name, branch_id FROM client 
UNION 
SELECT supplier_name, branch_id FROM branch_supplier;
-- Alternatively
SELECT client_name, client.branch_id FROM client 
UNION
SELECT supplier_name, branch_supplier.branch_id FROM branch_supplier;

-- Find a list of all the money spent or earned by the company
SELECT salary FROM Employee
UNION 
SELECT total_sales FROM Works_With;

INSERT INTO branch VALUES (4, 'Buffalo', NULL, NULL );
SELECT * FROM branch;

-- Joins 
-- Find all branches and the names of their managers
SELECT Employee.emp_id, Employee.first_name, branch.branch_name
FROM Employee 
JOIN branch
ON Employee.emp_id = branch.mgr_id;

SELECT Employee.emp_id, Employee.first_name, branch.branch_name
FROM Employee
LEFT JOIN branch
ON Employee.emp_id = branch.mgr_id;

SELECT Employee.emp_id, Employee.first_name, branch.branch_name
FROM Employee
RIGHT JOIN branch
ON Employee.emp_id = branch.mgr_id;

-- Nested Queries
-- Find names of all employees who have sold over 30,000 to a single client
SELECT Employee.first_name, Employee.last_name 
FROM Employee 
WHERE Employee.emp_id IN(
	 SELECT Works_With.emp_id 
     FROM Works_With 
     WHERE Works_With.total_sales > 30000
);

-- Find all clients who are handled by the branch that Michael Scott manages Assuming that you know Michael Scott's id
SELECT client.client_name 
FROM client
WHERE client.branch_id = (
 SELECT branch.branch_id 
 FROM branch
 WHERE branch.mgr_id=102
);
-- Its not necessary that a nested query would return a single result so: 
SELECT client.client_name 
FROM client
WHERE client.branch_id = (
 SELECT branch.branch_id 
 FROM branch
 WHERE branch.mgr_id=102 
 LIMIT 1
);

-- ON DELETE
-- For branch table we have set ON DELETE SET NULL
DELETE FROM Employee
WHERE emp_id = 102;
-- The above query will also result in mgr_id set to NULL in branch table
SELECT * FROM branch;

-- Find the Supervisor of Jim Halpert (emp_id=108)
SELECT first_name, last_name 
FROM Employee 
WHERE emp_id
IN (
    SELECT super_id 
    FROM Employee 
    WHERE emp_id=108
);

-- List all the Employees and their Supervisors
-- Concatenate two columns
SELECT CONCAT(first_name, ' ', last_name) AS Employee_name
FROM Employee;

SELECT CONCAT(first_name, ' ', last_name) 
AS Employee_name 
FROM Employee 
WHERE emp_id 
IN (
    SELECT super_id FROM Employee
);

-- Correct below (Using self-join)
SELECT 
    e.emp_id AS Employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS Employee_name,
    s.emp_id AS Supervisor_id,
    CONCAT(s.first_name, ' ', s.last_name) AS Supervisor_name
FROM 
    Employee e
LEFT JOIN 
    Employee s ON e.super_id = s.emp_id;

-- Using Nested Query and Left Join
SELECT 
    e.emp_id AS Employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS Employee_name,
    s.supervisor_id,
    s.supervisor_name
FROM 
    Employee e
LEFT JOIN 
    (
        SELECT 
            emp_id AS Supervisor_id,
            CONCAT(first_name, ' ', last_name) AS Supervisor_name
        FROM 
            Employee
    ) s ON e.super_id = s.supervisor_id;
    
-- Using Nested Query (without using JOIN)
SELECT 
    e.emp_id AS Employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS Employee_name,
    e.super_id AS Supervisor_id,
    (SELECT 
         CONCAT(s.first_name, ' ', s.last_name)
     FROM 
         Employee s
     WHERE 
         s.emp_id = e.super_id
    ) AS Supervisor_name
FROM 
    Employee e;
    
-- Triggers
CREATE TABLE trigger_test(
       message VARCHAR(100)
);
-- The default DELIMITER in SQL is ; but using the DELIMITER keyword we can change this
DELIMITER $$ 
CREATE 
     TRIGGER my_trigger BEFORE INSERT 
     ON Employee
     FOR EACH ROW BEGIN
		 INSERT INTO trigger_test VALUES('added new employee');
     END$$ 
-- we change the DELIMITER back to ;
DELIMITER ; 

INSERT INTO Employee 
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

SELECT * FROM trigger_test;

 DELIMITER $$ 
CREATE 
     TRIGGER my_trigger1 BEFORE INSERT 
     ON Employee
     FOR EACH ROW BEGIN
		 INSERT INTO trigger_test VALUES(NEW.first_name);
     END$$ 
-- we change the DELIMITER back to ;
DELIMITER ; 

INSERT INTO Employee
VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

SELECT * FROM trigger_test;

DELIMITER $$ 
CREATE 
     TRIGGER my_trigger2 BEFORE INSERT 
     ON Employee
     FOR EACH ROW BEGIN
      IF NEW.sex = 'M' THEN 
		 INSERT INTO trigger_test VALUES('added male employee');
	  ELSEIF NEW.sex = 'F' THEN 
		 INSERT INTO trigger_test VALUES('added female employee');
	  ELSE
	     INSERT INTO trigger_test VALUES('added other employee');
	  END IF;
     END$$ 
-- we change the DELIMITER back to ;
DELIMITER ; 

INSERT INTO Employee
VALUES(111, 'Pam', 'Beesly', '1992-02-19', 'F', 69000, 106, 3);

SELECT * FROM trigger_test;

DELIMITER $$ 
CREATE 
     TRIGGER my_trigger3 AFTER DELETE 
     ON Employee
     FOR EACH ROW BEGIN
		 INSERT INTO trigger_test VALUES('fired male employee');
     END$$ 
-- we change the DELIMITER back to ;
DELIMITER ; 

DELETE FROM Employee WHERE emp_id=111;
-- INSERT INTO Employee VALUES(111, 'Pam', 'Beesly', '1992-02-19', 'F', 69000, 106, 3);
SELECT * FROM trigger_test;

-- To delete a trigger
DROP TRIGGER my_trigger;