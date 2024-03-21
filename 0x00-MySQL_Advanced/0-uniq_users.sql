-- This is an SQL script that creates a users table with three (3) fields
-- It should not fail when the table already exists
DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users`(
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `name` VARCHAR(255)
);
COMMIT;
