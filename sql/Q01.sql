-- -----------------------------------------------------
-- QUERY 1 
-- Festival revenue per year from ticket sales, 
-- with analysis by payment method and taking into account 
-- all categories
-- -----------------------------------------------------

SELECT 
    f.year AS 'Year',
    t.payment_method AS 'Payment Method',
    COUNT(t.ticket_id) AS 'Number of Tickets',
    SUM(t.price) AS 'Revenue by Payment Method',
    (
        SELECT SUM(t2.price)
        FROM TICKET t2
        JOIN EVENT e2 ON t2.event_id = e2.event_id
        JOIN FESTIVAL f2 ON e2.festival_id = f2.festival_id
        WHERE f2.year = f.year
    ) AS 'Total Revenue of the Year',
    ROUND(
        SUM(t.price) / (
            SELECT SUM(t2.price)
            FROM TICKET t2
            JOIN EVENT e2 ON t2.event_id = e2.event_id
            JOIN FESTIVAL f2 ON e2.festival_id = f2.festival_id
            WHERE f2.year = f.year
        ) * 100, 
        2
    ) AS 'Percentage of Total Revenue (%)'
FROM 
    TICKET t
JOIN 
    EVENT e ON t.event_id = e.event_id
JOIN 
    FESTIVAL f ON e.festival_id = f.festival_id
GROUP BY 
    f.year, t.payment_method
ORDER BY 
    f.year ASC, SUM(t.price) DESC;

