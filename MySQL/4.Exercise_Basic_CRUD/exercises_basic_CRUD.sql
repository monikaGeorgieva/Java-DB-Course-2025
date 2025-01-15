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

-- 8.Find Names of all employees by salary range
SELECT first_name,last_name,job_title
FROM employees
WHERE salary >= 20000 && salary <= 30000;

-- 9.Find Names of ALL employees whose salary is 25000,140000 or 236000
SELECT 
concat_ws(' ',first_name,middle_name,last_name) AS 'Full Name'
FROM employees
WHERE salary IN (25000,1400,12500);

-- 10.Find all Employees Without Manager
SELECT first_name,last_name, salary FROM employees
WHERE salary > 50000
ORDER BY salary DESC;

-- 11.Find all Employees without Manager
SELECT first_name,last_name from employees
WHERE manager_id is NULL;

-- 12.Find best 5 paid employees
SELECT first_name,last_name 
from employees 
ORDER BY salary DESC
LIMIT 5;

-- 13.Find all employees Except Marketing
SELECT first_name,last_name
FROM employees
where job_title != 'Marketing';

-- 14.Sort Employees Table
SELECT
employee_id AS id,
first_name as `First Name`,
last_name AS 'Last Name',
middle_name AS 'Middle Name',
job_title AS 'Job Title',
department_id AS 'Dept ID',
manager_id AS 'Mngr ID',
hire_date AS 'Hire Date',
salary, address_id FROM employees
ORDER BY salary DESC,first_name,last_name DESC,middle_name; 

-- 15.Create View Employees with Salaries 
CREATE VIEW v_employees_salaries AS
SELECT first_name,last_name,salary
from employees;

SELECT * from v_employees_salaries;

-- 16. Create VIEW employees with job title
CREATE or replace VIEW v_employees_job_title AS
SELECT concat_ws(' ',first_name,middle_name,last_name) AS 'full name',
job_title
FROM employees;

select * FROM v_employees_job_title;

-- 17.Disting Job Titles
SELECT distinct job_title
from employees 
ORDER BY job_title;

-- 18.Find first 10 started Projects
SELECT * from projects
ORDER BY start_date, name
LIMIT 10;

-- 19.Last 7 hires Employees
SELECT first_name, last_name,hire_date FROM employees
ORDER BY hire_date DESC
limit 7;

-- 20. Increase Salaries
UPDATE employees
SET salary = salary * 1.12
WHERE department_id IN (1,2,4,11);

SELECT salary FROM employees;

-- 21.All mountain Peaks
SELECT peak_name 
FROM peaks
ORDER BY peak_name;

-- 22.Biggest Countries by population
SELECT country_name,population
from countries
WHERE continent_code = 'EU'
ORDER BY population desc,country_name
limit 30;






 
 



