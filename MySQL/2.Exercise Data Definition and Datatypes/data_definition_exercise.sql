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

CREATE TABLE people(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    picture TEXT,
    height DOUBLE(4,2),
    weight DOUBLE(4,2),
    gender CHAR(1),
    birthday DATE NOT NULL,
    biography VARCHAR (500)
);

SELECT * FROM people;

INSERT INTO people VALUES
(1,'Moni','text',1.9,52,'f','1990-06-15','lovely girl'),
(2,'Krisi','text',1.9,52,'f','1994-08-12','lovely girl'),
(3,'Lilu','text',1.9,46,'f','1994-03-10','lovely girl');

-- 7- create table username 
DROP table users;

CREATE TABLE users (
id INT UNIQUE PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(30) NOT NULL,
password VARCHAR(26) NOT NULL,
profile_picture TEXT,
last_login_time DATETIME,
is_deleted BOOLEAN 
);

INSERT INTO users (name,password,profile_picture,last_login_time,is_deleted) VALUES
('Lilyna','15462',NULL,'2020-02-14 20:11:45', false),
('Sasho','15462',NULL,'2020-02-14 20:11:45', false),
('Kiril','15462',NULL,'2020-02-14 20:11:45', false),
('David','15462',NULL,'2020-02-14 20:11:45', false),
('Ina','15462',NULL,'2020-02-14 20:11:45', false);

select * FROM users;

ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY (id,name);

ALTER TABLE users
CHANGE COLUMN last_login_time last_login_time DATETIME DEFAULT NOW();