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

-- 9. Length of Last Name
SELECT first_name,last_name
FROM employees
WHERE LENGTH(last_name) = 5;

-- Part II – Queries for Geography Database

-- 10. Countries Holding 'A' 3 or More Times
SELECT country_name,iso_code
FROM countries
WHERE country_name LIKE '%A%A%A%'
ORDER BY iso_code; 

-- 11. Mix of Peak and River Names
SELECT peak_name, river_name,
LOWER(CONCAT(peak_name, substring(river_name, 2))) AS mix
FROM peaks, rivers
WHERE RIGHT(peak_name, 1) =  LEFT(river_name,1)
ORDER BY mix;

-- Part III – Queries for Diablo Database

-- 12. Games from 2011 and 2012 Year
SELECT name,DATE_FORMAT(start,'%Y-%m-%d') AS start FROM games
WHERE EXTRACT(YEAR FROM start) IN (2011,2012)
ORDER BY start, name
LIMIT 50 ;

-- 13. User Email Providers
SELECT user_name, SUBSTRING(email, LOCATE('@', email) + 1) AS `email provider`
FROM users
ORDER BY `email provider`, user_name;

-- 14. Get Users with IP Address Like Pattern

-- 15. Show All Games with Duration and Part of the Day




