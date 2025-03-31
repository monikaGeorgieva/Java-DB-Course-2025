USE soft_uni;

SELECT e.first_name,
        d.name
FROM employees e
INNER JOIN departments as  d
ON e.manager_id = d.manager_id;

SELECT 
		e.employee_id,
        e.first_name,
        e.last_name,
        a.address_id,
        a.address_text
FROM employees e
INNER JOIN addresses AS  a
	ON e.address_id = a.address_id;
    
-- 1.Managers 
	SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS 'full_name',
    d.department_id,
    d.name
FROM employees AS e
    RIGHT JOIN departments d 
    ON d.manager_id = e.employee_id
    ORDER BY e.employee_id
	LIMIT 5;
    
    
-- вложена заявка 
SELECT * FROM  employees
WHERE manager_id IN ( 
	SELECT employee_id FROM employees
	WHERE first_name LIKE 'z%'
    );
    
-- 4.Higher Salary 

SELECT COUNT(*) AS 'count'
FROM employees
WHERE salary > (
	SELECT AVG(salary) FROM employees
);

-- 2. Towns Addresses

SELECT  a.town_id,
		t.name,
		a.address_text
FROM addresses as a
inner JOIN towns as t
	ON  a.town_id = t.town_id
WHERE t.town_id IN (9,15,32)
ORDER BY town_id,address_id;


-- втори начин 
SELECT  a.town_id,
		t.name,
		a.address_text
FROM addresses as a
inner JOIN towns as t
	ON  a.town_id = t.town_id
WHERE t.name IN ('San Francisco' , 'Carnation' ,'Sofia')
ORDER BY town_id,address_id;

-- 3. Employees Without Managers

SELECT e.employee_id,
		e.first_name,
        e.last_name,
        e.department_id,
        e.salary
FROM  employees as e
WHERE manager_id  is null;

