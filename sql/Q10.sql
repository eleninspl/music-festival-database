-- -----------------------------------------------------
-- QUERY 10
-- -----------------------------------------------------

SELECT 
    LEAST(g1.name, g2.name) AS genre1,
    GREATEST(g1.name, g2.name) AS genre2,
    COUNT(DISTINCT f.festival_id) AS festival_count
FROM 
    PERFORMER_GENRE pg1
JOIN 
    PERFORMER_GENRE pg2 
    ON pg1.performer_id = pg2.performer_id AND pg1.genre_id < pg2.genre_id
JOIN 
    GENRE g1 ON pg1.genre_id = g1.genre_id
JOIN 
    GENRE g2 ON pg2.genre_id = g2.genre_id
JOIN 
    PERFORMANCE perf ON perf.performer_id = pg1.performer_id
JOIN 
    EVENT e ON perf.event_id = e.event_id
JOIN 
    FESTIVAL f ON e.festival_id = f.festival_id
GROUP BY 
    genre1, genre2
ORDER BY 
    festival_count DESC
LIMIT 3;
