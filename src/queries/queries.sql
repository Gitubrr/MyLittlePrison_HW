SELECT 
    Block,
    COUNT(*) AS prisoner_count,
    MIN(Date_Of_Birth) AS youngest_birth_date,
    MAX(Date_Of_Birth) AS oldest_birth_date
FROM Prisoner
WHERE End_Of_Term > CURRENT_DATE
GROUP BY Block
ORDER BY prisoner_count DESC;

SELECT 
    p.Prisoner_ID,
    p.Last_Name,
    p.First_Name,
    COUNT(c.Conscription_ID) AS violation_count
FROM Prisoner p
JOIN Conscription c ON p.Prisoner_ID = c.Prisoner_ID
GROUP BY p.Prisoner_ID, p.Last_Name, p.First_Name
ORDER BY violation_count DESC;

SELECT 
    p.Prisoner_ID,
    p.Last_Name,
    p.First_Name,
    COUNT(c.Conscription_ID) AS violation_count,
    CASE WHEN COUNT(c.Conscription_ID) = 0 THEN 'Нет нарушений' ELSE 'Есть нарушения' END AS status
FROM Prisoner p
LEFT JOIN Conscription c ON p.Prisoner_ID = c.Prisoner_ID
GROUP BY p.Prisoner_ID, p.Last_Name, p.First_Name
ORDER BY violation_count;

SELECT 
    Block,  
    COUNT(*) AS prisoner_count,
    AVG(TIMESTAMPDIFF(YEAR, Date_Of_Birth, CURDATE()))
FROM Prisoner
GROUP BY Block
HAVING COUNT(*) > 2
ORDER BY prisoner_count DESC;

SELECT 
    Prisoner_ID,
    Last_Name,
    First_Name,
    (End_Of_Term - Start_Of_Term) AS sentence_days,
    (SELECT AVG(End_Of_Term - Start_Of_Term) FROM Prisoner) AS avg_sentence_days
FROM Prisoner
WHERE End_Of_Term > CURRENT_DATE;

SELECT 
    p.Prisoner_ID,
    p.Last_Name,
    p.First_Name
FROM Prisoner p
WHERE p.Prisoner_ID IN (
    SELECT DISTINCT c.Prisoner_ID
    FROM Conscription c
    JOIN Punishment pu ON c.Conscription_ID = pu.Conscription_ID
    WHERE pu.Description LIKE '%Segregation unit%'
)
ORDER BY p.Last_Name;

SELECT 
    p.Prisoner_ID,
    p.Last_Name,
    p.First_Name
FROM Prisoner p
WHERE EXISTS (
    SELECT 1 FROM Visit v WHERE v.Prisoner_ID = p.Prisoner_ID
)
ORDER BY p.Last_Name;

SELECT 
    block_stats.Block,
    block_stats.prisoner_count,
    block_stats.avg_age
FROM (
    SELECT 
        Block,
        COUNT(*) AS prisoner_count,
        AVG(TIMESTAMPDIFF(YEAR, Date_Of_Birth, CURDATE())) AS avg_age
    FROM Prisoner
    GROUP BY Block
) AS block_stats
WHERE block_stats.prisoner_count > (
    SELECT AVG(prisoner_count) 
    FROM (
        SELECT Block, COUNT(*) AS prisoner_count 
        FROM Prisoner 
        GROUP BY Block
    ) AS avg_table
);

SELECT 
    'Prisoner' AS type,
    Prisoner_ID AS id,
    Last_Name,
    First_Name,
    NULL AS Job_Title
FROM Prisoner

UNION

SELECT 
    'Employee' AS type,
    Employee_ID AS id,
    Last_Name,
    First_Name,
    Job_Title
FROM Employee
ORDER BY Last_Name, First_Name;

