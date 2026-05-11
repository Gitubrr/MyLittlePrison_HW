CREATE VIEW v_prisoner_details AS
SELECT 
    p.Prisoner_ID,
    p.Last_Name,
    p.First_Name,
    p.Block,
    p.Room,
    p.Start_Of_Term,
    p.End_Of_Term,
    DATEDIFF(p.End_Of_Term, CURDATE()) AS days_remaining,
    COUNT(DISTINCT pa.Article_ID) AS article_count,
    GROUP_CONCAT(DISTINCT ca.Article_Code ORDER BY ca.Article_Code SEPARATOR ', ') AS articles
FROM Prisoner p
LEFT JOIN Prisoner_Article pa ON p.Prisoner_ID = pa.Prisoner_ID
LEFT JOIN Criminal_Code_Article ca ON pa.Article_ID = ca.Article_ID
GROUP BY p.Prisoner_ID, p.Last_Name, p.First_Name, p.Block, p.Room, p.Start_Of_Term, p.End_Of_Term;


CREATE VIEW v_block_statistics AS
SELECT 
    p.Block,
    COUNT(DISTINCT p.Prisoner_ID) AS prisoner_count,
    COUNT(DISTINCT c.Conscription_ID) AS total_violations,
    ROUND(COUNT(DISTINCT c.Conscription_ID) / NULLIF(COUNT(DISTINCT p.Prisoner_ID), 0), 2) AS avg_violations_per_prisoner,
    COUNT(DISTINCT CASE WHEN p.End_Of_Term < CURDATE() THEN p.Prisoner_ID END) AS overdue_release
FROM Prisoner p
LEFT JOIN Conscription c ON p.Prisoner_ID = c.Prisoner_ID
GROUP BY p.Block
ORDER BY p.Block;


CREATE VIEW v_today_visits AS
SELECT 
    v.Visit_ID,
    p.Last_Name AS prisoner_last_name,
    p.First_Name AS prisoner_first_name,
    p.Block,
    p.Room,
    v.Visitor_Last_Name,
    v.Visitor_First_Name,
    v.Visit_Date,
    v.Description AS visit_type,
    e.Last_Name AS inspector_last_name,
    e.First_Name AS inspector_first_name
FROM Visit v
JOIN Prisoner p ON v.Prisoner_ID = p.Prisoner_ID
JOIN Employee e ON v.Employee_ID = e.Employee_ID
WHERE v.Visit_Date = CURDATE()
ORDER BY v.Visit_Date;