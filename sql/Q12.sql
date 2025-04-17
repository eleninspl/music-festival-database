-- -----------------------------------------------------
-- QUERY 12
-- -----------------------------------------------------

WITH daily_counts AS (
    SELECT 
        DATE(e.date) AS event_day,
        f.name AS festival_name,
        s.staff_type,
        COUNT(DISTINCT s.staff_id) AS staff_count
    FROM 
        EVENT_STAFF es
    JOIN 
        EVENT e ON es.event_id = e.event_id
    JOIN 
        FESTIVAL f ON e.festival_id = f.festival_id
    JOIN 
        STAFF s ON es.staff_id = s.staff_id
    GROUP BY 
        DATE(e.date), f.name, s.staff_type
),
totals AS (
    SELECT 
        event_day,
        festival_name,
        SUM(staff_count) AS total_staff
    FROM 
        daily_counts
    GROUP BY 
        event_day, festival_name
)
SELECT 
    d.event_day,
    d.festival_name,
    d.staff_type,
    d.staff_count,
    t.total_staff,
    ROUND(d.staff_count / t.total_staff * 100, 2) AS percentage
FROM 
    daily_counts d
JOIN 
    totals t 
    ON d.event_day = t.event_day 
    AND d.festival_name = t.festival_name
ORDER BY 
    d.event_day, d.festival_name, d.staff_type;
