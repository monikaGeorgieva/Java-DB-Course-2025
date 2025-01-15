USE soft_uni;

SELECT * FROM addresses;
SELECT * from departments;
SELECT * from projects;

-- 1. Find all information abouth Departments
SELECT * FROM departments
ORDER BY department_id;

-- 2. Find all Departments Names
SELECT name FROM 
departments;

-- 3.Find salary of Each Employee
SELECT `first_name`,`last_name`,`salary`
 FROM employees
 ORDER BY employee_id;
 
 -- 4 Find full name of each employee
 SELECT `first_name`,`middle_name`,`last_name`
 FROM employees
 ORDER BY employee_id;
 
 -- 5 Find email Adress of Each Employee
 
SELECT CONCAT(first_name, '.' ,last_name, '@softuni.bg') AS 'full_email_adress'
from employees;

-- 6.Find all the diffenrent employees salaries
SELECT DISTINCT salary 
FROM employees;

-- 7. Find all Information abouth Employees

SELECT
employee_id AS id,
first_name as `First Name`,
last_name AS 'Last Name',
middle_name AS 'Middle Name',
job_title AS 'Job Title',
department_id AS 'Dept ID',
manager_id AS 'Mngr ID',
hire_date AS 'Hire Date',
salary,
address_id 
FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY id;




 
 
 
 



