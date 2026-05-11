CREATE TABLE IF NOT EXISTS Employee_Audit (
    Audit_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT,
    Old_Job_Title VARCHAR(20),
    New_Job_Title VARCHAR(20),
    Change_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Changed_By VARCHAR(50)
);

DELIMITER //

CREATE TRIGGER trg_update_prisoner_term
AFTER INSERT ON Prisoner_Article
FOR EACH ROW
BEGIN
    UPDATE Prisoner
    SET End_Of_Term = (
        SELECT DATE_ADD(MIN(Start_Of_Term), INTERVAL MAX(Sentence_Years) YEAR)
        FROM Prisoner_Article
        WHERE Prisoner_ID = NEW.Prisoner_ID
    )
    WHERE Prisoner_ID = NEW.Prisoner_ID;
END//


CREATE TRIGGER trg_check_prisoner_age
BEFORE INSERT ON Prisoner
FOR EACH ROW
BEGIN
    DECLARE age INT;
    DECLARE msg VARCHAR(255);
    
    SET age = TIMESTAMPDIFF(YEAR, NEW.Date_Of_Birth, CURDATE());
    
    IF age < 14 THEN
        SET msg = CONCAT('Prisoner must be over 14 years old. Age: ', age);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END//


CREATE TRIGGER trg_log_employee_job_change
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF OLD.Job_Title != NEW.Job_Title THEN
        INSERT INTO Employee_Audit (Employee_ID, Old_Job_Title, New_Job_Title)
        VALUES (NEW.Employee_ID, OLD.Job_Title, NEW.Job_Title);
    END IF;
END//

DELIMITER ;