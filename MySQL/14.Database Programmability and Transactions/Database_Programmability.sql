-- Database Programmability and Transactions

-- 1. Count Employees by Town
-- Function that will count all the employees from the differnt towns


-- e.employee_id,e.first_name,t.name

SELECT COUNT(*) AS count
	FROM employees e
    JOIN addresses a ON e.address_id = a.address_id
    JOIN towns t ON a.town_id = t.town_id
WHERE t.name = 'Sofia';



DELIMITER $$
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT 
DETERMINISTIC
BEGIN
		
		RETURN( SELECT COUNT(*) AS count
	FROM employees AS e
    JOIN addresses AS a ON e.address_id = a.address_id
    JOIN towns t ON a.town_id = t.town_id
	WHERE t.name = town_name);

END$$

SELECT ufn_count_employees_by_town('Sofia')$$


-- втори начин 

CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT 
DETERMINISTIC
BEGIN
		DECLARE e_count INT;
		SET e_count := (SELECT COUNT(*) AS count
	FROM employees AS e
    JOIN addresses AS a ON e.address_id = a.address_id
    JOIN towns t ON a.town_id = t.town_id
	WHERE t.name = town_name);
	
    RETURN e_count;
END$$

-- DROP function ufn_count_employees_by_town;

SELECT ufn_count_employees_by_town('Sofia');



DELIMETER $$
CREATE PROCEDURE usp_select_employees()
BEGIN
	SELECT first_name,last_name FROM employees;
END$$

DELIMITER ;

CALL usp_select_employees;


SELECT @@collation_database;

SELECT @asd;
SET @asd = 10;
SELECT @asd;
SET @asd = 'NOW is Text';
SELECt @asd;

SET @emp_count = (SELECT COUNT(*) FROM employees);
SELECT @emp_count;

DELIMITER $$
DROP PROCEDURE IF EXISTS usp_with_out_param;
CREATE PROCEDURE usp_with_param(OUT answer INT)
BEGIN
		SET answer = FLOOR(RAND() * 10);
END$$ 
DELIMITER ;


-- 2. Employees Promotion

SELECT e.first_name,e.salary
	FROM employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE d.name = 'Finance'
ORDER BY e.first_name, e.salary;

UPDATE employees e
SET e.salary = e.salary * 1.05
WHERE e.department_id = (
	SELECT d.department_id FROM departments d WHERE d.name = 'Finance'
);

DELIMITER $$
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(50))
BEGIN
	UPDATE employees e
	SET e.salary = e.salary * 1.05
	WHERE e.department_id = (
		SELECT d.department_id 
        FROM departments d 
        WHERE d.name = department_name
	);
    
    SELECT e.first_name, e.salary
	FROM employees e 
		JOIN departments d ON e.department_id = d.department_id
	WHERE d.name = department_name
	ORDER BY e.first_name, e.salary;
END$$
DELIMITER ;


CALL usp_raise_salaries('Finance');


SELECT * FROM employees WHERE employee_id = 43;

UPDATE employees
SET salary = salary * 1.05
WHERE employee_id = 43;

DELIMITER $$
CREATE PROCEDURE usp_raise_salary_by_id(user_id INT)
BEGIN
	DECLARE e_cnt INT;
    SET e_cnt := (SELECT COUNT(*) FROM employees WHERE employee_id = user_id);
    
    -- e_cnt = 1 => update; e_cnt = 0 => abort
    START TRANSACTION;
	
    UPDATE employees
	SET salary = salary * 1.05
	WHERE employee_id = user_id;
    
    IF (e_cnt = 0) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
END$$
DELIMITER ;

CALL usp_raise_salary_by_id(432112);
