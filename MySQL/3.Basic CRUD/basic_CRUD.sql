USE HOTEL;
SELECT * FROM clients;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM rooms;

SELECT id,first_name,last_name,job_title
FROM employees
ORDER BY id;

SELECT id AS '#',
 first_name AS 'First Name',
 last_name AS 'Last Name',
 job_title as 'Title'
FROM employees;

SELECT 
	id,
    CONCAT(first_name,' ',last_name) AS 'Full name'
    FROM employees;
    
SELECT 
 id,
  CONCAT_WS("-", first_name, last_name, salary)
 from employees;
 
 SELECT 
	id,
    CONCAT(first_name,' ',last_name) AS 'full_name',
    salary
FROM employees
WHERE salary > 1000
ORDER BY id;

SELECT last_name,department_id
from employees
WHERE department_id = 1;

SELECT * FROM 
employees
where salary > 1000 and department_id = 4;

SELECT * FROM 
employees
WHERE department_id = 3 and department_id = 4;

SELECT * FROM 
employees
WHERE department_id = 3 or department_id = 4;

SELECT * FROM 
employees
WHERE salary > 1000 and salary < 2000;

SELECT * FROM 
employees
WHERE salary > 1000 or salary < 2000;

UPDATE employees
set last_name = 'Brown'
where department_id = 1;


SELECT * FROM employees;

SELECT id,salary * 1.10
FROM employees
where department_id = 3;
