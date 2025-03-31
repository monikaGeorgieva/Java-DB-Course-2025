-- пример за JOIN  на повече от една таблица

SELECT e.first_name,t.name as 'town_name',a.address_id
FROM employees e
JOIN  addresses a
	on e.address_id = a.address_id
JOIN towns t 
	on a.town_id = t.town_id;
    
    
-- 1. Employee Address
SELECT e.employee_id,
		e.job_title,
        e.address_id,
        a.address_text
FROM employees e
JOIN addresses a
	on e.address_id = a.address_id
    ORDER BY a.address_id asc 
    LIMIT 5;
        
-- 2. Addresses with Towns

SELECT e.first_name,
		e.last_name,
        t.name,
        a.address_text
FROM employees e
JOIN addresses a
	on e.address_id = a.address_id
JOIN towns t
	on a.town_id = t.town_id
		ORDER BY e.first_name asc,last_name
        LIMIT 5 ;
        
-- 03. Sales Employee
	SELECT e.employee_id,
			e.first_name,
            e.last_name,
            d.name as 'department_name'
	FROM employees e
    JOIN departments d
    ON e.department_id = d.department_id
    WHERE d.name = 'Sales'
    ORDER BY e.employee_id desc;
   

-- 4. Employee Departments

SELECT e.employee_id,
		e.first_name,
        e.salary,
        d.name as 'department_name'
FROM employees e
JOIN departments d
	on e.department_id = d.department_id
 WHERE salary > 15000 
 ORDER BY d.department_id DESC
 LIMIT 5;
 
 -- 05. Employees Without Project
 
 SELECT  e.employee_id,
		e.first_name
from employees e
LEFT JOIN employees_projects ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id IS null
ORDER BY employee_id DESC
LIMIT 3; 

 
 -- 06. Employees Hired After
 SELECT e.first_name,
		e.last_name,
        e.hire_date,
        d.name as 'dept_name'
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.name = ('Finance') or d.name = ('Sales')
ORDER BY hire_date ASC;  

-- 7. Employees with Project  

SELECT e.employee_id,
		e.first_name,
        p.name as 'project_name'
from employees e
JOIN employees_projects 
	ON e.employee_id =  employees_projects.employee_id
JOIN projects p
	ON employees_projects.project_id = p.project_id
WHERE p.start_date >= '2002-08-14' AND p.end_date is null
ORDER BY first_name asc,p.name asc
LIMIT 5;
        
-- 08. Employee 24

	SELECT 	e.employee_id,
			e.first_name,
	IF(YEAR(p.start_date) >= 2005, NULL, p.name) as project_name
    FROM employees e 
	JOIN employees_projects ep
    ON  e.employee_id = ep.employee_id
    JOIN projects p 
    ON ep.project_id = p.project_id
    WHERE e.employee_id = 24
    ORDER BY project_name;
    
-- 09. Employee Manager
SELECT e.employee_id,
		e.first_name,
        e.manager_id,
        m.first_name as manager_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.manager_id IN (3,7)
order by e.first_name;

-- 10. Employee Summary

SELECT e.employee_id, CONCAT(e.first_name , ' ', e.last_name) as employee_name,
		CONCAT(m.first_name, ' ', m.last_name) as manager_name,
        d.name as department_name
        FROM employees e
	JOIN employees m
    ON e.manager_id = m.employee_id
	JOIN departments d 
    ON e.department_id = d.department_id
    ORDER BY e.employee_id 
    LIMIT 5;
    
-- 11. Min Average Salary
	SELECT AVG(salary) as min_average_salary
    FROM employees
   group by department_id
   ORDER BY min_average_salary
   LIMIT 1;
   
-- 12. Highest Peaks in Bulgaria

SELECT  c.country_code,
		m.mountain_range,
        p.peak_name,
        p.elevation
	FROM countries c 
    JOIN mountains_countries mc
    ON c.country_code = mc.country_code
    JOIN mountains m 
    ON mc.mountain_id = m.id
    JOIN peaks p
    ON m.id = p.mountain_id
    WHERE c.country_code = 'BG' and p.elevation > 2835
    ORDER BY p.elevation desc;
	
    
-- 13. Count Mountain Ranges
	SELECT c.country_code,
			count(*) as mountain_range
		FROM countries c
        JOIN mountains_countries mc
        ON  mc.country_code = c.country_code
        WHERE c.country_code IN ('BG','US','RU')
        group by c.country_code
        ORDER BY mountain_range DESC; 
        
-- 14. Countries with Rivers
	SELECT c.country_name,
			r.river_name
		FROM countries c
		LEFT JOIN countries_rivers cr 
        ON cr.country_code = c.country_code
        LEFT JOIN rivers r
        ON r.id = cr.river_id
        WHERE c.continent_code = 'AF'
        ORDER BY c.country_name
        LIMIT 5;
	
        
        
    