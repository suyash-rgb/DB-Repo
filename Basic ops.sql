USE SQLDemo;

SHOW TABLES;

DESC branch;

CREATE TABLE Student(
student_id INT PRIMARY KEY,
name VARCHAR(20),
major VARCHAR(20)
);

CREATE TABLE crStudent(
name VARCHAR(20),
age INT,
sex CHAR(1),
matric INT PRIMARY KEY,
aggregate int
);

DROP TABLE crStudent;

CREATE TABLE crStudent(
name VARCHAR(20) PRIMARY KEY,
age INT,
sex CHAR(1),
matric INT,
aggregate int
);

INSERT INTO crStudent VALUES ('Abu Bakar', 15, 'M', 9531185, 456),
('Anaya', 16, 'F', 9531186, 340),
('Gurvinder', 14, 'F', 9531187, 480),
('Ali', 16, 'M', 9531188, 260),
('Michelle', 15, 'F', 9531188, 321),
('Zubin', 15, 'M', 9531184, 412),
('Simran', 15, 'F', 9531183, 378),
('Fatimah', 14, 'F', 9531182, 400),
('Anuo', 15, 'M', 9531181, 302),
('Meeta', 16, 'F', 9531180, 150);

SELECT * FROM crStudent;

SELECT name, sex, aggregate/5 AS Percentage FROM crStudent;

CREATE TABLE `pet` (
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

USE SQLDemo;

CREATE TABLE `pet` (
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SHOW TABLES;

DESC pet;

SELECT * FROM pet;

DROP TABLE pet;

CREATE TABLE `pet` (
  `name` varchar(20) PRIMARY KEY NOT NULL ,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO pet(name, owner, species, sex, birth) VALUES ('Fluffy', 'Harold', 'cat', 'f', '1993-02-04');
INSERT INTO pet(name, owner, species, sex, birth) VALUES ('Claws', 'Gwen', 'cat', 'm', '1993-03-17');
INSERT INTO pet(name, owner, species, sex, birth) VALUES ('Buffy', 'Harold', 'dog', 'f', '1989-05-13');
INSERT INTO pet(name, owner, species, sex, birth) VALUES ('Fang', 'Benny', 'dog', 'm', '1990-08-27');
INSERT INTO pet VALUES ('Browser', 'Diane', 'dog', 'm', '1979-08-31', '1995-07-29');
INSERT INTO pet(name, owner, species, sex, birth) VALUES ('Chirpy', 'Gwen', 'bird', 'f', '1998-09-11');
INSERT INTO pet(name, owner, species, birth) VALUES ('Whistler', 'Gwen', 'bird', '1993-03-17');
INSERT INTO pet(name, owner, species, sex, birth) VALUES ('Slim', 'Benny', 'snake', 'm', '1996-04-29');
INSERT INTO pet(name, owner, species, sex, birth) VALUES ('Puffball', 'Diane', 'hamster', 'f', '1999-03-30');

SELECT * FROM pet;

SELECT name, owner FROM pet;

SELECT name, owner, species FROM pet;

SELECT DISTINCT species FROM pet;

SELECT species FROM pet;

SELECT ALL species FROM pet;

-- Handling Nulls
SELECT name, birth, death FROM pet;
SELECT name, birth, IFNULL(death, "alive") FROM pet;

SELECT name, birth, IFNULL(death, "alive") AS "Died on" FROM pet;
