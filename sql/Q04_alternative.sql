-- -----------------------------------------------------
-- QUERY 4: Μέσος όρος αξιολογήσεων για συγκεκριμένο καλλιτέχνη
-- -----------------------------------------------------

-- Απενεργοποίηση και επανενεργοποίηση του profiling για καθαρισμό
SET profiling = 0;
SET profiling = 1;

-- Create necessary indexes if they don't exist
CREATE INDEX IF NOT EXISTS idx_rating_performance_id ON RATING(performance_id);
CREATE INDEX IF NOT EXISTS idx_performance_performer_id ON PERFORMANCE(performer_id);
CREATE INDEX IF NOT EXISTS idx_performer_stage_name ON PERFORMER(stage_name);

-- -----------------------------------------------------
-- Original Query (Default Join Strategy)
-- -----------------------------------------------------
SELECT 'DEFAULT JOIN STRATEGY' AS 'Strategy';
EXPLAIN
SELECT 
    p.stage_name AS 'Performer',
    ROUND(AVG(r.artist_interpretation), 2) AS 'Avg Artist Interpretation',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    RATING r
JOIN 
    PERFORMANCE perf ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p ON perf.performer_id = p.performer_id
WHERE 
    p.stage_name = @artist_name
GROUP BY 
    p.performer_id;

-- Execute the original query
SELECT 
    p.stage_name AS 'Performer',
    ROUND(AVG(r.artist_interpretation), 2) AS 'Avg Artist Interpretation',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    RATING r
JOIN 
    PERFORMANCE perf ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p ON perf.performer_id = p.performer_id
WHERE 
    p.stage_name = @artist_name
GROUP BY 
    p.performer_id;

-- -----------------------------------------------------
-- Strategy 1: Nested Loop Join with STRAIGHT_JOIN
-- -----------------------------------------------------
SELECT 'NESTED LOOP JOIN STRATEGY' AS 'Strategy';
EXPLAIN
SELECT STRAIGHT_JOIN
    p.stage_name AS 'Performer',
    ROUND(AVG(r.artist_interpretation), 2) AS 'Avg Artist Interpretation',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    PERFORMER p
JOIN 
    PERFORMANCE perf USE INDEX (PRIMARY) ON p.performer_id = perf.performer_id
JOIN 
    RATING r USE INDEX (PRIMARY) ON perf.performance_id = r.performance_id
WHERE 
    p.stage_name = @artist_name
GROUP BY 
    p.performer_id;

-- Execute the nested loop join query
SELECT STRAIGHT_JOIN
    p.stage_name AS 'Performer',
    ROUND(AVG(r.artist_interpretation), 2) AS 'Avg Artist Interpretation',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    PERFORMER p
JOIN 
    PERFORMANCE perf USE INDEX (PRIMARY) ON p.performer_id = perf.performer_id
JOIN 
    RATING r USE INDEX (PRIMARY) ON perf.performance_id = r.performance_id
WHERE 
    p.stage_name = @artist_name
GROUP BY 
    p.performer_id;

-- -----------------------------------------------------
-- Strategy 2: Hash Join (using BNL - Block Nested Loop)
-- -----------------------------------------------------
SELECT 'HASH JOIN STRATEGY (BNL)' AS 'Strategy';
EXPLAIN
SELECT 
    p.stage_name AS 'Performer',
    ROUND(AVG(r.artist_interpretation), 2) AS 'Avg Artist Interpretation',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    PERFORMER p
JOIN 
    PERFORMANCE perf IGNORE INDEX (PRIMARY, idx_performance_performer_id) ON p.performer_id = perf.performer_id
JOIN 
    RATING r IGNORE INDEX (PRIMARY, idx_rating_performance_id) ON perf.performance_id = r.performance_id
WHERE 
    p.stage_name = @artist_name
GROUP BY 
    p.performer_id;

-- Execute the hash join query
SELECT 
    p.stage_name AS 'Performer',
    ROUND(AVG(r.artist_interpretation), 2) AS 'Avg Artist Interpretation',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    PERFORMER p
JOIN 
    PERFORMANCE perf IGNORE INDEX (PRIMARY, idx_performance_performer_id) ON p.performer_id = perf.performer_id
JOIN 
    RATING r IGNORE INDEX (PRIMARY, idx_rating_performance_id) ON perf.performance_id = r.performance_id
