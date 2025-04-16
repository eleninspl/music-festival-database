-- -----------------------------------------------------
-- QUERY 9
-- -----------------------------------------------------

WITH attendance_per_year AS (
    SELECT 
        v.visitor_id,
        v.email,
        YEAR(e.date) AS year,
        COUNT(DISTINCT t.event_id) AS performances_attended
    FROM 
        TICKET t
    JOIN 
        EVENT e ON t.event_id = e.event_id
    JOIN 
        VISITOR v ON t.visitor_id = v.visitor_id
    GROUP BY 
        v.visitor_id, YEAR(e.date)
    HAVING 
        performances_attended > 3
),
grouped AS (
    SELECT 
        performances_attended,
        GROUP_CONCAT(email SEPARATOR ', ') AS visitors,
        COUNT(*) AS number_of_visitors
    FROM 
        attendance_per_year
    GROUP BY 
        performances_attended
    HAVING 
        COUNT(*) > 1
)
SELECT 
    *
FROM 
    grouped;
