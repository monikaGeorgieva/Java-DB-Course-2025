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


