-- SQL Script to create a stored procedure that adds a new correction for students
-- Drop procedure if it exists before
DROP PROCEDURE IF EXISTS `AddBonus`;

-- Set a Delimiter
DELIMITER //

-- Create a procedure which accepts three (3) values or arguments
CREATE PROCEDURE `AddBonus`(`user_id` INT, `project_name` VARCHAR(50), `score` FLOAT)
BEGIN
    
    -- INSERT INTO `projects`(`name`) VALUES (project_name)
    -- ON DUPLICATE KEY UPDATE id = LAST_INSERT_ID(id);

    -- INSERT INTO `corrections`(`user_id`, `project_id`, `score`)
    -- VALUES (user_id, LAST_INSERT_ID(), score);

    INSERT INTO `projects`(`name`)
    SELECT project_name FROM DUAL
    WHERE NOT EXISTS(SELECT * FROM `projects` WHERE `name` = project_name LIMIT 1);
    
    INSERT INTO corrections(`user_id`, `project_id`, `score`)
    VALUES (user_id, (SELECT `id` FROM `projects` WHERE `name` = project_name), score);
END;
//
DELIMITER ;
