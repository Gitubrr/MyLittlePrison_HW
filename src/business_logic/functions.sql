DELIMITER //

CREATE FUNCTION fn_check_prisoner_id(prisoner_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE exists_count INT DEFAULT 0;
    
    IF prisoner_id <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid prisoner ID. ID must be positive';
    END IF;
    
    SELECT COUNT(*) INTO exists_count FROM Prisoner WHERE Prisoner_ID = prisoner_id;
    
    IF exists_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Prisoner does not exist';
    END IF;
    
    RETURN prisoner_id;
END//


CREATE FUNCTION fn_get_remaining_days(prisoner_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE end_of_term DATE;
    DECLARE remaining INT;
    
    SET prisoner_id = check_prisoner_id(prisoner_id);
    
    SELECT End_Of_Term INTO end_of_term
    FROM Prisoner
    WHERE Prisoner_ID = prisoner_id;
    
    SET remaining = DATEDIFF(end_of_term, CURDATE());
    
    IF remaining < 0 THEN
        RETURN 0;
    ELSE
        RETURN remaining;
    END IF;
END//

CREATE FUNCTION fn_get_violation_count(prisoner_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE violation_count INT;
    
    SET prisoner_id = check_prisoner_id(prisoner_id);
    
    SELECT COUNT(*) INTO violation_count
    FROM Conscription
    WHERE Prisoner_ID = prisoner_id;
    
    RETURN violation_count;
END//


CREATE FUNCTION fn_get_prisoner_full_name(prisoner_id INT)
RETURNS VARCHAR(50)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE full_name VARCHAR(50);
    
    SET prisoner_id = check_prisoner_id(prisoner_id);
    
    SELECT CONCAT(Last_Name, ' ', First_Name) INTO full_name
    FROM Prisoner
    WHERE Prisoner_ID = prisoner_id;
    
    RETURN full_name;
END//

DELIMITER ;