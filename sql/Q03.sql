-- -----------------------------------------------------
-- QUERY 3
-- -----------------------------------------------------

SELECT 
    p.stage_name AS 'Performer Name',
    f.name AS 'Festival Name',
    f.year AS 'Year',
    COUNT(*) AS 'Warm-up Appearances'
FROM 
    PERFORMANCE perf
JOIN 
    PERFORMER p ON perf.performer_id = p.performer_id
JOIN 
    EVENT e ON perf.event_id = e.event_id
JOIN 
    FESTIVAL f ON e.festival_id = f.festival_id
WHERE 
    perf.type = 'warm up'
GROUP BY 
    perf.performer_id, e.festival_id
HAVING 
    COUNT(*) > 2
ORDER BY 
    f.year, COUNT(*) DESC;
