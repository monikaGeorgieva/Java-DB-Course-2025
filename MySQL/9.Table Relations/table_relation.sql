-- Lab: Table Relations

USE camp;

CREATE database lab_05;
USE lab_05;



create table mountains(
id INT AUTO_INCREMENT primary key,
name VARCHAR(50)
);

create table peaks(
id INT AUTO_INCREMENT primary key,
name VARCHAR(50),
mountain_id INT,
		constraint fk_peaks_mountains
        FOREIGN KEY(mountain_id)
        REFERENCES mountains(id)
);

-- 2. Trip Organization

SELECT driver_id, vehicle_type, 
CONCAT(c.first_name, ' ', c.last_name) as driver_name
FROM vehicles v
JOIN campers c ON v.driver_id = c.id; 

-- 4. Delete Mountains

 DROP TABLE mountains;
 DROP TABLE peaks;
 
 CREATE TABLE mountains(
		id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100)
 );
 
 CREATE TABLE peaks(
		id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100),
        mountain_id INT,
        
        FOREIGN KEY(mountain_id)
        REFERENCES mountains(id)
        ON DELETE CASCADE
 );
 
 INSERT INTO mountains(name) VALUES
 ('Vitosha'),('Rila');
 

 
 SELECT * from peaks;
 
 