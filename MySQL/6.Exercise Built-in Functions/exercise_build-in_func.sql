-- 1. Find Names of All Employees by First Name
USE soft_uni;

SELECT first_name,last_name
FROM 
employees
WHERE first_name LIKE 'Sa%'
ORDER BY employee_id;

-- 02. Find Names of All Employees by Last Name
SELECT first_name,last_name
FROM employees
WHERE last_name LIKE '%ei%'
ORDER BY employee_id;

-- 03. Find First Names of All Employess
SELECT first_name 
FROM employees
WHERE department_id IN (3,10) AND
	YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;

-- 04. Find All Employees Except Engineers

SELECT first_name,last_name
FROM employees
WHERE job_title NOT LIKE '%engineer%'
ORDER BY employee_id;

-- 05. Find Towns with Name Length
SELECT name  
FROM towns
WHERE LENGTH(name) IN (5,6)
ORDER BY name ASC;

-- 6. Find Towns Starting With
SELECT town_id,name
FROM towns
WHERE LEFT(name,1) IN ('M','K','B','E')
ORDER BY name;

-- 07. Find Towns Not Starting With
SELECT town_id,name
FROM towns
WHERE LEFT(name,1) NOT IN ('R','B','D')
ORDER BY name asc;

-- 08. Create View Employees Hired After
CREATE VIEW v_employees_hired_after_2000 AS
SELECT first_name,last_name FROM employees
WHERE YEAR(hire_date) > 2000;


SELECT * from v_employees_hired_after_2000;