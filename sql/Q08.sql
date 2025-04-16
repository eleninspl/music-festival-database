-- -----------------------------------------------------
-- QUERY 8
-- -----------------------------------------------------

SELECT 
    s.staff_id,
    s.first_name,
    s.last_name
FROM 
    STAFF s
WHERE 
    s.staff_type = 'auxiliary'
    AND s.staff_id NOT IN (
        SELECT es.staff_id
        FROM EVENT_STAFF es
        JOIN EVENT e ON es.event_id = e.event_id
        WHERE DATE(e.date) = @target_date
    );
