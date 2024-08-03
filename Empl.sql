CREATE DATABASE SQLDemo;

USE SQLDemo;

CREATE TABLE Empl (
    empno INT PRIMARY KEY,
    ename VARCHAR(50) NOT NULL,
    job VARCHAR(50),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(10, 2),
    comm DECIMAL(10, 2),
    deptno INT
);

INSERT INTO Empl (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(8369, 'SMITH', 'CLERK', 8902, '1990-12-18', 800.00, NULL, 20),
(8499, 'ANYA', 'SALESMAN', 8698, '1991-02-20', 1600.00, 300.00, 30),
(8521, 'SETH', 'SALESMAN', 8698, '1991-02-22', 1250.00, 500.00, 30),
(8566, 'MAHADEVAN', 'MANAGER', 8839, '1991-04-02', 2985.00, NULL, 20),
(8654, 'MOMIN', 'SALESMAN', 8698, '1991-09-28', 1250.00, 1400.00, 30),
(8698, 'BINA', 'MANAGER', 8839, '1991-05-01', 2850.00, NULL, 30),
(8882, 'SHIAVNSH', 'MANAGER', 8839, '1991-06-01', 2450.00, NULL, 10),
(8888, 'SCOTT', 'ANALYST', 8566, '1992-12-09', 3000.00, NULL, 20),
(8839, 'AMIR', 'PRESIDENT', NULL, '1991-11-18', 5000.00, NULL, 10),
(8844, 'KULDEEP', 'SALESMAN', 8698, '1991-09-08', 1500.00, 0.00, 30),
(8886, 'ANOOP', 'CLERK', 8888, '1993-01-12', 1100.00, NULL, 20),
(8900, 'JATIN', 'CLERK', 8698, '1991-12-03', 950.00, NULL, 30),
(8902, 'FAKIR', 'ANALYST', 8566, '1991-12-03', 3000.00, NULL, 20),
(8934, 'MITA', 'CLERK', 8882, '1992-01-23', 1300.00, NULL, 10);

SELECT * FROM Empl;

SELECT empno, ename FROM Empl;

SELECT * FROM Empl;
SELECT ename, sal, sal+comm FROM Empl;
-- The NULL values added to the sal results in NULL 
-- To resolve this
-- Appraoch 1: IFNULL() function
SELECT ename, sal, sal+ IFNULL(comm, 0) AS 'sal+comm' FROM Empl;
-- Approach 2: COALESCE() function
SELECT ename, sal, sal + COALESCE(comm, 0) AS total_compensation
FROM Empl;

SELECT ename, sal, deptno FROM Empl WHERE comm IS NULL;

SELECT empno, ename, sal, sal*12 AS 'Annual Salary' FROM Empl WHERE comm IS NOT NULL;

SELECT DISTINCT deptno FROM Empl;

SELECT * FROM Empl WHERE job='CLERK' AND deptno IS NULL;

SELECT * FROM Empl WHERE ename LIKE '----';

SELECT * FROM Empl WHERE sal*12 BETWEEN 25000 AND 40000;

SELECT DISTINCT job FROM Empl;

SELECT * FROM Empl WHERE comm>sal;

SELECT ename, job, sal FROM Empl WHERE mgr IS NULL;
-- Write a query to display the name of employee whose name contains 'A' as the third alphabet
SELECT ename FROM Empl WHERE ename LIKE '__A%';
-- Write a query to display the name of employee whose name contains 'T' as the last alphabet
SELECT ename FROM Empl WHERE ename LIKE '%T';
-- Write a query to display the name of employee who is having 'L' as any alphabet of the name
SELECT ename FROM Empl WHERE ename LIKE '%L%'

