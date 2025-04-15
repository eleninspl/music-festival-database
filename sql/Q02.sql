-- Query 2: Find all artists belonging to a specific music genre with indication 
-- of whether they participated in festival events for a specific year

-- Set parameters (passed in via terminal or defined here)
--SET @genre_name := 'Rock';
--SET @festival_year := 2023;

-- Actual query
SELECT 
    p.stage_name AS 'Performer Name',
    g.name AS 'Genre',
    @festival_year AS 'Year',
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM PERFORMANCE perf
            JOIN EVENT e ON perf.event_id = e.event_id
            JOIN FESTIVAL f2 ON e.festival_id = f2.festival_id
            WHERE perf.performer_id = p.performer_id
              AND f2.year = @festival_year
        ) THEN 'Yes'
        ELSE 'No'
    END AS 'Participated in Festival'
FROM 
    PERFORMER p
JOIN 
    PERFORMER_GENRE pg ON p.performer_id = pg.performer_id
JOIN 
    GENRE g ON pg.genre_id = g.genre_id
JOIN 
    FESTIVAL f
WHERE 
    g.name = @genre_name
    AND f.year = @festival_year
GROUP BY 
    p.performer_id;
