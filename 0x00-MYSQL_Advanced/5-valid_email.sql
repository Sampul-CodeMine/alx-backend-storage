-- SQL Script to crete a trigger that validates an email address before updates
DROP TRIGGER IF EXISTS `validate_email_duplicates`;

DELIMITER //
CREATE TRIGGER `validate_email_duplicates` BEFORE UPDATE ON `users`
    FOR EACH ROW
    BEGIN
        IF OLD.email <> NEW.email THEN
            SET NEW.valid_email = 0;
        END IF;
    END; 
//
DELIMITER ;