WHERE 
    p.stage_name = @artist_name
GROUP BY 
    p.performer_id;

-- -----------------------------------------------------
-- Strategy 3: Merge Join (using ordered indexes)
-- -----------------------------------------------------
SELECT 'MERGE JOIN STRATEGY' AS 'Strategy';
EXPLAIN
SELECT 
    p.stage_name AS 'Performer',
    ROUND(AVG(r.artist_interpretation), 2) AS 'Avg Artist Interpretation',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    PERFORMER p FORCE INDEX (idx_performer_stage_name)
JOIN 
    PERFORMANCE perf FORCE INDEX (idx_performance_performer_id) ON p.performer_id = perf.performer_id
JOIN 
    RATING r FORCE INDEX (idx_rating_performance_id) ON perf.performance_id = r.performance_id
WHERE 
    p.stage_name = @artist_name
GROUP BY 
    p.performer_id;

-- Execute the merge join query
SELECT 
    p.stage_name AS 'Performer',
    ROUND(AVG(r.artist_interpretation), 2) AS 'Avg Artist Interpretation',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    PERFORMER p FORCE INDEX (idx_performer_stage_name)
JOIN 
    PERFORMANCE perf FORCE INDEX (idx_performance_performer_id) ON p.performer_id = perf.performer_id
JOIN 
    RATING r FORCE INDEX (idx_rating_performance_id) ON perf.performance_id = r.performance_id
WHERE 
    p.stage_name = @artist_name
GROUP BY 
    p.performer_id;

-- Show profiling results
SELECT 'PROFILING RESULTS' AS 'Analysis';
SHOW PROFILES;

-- Εμφάνιση των αποτελεσμάτων profiling για κάθε στρατηγική
-- ΣΗΜΑΝΤΙΚΟ: Προσαρμόστε τους αριθμούς των ερωτημάτων με βάση τα αποτελέσματα του SHOW PROFILES
-- Τα παρακάτω είναι με βάση τα αποτελέσματα που μου στείλατε προηγουμένως

SELECT 'DETAILED PROFILING FOR DEFAULT JOIN' AS 'Analysis';
-- Το ερώτημα DEFAULT JOIN είναι το 6ο στη λίστα του SHOW PROFILES
SHOW PROFILE FOR QUERY 6;

SELECT 'DETAILED PROFILING FOR NESTED LOOP JOIN' AS 'Analysis';
-- Το ερώτημα NESTED LOOP JOIN είναι το 9ο στη λίστα του SHOW PROFILES
SHOW PROFILE FOR QUERY 9;

SELECT 'DETAILED PROFILING FOR HASH JOIN' AS 'Analysis';
-- Το ερώτημα HASH JOIN είναι το 12ο στη λίστα του SHOW PROFILES
SHOW PROFILE FOR QUERY 12;

SELECT 'DETAILED PROFILING FOR MERGE JOIN' AS 'Analysis';
-- Το ερώτημα MERGE JOIN είναι το 15ο στη λίστα του SHOW PROFILES
SHOW PROFILE FOR QUERY 15;

-- Disable profiling
SET profiling = 0;

-- Summary of findings
SELECT 'SUMMARY OF JOIN STRATEGIES' AS 'Analysis';
SELECT 
    'Default Join' AS 'Strategy',
    'Optimizer chooses best strategy' AS 'Description',
    'Baseline for comparison' AS 'Advantage',
    'May not always choose optimal plan' AS 'Disadvantage'
UNION ALL
SELECT 
    'Nested Loop Join' AS 'Strategy',
    'Good for small tables with indexes' AS 'Description',
    'Efficient when filtering reduces rows significantly' AS 'Advantage',
    'Poor performance on large tables without indexes' AS 'Disadvantage'
UNION ALL
SELECT 
    'Hash Join (BNL)' AS 'Strategy',
    'Good for large unindexed tables' AS 'Description',
    'Works well when indexes are missing' AS 'Advantage',
    'Memory intensive for large datasets' AS 'Disadvantage'
UNION ALL
SELECT 
    'Merge Join' AS 'Strategy',
    'Good when data is already sorted' AS 'Description',
    'Efficient for large sorted datasets' AS 'Advantage',
    'Requires sorted input or indexes' AS 'Disadvantage';