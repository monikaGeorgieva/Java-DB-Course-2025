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