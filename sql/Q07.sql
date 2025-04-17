-- -----------------------------------------------------
-- QUERY 7
-- -----------------------------------------------------
WITH tech_scores AS (
    SELECT 
        f.festival_id,
        f.name AS festival_name,
        f.year,
        CASE s.experience_level
            WHEN 'trainee' THEN 1
            WHEN 'beginner' THEN 2
            WHEN 'intermediate' THEN 3
            WHEN 'experienced' THEN 4
            WHEN 'expert' THEN 5
        END AS experience_score
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
        AND s.experience_level IS NOT NULL
),
avg_scores AS (
    SELECT 
        festival_id,
        festival_name,
        year,
        ROUND(AVG(experience_score), 2) AS avg_experience
    FROM 
        tech_scores
    GROUP BY 
        festival_id, festival_name, year
)
SELECT 
    festival_name AS 'Festival',
    year AS 'Year',
    avg_experience AS 'Avg Technical Experience'
FROM 
    avg_scores
ORDER BY 
    avg_experience ASC
LIMIT 1;