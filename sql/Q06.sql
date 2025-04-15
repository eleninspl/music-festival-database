-- -----------------------------------------------------
-- QUERY 6
-- -----------------------------------------------------

SELECT 
    perf.performance_id AS 'Performance ID',
    p.stage_name AS 'Performer',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    RATING r
JOIN 
    PERFORMANCE perf ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p ON perf.performer_id = p.performer_id
JOIN 
    VISITOR v ON r.visitor_id = v.visitor_id
WHERE 
    v.email = @visitor_email
GROUP BY 
    r.performance_id, p.stage_name;