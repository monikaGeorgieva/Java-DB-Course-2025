CREATE DATABASE minions;
USE minions;

CREATE TABLE minions (
	id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(50),
    age INT
);

DROP TABLE minions;

CREATE TABLE towns(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

ALTER TABLE minions
ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_town_id
FOREIGN KEY (town_id) REFERENCES towns (id);

INSERT INTO towns(id, name) VALUES 
(1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna');

INSERT INTO minions(id,name,age,town_id) VALUES
(1,'Kevin',22,1),
(2,'Bob',15,3),
(3,'Stewerd',null,2);

INSERT INTO minions VALUES
(4,'Monika',5,3),
(5,'Plamen',4,1),
(6,'Dona',3,2);

SELECT * from towns;
SELECT * FROM minions;


