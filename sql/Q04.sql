-- -----------------------------------------------------
-- QUERY 4
-- -----------------------------------------------------

SELECT 
    p.stage_name AS 'Performer',
    ROUND(AVG(r.artist_interpretation), 2) AS 'Avg Artist Interpretation',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    RATING r
JOIN 
    PERFORMANCE perf ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p ON perf.performer_id = p.performer_id
WHERE 
    p.stage_name = @artist_name
GROUP BY 
    p.performer_id;