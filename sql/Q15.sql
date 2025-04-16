-- -----------------------------------------------------
-- QUERY 15
-- -----------------------------------------------------

WITH solo_scores AS (
    SELECT 
        v.visitor_id,
        v.first_name,
        v.last_name,
        a.artist_id,
        a.first_name AS artist_first,
        a.last_name AS artist_last,
        SUM(r.artist_interpretation) AS total_score
    FROM 
        RATING r
    JOIN 
        VISITOR v ON r.visitor_id = v.visitor_id
    JOIN 
        PERFORMANCE perf ON r.performance_id = perf.performance_id
    JOIN 
        ARTIST a ON perf.performer_id = a.performer_id  -- solo artist
    GROUP BY 
        v.visitor_id, a.artist_id
),
group_scores AS (
    SELECT 
        v.visitor_id,
        v.first_name,
        v.last_name,
        a.artist_id,
        a.first_name AS artist_first,
        a.last_name AS artist_last,
        SUM(r.artist_interpretation) AS total_score
    FROM 
        RATING r
    JOIN 
        VISITOR v ON r.visitor_id = v.visitor_id
    JOIN 
        PERFORMANCE perf ON r.performance_id = perf.performance_id
    JOIN 
        BAND b ON perf.performer_id = b.performer_id  -- this is a group
    JOIN 
        ARTIST_BAND ab ON b.band_id = ab.band_id
    JOIN 
        ARTIST a ON ab.artist_id = a.artist_id
    GROUP BY 
        v.visitor_id, a.artist_id
),
combined AS (
    SELECT * FROM solo_scores
    UNION ALL
    SELECT * FROM group_scores
)
SELECT 
    first_name,
    last_name,
    CONCAT(artist_first, ' ', artist_last) AS artist_name,
    SUM(total_score) AS total_score
FROM 
    combined
GROUP BY 
    visitor_id, artist_id
ORDER BY 
    total_score DESC
LIMIT 5;
