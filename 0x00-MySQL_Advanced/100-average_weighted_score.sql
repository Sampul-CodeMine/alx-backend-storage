-- SQL Script to create a stored procedure that computes and stores the average
-- scores for a student
DROP PROCEDURE IF EXISTS `ComputeAverageWeightedScoreForUser`;

-- Set a Delimiter
DELIMITER //

-- Create a procedure which accepts one (1) values or argument
CREATE PROCEDURE `ComputeAverageWeightedScoreForUser`(user_id INT)
BEGIN

    DECLARE tws INT DEFAULT 0;
    DECLARE tw INT DEFAULT 0;
    DECLARE sco FLOAT DEFAULT 0;

    SELECT SUM(`corrections`.`score` * `projects`.`weight`) INTO tws 
        FROM `corrections`
        INNER JOIN `projects` ON `corrections`.`project_id` = `projects`.`id`
    WHERE `corrections`.`user_id` = user_id;
    
    SELECT SUM(`projects`.`weight`) INTO tw 
        FROM `corrections`
        INNER JOIN `projects` ON `corrections`.`project_id` = `projects`.`id`
    WHERE `corrections`.`user_id` = user_id;

    IF tw != 0 THEN
        SET sco = tws / tw;
    END IF;

    UPDATE `users` SET `users`.`average_score` = sco WHERE `users`.`id` = user_id;

END;
//
DELIMITER ;
