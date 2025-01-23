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
WHERE SUBSTRING(title,1,3) = 'The';

