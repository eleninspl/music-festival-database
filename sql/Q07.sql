-- -----------------------------------------------------
-- QUERY 7
-- -----------------------------------------------------

SELECT 
    f.name AS 'Festival',
    f.year AS 'Year',
    ROUND(AVG(
        CASE s.experience_level
            WHEN 'trainee' THEN 1
            WHEN 'beginner' THEN 2
            WHEN 'intermediate' THEN 3
            WHEN 'experienced' THEN 4
            WHEN 'expert' THEN 5
            ELSE 0
        END
    ), 2) AS 'Avg Experience Score'
FROM 
    STAFF s
JOIN 
    EVENT_STAFF es ON s.staff_id = es.staff_id
JOIN 
    EVENT e ON es.event_id = e.event_id
JOIN 
    FESTIVAL f ON e.festival_id = f.festival_id
WHERE 
    s.staff_type = 'technical'
GROUP BY 
    f.festival_id
ORDER BY 
    `Avg Experience Score` ASC
LIMIT 1;