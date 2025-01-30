SELECT * FROM authors;
SELECT * FROM books;

USE book_library;

-- String
SELECT SUBSTRING('Monika',2);
SELECT SUBSTRING('monika',1,2);
SELECT SUBSTRING('Monika' FROM 1 FOR 2);


-- 1.Find Book Titles
SELECT * 
FROM books
WHERE SUBSTRING(title,1,3) = 'The'
ORDER BY id;

-- 2.Replace Titles
SELECT 
id,
REPLACE(title,'The','***')
FROM books
WHERE SUBSTRING(title,1,3) = 'The'
ORDER BY id;

-- 3. Sum Cost of All Books
SELECT SUM(round(cost,0))
AS 'total'
FROM books;

SELECT 5 + 2;


-- 4. Days Lived
SELECT
 concat(first_name, ' ', last_name) as 'Full name',
 TIMESTAMPDIFF(DAY,born, died)
 from authors;


SELECT 5 DIV 2, 5 / 2,5 % 2, 5 MOD 2;

SELECT FLOOR(-4.23),CEILING(-4.23); -- -5,-4

SELECT CURRENT_TIMESTAMP;
-- 2025-01-30 15:24:51

SELECT EXTRACT(HOUR FROM TIMESTAMP '2025-01-30 14:45:00');
-- 14


SELECT DATE_FORMAT('2017/05/31', '%Y %b %D') AS 'Date';
-- форматиране на дата -> 2017 May 31st

-- Примери за Wildcards с LIKE
SELECT * FROM authors WHERE first_name LIKE 'A%';
SELECT * FROM authors WHERE first_name LIKE 'E%';
-- Намира всички имена, започващи с 'A' (Amy, Alex, Andrew)

SELECT * FROM authors WHERE first_name NOT LIKE 'A%';
-- Намира всички имена, които НЕ започват с 'A'


-- 5. Harry Potter Books

SELECT title
FROM books
WHERE title LIKE 'Harry%'
ORDER BY id;


SELECT * FROM books;
