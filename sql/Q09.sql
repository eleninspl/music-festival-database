-- -----------------------------------------------------
-- QUERY 9
-- -----------------------------------------------------

WITH visit_dates AS (
    SELECT 
        v.visitor_id,
        v.email,
        e.date AS event_date
    FROM 
        TICKET t
    JOIN 
        EVENT e ON t.event_id = e.event_id
    JOIN 
        VISITOR v ON t.visitor_id = v.visitor_id
),
rolling_windows AS (
    SELECT 
        v1.visitor_id,
        v1.email,
        COUNT(*) AS performances_attended
    FROM 
        visit_dates v1
    JOIN 
        visit_dates v2 ON v1.visitor_id = v2.visitor_id 
                      AND v2.event_date BETWEEN v1.event_date AND DATE_ADD(v1.event_date, INTERVAL 364 DAY)
    GROUP BY 
        v1.visitor_id, v1.event_date
),
best_window_per_visitor AS (
    SELECT 
        visitor_id,
        email,
        MAX(performances_attended) AS performances_attended
    FROM 
        rolling_windows
    GROUP BY 
        visitor_id
    HAVING 
        performances_attended > 3
),
grouped_counts AS (
    SELECT 
        performances_attended,
        GROUP_CONCAT(email SEPARATOR ', ') AS visitors,
        COUNT(*) AS number_of_visitors
    FROM 
        best_window_per_visitor
    GROUP BY 
        performances_attended
    HAVING 
        number_of_visitors > 1
)
SELECT 
    *
FROM 
    grouped_counts
ORDER BY 
    performances_attended DESC;
