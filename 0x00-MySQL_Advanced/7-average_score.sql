-- SQL Script to create a stored procedure that computes and stores the average
-- scores for a student
DROP PROCEDURE IF EXISTS `ComputeAverageScoreForUser`;

-- Set a Delimiter
DELIMITER //

-- Create a procedure which accepts one (1) values or argument
CREATE PROCEDURE `ComputeAverageScoreForUser`(user_id INT)
BEGIN
    
    UPDATE `users` 
    SET `average_score` = (SELECT AVG(`score`) FROM `corrections` WHERE `corrections`.`user_id` = user_id)
    WHERE `id` = user_id;

END;
//
DELIMITER ;
