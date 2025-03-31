DROP database restaurant;

USE restaurant;

SELECT category_id, COUNT(*)  as total_category,ROUND(SUM(price),2) as price_per_category
FROM products
GROUP BY category_id;

SELECT * FROM products;

SELECT first_name 
FROM employees
GROUP BY first_name;

-- 1.Departments Info
SELECT department_id,COUNT(*) AS 'Number of employees'
FROM employees
group by department_id;

-- 2. Average Salary
SELECT department_id,ROUND(AVG(salary),2) AS 'Average Salary'
FROM employees
GROUP BY department_id;

-- 3. Min Salary
SELECT department_id,ROUND(MIN(salary),0) AS 'Min Salary'
FROM employees
WHERE salary > 800
GROUP BY department_id
LIMIT 1;

-- 4. Appetizers Count
SELECT sum(category_id = 2)
FROM products
WHERE price > 8;

-- 5. Menu Prices
SELECT * from products;

SELECT distinct category_id,ROUND(AVG(price),2) AS 'Average Price',MIN(price) AS 'Cheapest Product',MAX(price) AS 'Most Expensive Product'
from products
GROUP BY category_id;
