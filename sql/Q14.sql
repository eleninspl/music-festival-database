-- -----------------------------------------------------
-- QUERY 14
-- -----------------------------------------------------

WITH genre_year_counts AS (
    SELECT 
        g.name AS genre,
        YEAR(e.date) AS year,
        COUNT(*) AS appearances
    FROM 
        PERFORMANCE perf
    JOIN 
        PERFORMER_GENRE pg ON perf.performer_id = pg.performer_id
    JOIN 
        GENRE g ON pg.genre_id = g.genre_id
    JOIN 
        EVENT e ON perf.event_id = e.event_id
    GROUP BY 
        g.name, YEAR(e.date)
    HAVING 
        COUNT(*) >= 3
),
pairs AS (
    SELECT 
        g1.genre,
        g1.year AS year1,
        g2.year AS year2,
        g1.appearances
    FROM 
        genre_year_counts g1
    JOIN 
        genre_year_counts g2 
        ON g1.genre = g2.genre
        AND g2.year = g1.year + 1
        AND g1.appearances = g2.appearances
)
SELECT 
    genre,
    year1,
    year2,
    appearances
FROM 
    pairs
ORDER BY 
    genre, year1;
