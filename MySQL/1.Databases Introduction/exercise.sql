Use mini_orm;
select * FROM mini_orm.users;
Create database mini_orm;
DROP database mini_orm;
Use hotel;
CREATE TABLE `mini_orm`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `age` VARCHAR(45) NULL,
  `registration_date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
  select * from users;
