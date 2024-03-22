-- SQL Script to create a stored procedure that computes and stores
-- the average weighted score for all students

DELIMITER //

DROP PROCEDURE IF EXISTS `ComputeAverageWeightedScoreForUsers`;

CREATE PROCEDURE `ComputeAverageWeightedScoreForUsers`()
BEGIN

    UPDATE `users` SET `users`.`average_score` = (
        SELECT SUM(`c`.`score` * `p`.`weight`) / SUM(`p`.`weight`)
        FROM `corrections` AS `c` INNER JOIN `projects` AS `p`
        ON `p`.`id` = `c`.`project_id`
        WHERE `c`.`user_id` = `users`.`id`
    );

END
//
DELIMITER ;
