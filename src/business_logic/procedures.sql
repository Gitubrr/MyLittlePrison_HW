DELIMITER //

CREATE PROCEDURE pr_transfer_prisoner(
    IN prisoner_id INT,
    IN new_block INT,
    IN new_room INT
)
MODIFIES SQL DATA
BEGIN
    DECLARE current_block INT;
    DECLARE current_room INT;

    SET prisoner_id = check_prisoner_id(prisoner_id);
        
    SELECT Block, Room INTO current_block, current_room
    FROM Prisoner
    WHERE Prisoner_ID = prisoner_id;
    
    UPDATE Prisoner
    SET Block = new_block, Room = new_room
    WHERE Prisoner_ID = prisoner_id;
    
    SELECT CONCAT('Prisoner ', prisoner_id, ' transferred from block ', 
                  current_block, ' room ', current_room, ' to block ',
                  new_block, ' room ', new_room) AS message;
END//


CREATE PROCEDURE pr_add_conscription_with_punishment(
    IN prisoner_id INT,
    IN violation_desc VARCHAR(50),
    IN punishment_desc VARCHAR(50),
    IN punishment_days INT
)
MODIFIES SQL DATA
BEGIN
    DECLARE conscription_id INT;
    DECLARE punishment_id INT;

    SET prisoner_id = check_prisoner_id(prisoner_id);
    
    SELECT IFNULL(MAX(Conscription_ID), 0) + 1 INTO conscription_id FROM Conscription;
    
    INSERT INTO Conscription (Conscription_ID, Prisoner_ID, Date, Description)
    VALUES (conscription_id, prisoner_id, CURDATE(), violation_desc);
    
    SELECT IFNULL(MAX(Punishment_ID), 0) + 1 INTO punishment_id FROM Punishment;
    
    INSERT INTO Punishment (Punishment_ID, Conscription_ID, Start_Date, End_Date, Description)
    VALUES (punishment_id, conscription_id, CURDATE(), DATE_ADD(CURDATE(), INTERVAL punishment_days DAY), punishment_desc);
    
    SELECT CONCAT('Violation and punishment added for prisoner ', prisoner_id) AS message;
END//


CREATE PROCEDURE pr_release_prisoner(IN prisoner_id INT)
MODIFIES SQL DATA
BEGIN
    SET prisoner_id = check_prisoner_id(prisoner_id);
    
    UPDATE Prisoner
    SET End_Of_Term = CURDATE()
    WHERE Prisoner_ID = prisoner_id;
    
    SELECT CONCAT('Prisoner ', prisoner_id, ' released on ', CURDATE()) AS message;
END//

DELIMITER ;