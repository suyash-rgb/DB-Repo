USE SQLDemo;

SELECT name, aggregate FROM crStudent WHERE aggregate>350;

SELECT name, age, aggregate FROM crStudent WHERE age>=16;

SELECT * FROM pet WHERE (species = 'cat' || species = 'dog') && sex = 'm';

SELECT * FROM crStudent;
SELECT name, age, aggregate FROM crStudent WHERE aggregate BETWEEN 300 AND 500;
SELECT name, aggregate FROM crStudent WHERE aggregate BETWEEN 380 AND 425;
SELECT name, aggregate FROM crStudent WHERE aggregate NOT BETWEEN 380 AND 425;

SELECT * FROM pet WHERE species IN('bird', 'snake', 'hamster');
