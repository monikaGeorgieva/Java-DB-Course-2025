SELECT * from wizzard_deposits;

-- 1. Records' Count
SELECT COUNT(id) as 'count'
FROM wizzard_deposits;

-- 02. Longest Magic Wand
SELECT MAX(magic_wand_size) AS 'longest_magic_wand'
FROM wizzard_deposits;

-- 03. Longest Magic Wand per Deposit Groups
SELECT deposit_group,MAX(magic_wand_size) AS 'longest_magic_wand'
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY longest_magic_wand,deposit_group;

-- 04. Smallest Deposit Group per Magic Wand Size
SELECT deposit_group
FROM wizzard_deposits
HAVING MIN(magic_wand_size); -- Compile time error

-- 05. Deposits Sum
SELECT deposit_group , SUM(deposit_amount) as 'total_sum'
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY total_sum;

-- 06. Deposits Sum for Ollivander Family
SELECT deposit_group , SUM(deposit_amount) as 'total_sum'
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group asc;

-- 07. Deposits Filter

SELECT deposit_group , SUM(deposit_amount) as 'total_sum'
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family' 
GROUP BY deposit_group
HAVING total_sum < 150000
ORDER BY total_sum desc; 

-- 08. Deposit Charge

SELECT deposit_group,magic_wand_creator,MIN(deposit_charge) AS min_deposit_charge
FROM wizzard_deposits
GROUP BY deposit_group,magic_wand_creator
ORDER BY magic_wand_creator asc,deposit_group asc;



-- 09. Age Groups
SELECT 
CASE
	WHEN age <= 10 THEN '[0-10]'
    WHEN age <= 20 THEN '[11-20]'
    WHEN age <= 30 THEN '[21-30]'
    WHEN age <= 40 THEN '[31-40]'
    WHEN age <= 50 THEN '[41-50]'
    WHEN age <= 60 THEN '[51-60]'
	WHEN age > 60 THEN '[61+]'
END AS age_group,
COUNT(*) AS wizzard_count
FROM wizzard_deposits
group by age_group
ORDER BY wizzard_count;

-- 10. First Letter
SELECT LEFT(first_name, 1) AS 'first_letter'
FROM wizzard_deposits
WHERE deposit_group = 'Troll Chest'
GROUP BY first_letter
ORDER BY first_letter;

-- 11. Average Interest
SELECT deposit_group,is_deposit_expired,AVG(deposit_interest)
FROM wizzard_deposits
WHERE deposit_start_date > '1985-01-01'
GROUP BY deposit_group,is_deposit_expired
ORDER BY deposit_group DESC;

-- 12. Employees Minimum Salaries
SELECT department_id,MIN(salary) AS 'minimum_salary'
FROM employees
WHERE hire_date > '2000-01-01'
GROUP BY department_id
HAVING department_id IN (2,5,7)
ORDER BY department_id ASC;

-- 13. Employees Average Salaries
CREATE TABLE high_paid_employees
SELECT * FROM employees
WHERE salary > 30000;


DELETE
from high_paid_employees
WHERE manager_id = 42;

UPDATE high_paid_employees SET salary = salary + 5000
WHERE department_id = 1;

SELECT department_id , AVG(salary) as avg_salalry FROM high_paid_employees
GROUP BY department_id
ORDER BY department_id;

-- SET SQL_SAFE_UPDATES = 0;

-- 14. Employees Maximum Salaries
SELECT department_id,MAX(salary) AS 'max_salary'
FROM employees
GROUP BY department_id
HAVING  max_salary NOT BETWEEN 30000 and  70000
ORDER BY department_id ASC;

-- 15. Employees Count Salaries
SELECT COUNT(employee_id) AS ''
FROM employees
WHERE manager_id IS null;

-- 16. 3rd Highest Salary*

-- 17. Salary Challenge**
SELECT first_name,last_name,department_id
FROM employees e
WHERE salary > (SELECT avg(salary) FROM employees	
				where department_id = e.department_id)

ORDER BY department_id,employee_id
LIMIT 10;

-- 18 Departments Total Salaries
SELECT department_id,SUM(salary) AS 'total_salary'
FROM employees
GROUP BY department_id
ORDER BY department_id;


