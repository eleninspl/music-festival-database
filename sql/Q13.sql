-- -----------------------------------------------------
-- QUERY 13
-- -----------------------------------------------------

SELECT 
    p.stage_name,
    COUNT(DISTINCT l.continent) AS continent_count,
    GROUP_CONCAT(DISTINCT l.continent ORDER BY l.continent SEPARATOR ', ') AS continents
FROM 
    PERFORMANCE perf
JOIN 
    PERFORMER p ON perf.performer_id = p.performer_id
JOIN 
    EVENT e ON perf.event_id = e.event_id
JOIN 
    FESTIVAL f ON e.festival_id = f.festival_id
JOIN 
    LOCATION l ON f.location_id = l.location_id
GROUP BY 
    p.performer_id
HAVING 
    continent_count >= 3
ORDER BY 
    continent_count DESC;
