-- -----------------------------------------------------
-- QUERY 5
-- -----------------------------------------------------

SELECT 
    p.stage_name AS 'Performer Name',
    COUNT(DISTINCT f.festival_id) AS 'Festival Appearances',
    TIMESTAMPDIFF(YEAR, a.birthdate, CURDATE()) AS 'Age'
FROM 
    ARTIST a
JOIN 
    PERFORMER p ON a.performer_id = p.performer_id
JOIN 
    PERFORMANCE perf ON p.performer_id = perf.performer_id
JOIN 
    EVENT e ON perf.event_id = e.event_id
JOIN 
    FESTIVAL f ON e.festival_id = f.festival_id
WHERE 
    TIMESTAMPDIFF(YEAR, a.birthdate, CURDATE()) < 30
GROUP BY 
    p.performer_id
ORDER BY 
    `Festival Appearances` DESC;