CREATE TABLE `db_example`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

SELECT * FROM db_example.employees;

INSERT INTO `db_example`.`products` (`id`, `name`, `category_id`)
 VALUES ('1', 'banana', '24');
 
 
INSERT INTO `db_example`.`products` (`id`, `name`, `category_id`)
 VALUES ('2', 'apple', '15');
 
 ALTER TABLE employees
 ADD COLUMN username VARCHAR(50);
 
 SELECT * FROM employees;
 
 
