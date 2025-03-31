-- Exercise: Functions and Procedures


--  01. Employees with Salary Above 35000
 SELECT e.first_name,e.last_name,e.salary
 FROM employees e
 WHERE e.salary >35000
 ORDER BY first_name,last_name asc;

DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
	BEGIN
		SELECT e.first_name,e.last_name
FROM employees e
WHERE e.salary > 35000
ORDER BY first_name,last_name asc;	
    END$$
DELIMITER ;

CALL usp_get_employees_salary_above_35000();

-- 02. Employees with Salary Above Number

 SELECT e.first_name,e.last_name,e.salary
 FROM employees e
 WHERE e.salary >= 45000
 ORDER BY first_name,last_name asc;
 
DELIMITER $$  
CREATE PROCEDURE usp_get_employees_salary_above(IN min_salary DECIMAL(10,4))
BEGIN
    SELECT e.first_name, e.last_name
    FROM employees e
    WHERE e.salary >= min_salary
     ORDER BY first_name,last_name asc;
END $$  
DELIMITER ;

CALL usp_get_employees_salary_above(45000);

DROP procedure usp_get_employees_salary_above;

-- 3. Town Names Starting With

SELECT distinct t.name  as town_name
	FROM 	employees e 
    JOIN addresses a
    ON e.address_id = a.address_id
    JOIN towns t
    ON t.town_id = a.town_id
    WHERE t.name LIKE 'b%'
    ORDER BY t.name asc;
    
DELIMITER $$  
CREATE PROCEDURE usp_get_towns_starting_with(chars VARCHAR(50))
BEGIN
		SELECT name as town_name FROM towns
        WHERE name LIKE CONCAT(chars , '%')
        ORDER BY name;
	
END $$  
DELIMITER ;

CALL usp_get_towns_starting_with('b');

DROP procedure usp_get_towns_starting_with;



-- 04. Employees from Town


SELECT e.first_name,e.last_name
	FROM 	employees e 
    JOIN addresses a
    ON e.address_id = a.address_id
    JOIN towns t
    ON t.town_id = a.town_id
    WHERE t.name LIKE 'Sofia'
    ORDER BY e.first_name,e.last_name,e.employee_id asc;
    
DELIMITER $$ 
CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(20))
BEGIN
	SELECT e.first_name,e.last_name
	FROM 	employees e 
    JOIN addresses a
    ON e.address_id = a.address_id
    JOIN towns t
    ON t.town_id = a.town_id
    WHERE t.name LIKE town_name
    ORDER BY e.first_name,e.last_name,e.employee_id asc;
END $$
DELIMITER ;

CALL  usp_get_employees_from_town('Sofia');

DROP PROCEDURE  usp_get_employees_from_town;


-- 5. Salary Level Function


DELIMITER $$
CREATE FUNCTION ufn_get_salary_level (salary DECIMAL(12,2))
RETURNS VARCHAR(7)
NO SQL
BEGIN
		DECLARE salary_level VARCHAR(7);
        
        IF (salary < 30000) THEN
        SET salary_level = 'Low';
        ELSEIF (salary BETWEEN 30000 and 50000) THEN
        SET salary_level = 'Average';
        ELSE 
			SET salary_level = 'High';
        END IF;
        RETURN salary_level;
		
END $$
DELIMITER ;

SELECT ufn_get_salary_level(13255.23);


-- 06. Employees by Salary Level

DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(50))
BEGIN
		SELECT first_name,last_name FROM employees
        WHERE salary_level = (SELECT ufn_get_salary_level(salary))
        ORDER BY first_name DESC,last_name DESC;
END $$

DELIMITER ;

call  usp_get_employees_by_salary_level('High');
SELECT ufn_get_salary_level(50001.00);

-- 07. Define Function

DELIMITER $$

CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS TINYINT
NO SQL
BEGIN
	DECLARE output TINYINT;
	SET output = (	SELECT word REGEXP CONCAT('^[', set_of_letters,']+$'));
    RETURN output;
END $$

DELIMITER ;

select ufn_is_word_comprised('oistmiahf','Sofia');

-- PART II – Queries for Bank Database

-- 08. Find Full Name

DELIMITER $$
CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
		SELECT CONCAT(first_name,' ',last_name) AS full_name from account_holders 
        order by full_name, id;
END $$
DELIMITER ;

CALL usp_get_holders_full_name();

-- 9. People with Balance Higher Than

DELIMITER $$
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(target_balance DECIMAL (19,4))
BEGIN
		SELECT first_name, last_name FROM account_holders ac 
        JOIN accounts a ON ac.id = a.account_holder_id
        GROUP BY ac.id
        HAVING SUM(balance) > target_balance
        ORDER BY ac.id;
END $$
DELIMITER ;

CALL usp_get_holders_with_balance_higher_than(7000);
-- DROP PROCEDURE usp_get_holders_with_balance_higher_than;



SELECT first_name, last_name FROM account_holders ac 
        JOIN accounts a ON ac.id = a.account_holder_id
        GROUP BY ac.id
        HAVING SUM(balance) > 7000
        ORDER BY ac.id;

