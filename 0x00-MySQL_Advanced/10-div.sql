-- SQL Script to create a function to divide the first arg by the second arg
-- Returns 0 if the second arg is 0
DROP FUNCTION IF EXISTS `SafeDiv`;
DELIMITER //
CREATE FUNCTION `SafeDiv`(a INT, b INT) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE result FLOAT DEFAULT 0;

    IF b <> 0 THEN
        SET result = a / b;
    END IF
    RETURN result;
END;
//
DELIMITER ;
