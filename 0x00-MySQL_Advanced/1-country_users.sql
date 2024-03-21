-- This is an SQL script that creates a users table with three (4) fields
-- It should not fail when the table already exists
DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users`(
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `name` VARCHAR(255),
  `country` ENUM('US', 'CO', 'TS') NOT NULL DEFAULT 'US'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

COMMIT;