UPDATE Prisoner p
JOIN Prisoner_Article pa ON p.Prisoner_ID = pa.Prisoner_ID
JOIN Criminal_Code_Article ca ON pa.Article_ID = ca.Article_ID
SET p.End_Of_Term = p.End_Of_Term + INTERVAL 1 YEAR
WHERE ca.Article_Code IN ('105', '158', '161');

DELETE FROM Punishment
WHERE Conscription_ID IN (
    SELECT Conscription_ID FROM (
        SELECT c.Conscription_ID
        FROM Conscription c
        WHERE c.Date < CURRENT_DATE - INTERVAL 1 YEAR
    ) AS temp
);

SELECT 
    e.Employee_ID,
    e.Last_Name,
    e.First_Name,
    e.Job_Title,
    ds.Date,
    ds.Start_Time,
    ds.End_Time
FROM Duty_Schedule ds
RIGHT JOIN Employee e ON ds.Employee_ID = e.Employee_ID
ORDER BY e.Last_Name, ds.Date;

SELECT 
    Prisoner_ID,
    Last_Name,
    First_Name,
    Block,
    Room,
    days_remaining,
    article_count,
    articles
FROM v_prisoner_details
WHERE days_remaining < 30
ORDER BY days_remaining;

SELECT 
    e.Employee_ID,
    e.Last_Name,
    e.First_Name,
    e.Job_Title,
    COUNT(v.Visit_ID) AS visits_handled,
    COUNT(DISTINCT v.Prisoner_ID) AS unique_prisoners_met
FROM Employee e
LEFT JOIN Visit v ON e.Employee_ID = v.Employee_ID
GROUP BY e.Employee_ID, e.Last_Name, e.First_Name, e.Job_Title
ORDER BY visits_handled DESC;

SELECT 
    Prisoner_ID,
    Last_Name,
    First_Name,
    (End_Of_Term - CURRENT_DATE) AS days_left,
    CASE 
        WHEN (End_Of_Term - CURRENT_DATE) < 30 THEN 'Скоро освобождение'
        WHEN (End_Of_Term - CURRENT_DATE) < 180 THEN 'Средний срок'
        ELSE 'Долгий срок'
    END AS release_category
FROM Prisoner
WHERE End_Of_Term > CURRENT_DATE
ORDER BY days_left;

SELECT fn_get_violation_count(2);
SELECT Prisoner_ID, Last_Name, First_Name, Block, Room 
FROM Prisoner 
WHERE Prisoner_ID = 3;
SELECT * FROM Conscription WHERE Prisoner_ID = 5 ORDER BY Date DESC LIMIT 1;
SELECT * FROM Punishment ORDER BY Punishment_ID DESC LIMIT 1;
CALL pr_release_prisoner(9);
SELECT Prisoner_ID, Last_Name, First_Name, End_Of_Term 
FROM Prisoner 
WHERE Prisoner_ID = 9;

INSERT INTO Prisoner (Prisoner_ID, Last_Name, First_Name, Date_Of_Birth, Block, Room, Start_Of_Term, End_Of_Term)
VALUES (11, 'Ivanov', 'Ivan', '1990-01-01', 1, 101, '2024-01-01', '2024-01-01');
INSERT INTO Prisoner_Article (Prisoner_ID, Article_ID, Conviction_Date, Sentence_Years)
VALUES (11, 1, '2024-01-01', 5);
SELECT Prisoner_ID, Start_Of_Term, End_Of_Term FROM Prisoner WHERE Prisoner_ID = 11;
UPDATE Employee SET Job_Title = 'Senior Inspector' WHERE Employee_ID = 3;
SELECT * FROM Employee_Audit;
UPDATE Employee SET Job_Title = 'Deputy Head' WHERE Employee_ID = 1;
SELECT 
    Employee_ID, 
    Old_Job_Title, 
    New_Job_Title, 
    Change_Date 
FROM Employee_Audit 
ORDER BY Change_Date DESC;

SELECT * FROM v_prisoner_details WHERE days_remaining < 30;