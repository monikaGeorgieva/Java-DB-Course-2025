CREATE schema preserves_db;

DROP schema preserves_db;


CREATE TABLE positions(
	id INT PRIMARY KEY auto_increment,
    name varchar(40) NOT NULL UNIQUE,
    description text,
    is_dangerous boolean NOT NULL
);

CREATE TABLE continents(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE
);


CREATE TABLE countries(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    country_code VARCHAR(10) NOT NULL UNIQUE,
    continent_id INT NOT NULL,
    
	FOREIGN KEY (continent_id)
    REFERENCES continents(id)
);


CREATE TABLE preserves(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    area INT,
    type varchar(20),
    established_on DATE NULL
);

CREATE TABLE workers(
		id int primary key auto_increment,
        first_name  VARCHAR(40) not null,
        last_name VARCHAR(40) not null,
        age INT,
        personal_number VARCHAR(20) NOT NULL unique,
        salary DECIMAL(19,2),
        is_armed BOOLEAN NOT NULL,
        start_date DATE,
        preserve_id INT,
        position_id INT not null,
        
        FOREIGN KEY (preserve_id) REFERENCES preserves(id),
        FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE countries_preserves(
	country_id INT NOT NULL,
    preserve_id INT NOT NULL,
    
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (preserve_id) REFERENCES preserves(id)
);

-- 02. Insert
INSERT INTO preserves (name, latitude, longitude,area,type,established_on)
SELECT CONCAT(name, ' is in South Hemisphere'),latitude, longitude,
area * id,LOWER(type),established_on
FROM preserves
WHERE latitude < 0;

SELECT * from preserves;

-- 03. UPDATE
UPDATE workers
SET salary = salary + 500
WHERE position_id in (5,8,11,13);

-- 04.Delete 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM preserves where established_on IS NULL;

-- 05. Most experienced workers

SELECT CONCAT(first_name, ' ',last_name) AS full_name,
DATEDIFF('2024-01-01',start_date) as days_of_experience FROM workers
WHERE TIMESTAMPDIFF(DAY, start_date, '2024-01-01')
ORDER BY  days_of_experience DESC
LIMIT 10;

-- 06. Worker's salary
SELECT w.id,w.first_name,w.last_name,p.name as name,c.country_code 
FROM workers AS w
JOIN preserves as p   ON w.preserve_id = p.id
JOIN countries_preserves as cp   	ON w.preserve_id = cp.preserve_id
JOIN countries as c
	on cp.country_id = c.id
WHERE w.salary > 5000 and w.age < 50
ORDER BY c.country_code; 

-- 07. Armed workers count

SELECT p.name,count(*) as armed_workers
FROM preserves as p
JOIN workers AS w  ON w.preserve_id = p.id
WHERE w.is_armed = 1
GROUP by p.id
ORDER BY armed_workers desc, p.name asc;

-- 08. Oldest preserves

SELECT p.name, c.country_code, YEAR(p.established_on) AS founded_in
FROM preserves as p
JOIN countries_preserves AS cp 
	ON p.id = cp.preserve_id
JOIN countries as c
	ON cp.country_id = c.id
WHERE MONTH(p.established_on) = 5
ORDER BY founded_in
LIMIT 5;

-- 09. Preserve categories

 SELECT id,name,
 CASE 
	WHEN area <= 100 THEN 'very small'
    WHEN area <= 1000 THEN 'small'
    WHEN area <= 10000 THEN 'medium'
    WHEN area <= 50000 THEN 'large'
    ELSE 'very large'
END AS category
FROM preserves
ORDER BY area DESC;

-- 10. Extract average salary

DELIMITER $$

CREATE FUNCTION udf_average_salary_by_position_name (name VARCHAR(40))
RETURNS  DECIMAL(19,2)
DETERMINISTIC
BEGIN
	RETURN (SELECT AVG(salary) FROM workers w
    JOIN positions p ON w.position_id = p.id
    WHERE p.name = name);
END $$

DELIMITER ;


-- 11. Improving the standard of living

DELIMITER $$ 
CREATE PROCEDURE udp_increase_salaries_by_country(country_name VARCHAR(40))
BEGIN 
		UPDATE workers w
        JOIN preserves p ON w.preserve_id = p.id
        JOIN countries_preserves cp ON p.id = cp.preserve_id
        JOIN countries c ON cp.country_id = c.id
        SET salary = salary * 1.05
        WHERE c.name = country_name;
END $$ 

DELIMITER ;

DROP PROCEDURE udp_increase_salary_by_country;

CALL udp_increase_salaries_by_country ('Germany');


 

	




