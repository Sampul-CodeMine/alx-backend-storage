-- An SQL script that creates a trigger that decreases the quantity
-- of items after adding a new order
DROP TRIGGER IF EXISTS `reduce_order_qty`;

DELIMITER //
CREATE TRIGGER `reduce_order_qty` AFTER INSERT ON `orders`
    FOR EACH ROW
    BEGIN
        UPDATE `items` SET `quantity` = `quantity` - NEW.number
        WHERE `name` = NEW.item_name;
    END; 
//
DELIMITER ;
