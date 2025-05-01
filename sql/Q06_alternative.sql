-- -----------------------------------------------------
-- QUERY 6: Παραστάσεις που έχει παρακολουθήσει ένας επισκέπτης και μέσος όρος αξιολόγησης με ανάλυση
-- -----------------------------------------------------

-- Ενεργοποίηση του profiling
SET profiling = 1;

-- Δημιουργία απαραίτητων ευρετηρίων αν δεν υπάρχουν
CREATE INDEX IF NOT EXISTS idx_rating_performance_id ON RATING(performance_id);
CREATE INDEX IF NOT EXISTS idx_rating_visitor_id ON RATING(visitor_id);
CREATE INDEX IF NOT EXISTS idx_performance_performer_id ON PERFORMANCE(performer_id);
CREATE INDEX IF NOT EXISTS idx_visitor_email ON VISITOR(email);

-- -----------------------------------------------------
-- Original Query (Default Join Strategy)
-- -----------------------------------------------------
SELECT 'DEFAULT JOIN STRATEGY' AS 'Strategy';
EXPLAIN
SELECT 
    perf.performance_id AS 'Performance ID',
    p.stage_name AS 'Performer',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    RATING r
JOIN 
    PERFORMANCE perf ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p ON perf.performer_id = p.performer_id
JOIN 
    VISITOR v ON r.visitor_id = v.visitor_id
WHERE 
    v.email = @visitor_email
GROUP BY 
    r.performance_id, p.stage_name;

-- Εκτέλεση του αρχικού ερωτήματος
SELECT 
    perf.performance_id AS 'Performance ID',
    p.stage_name AS 'Performer',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    RATING r
JOIN 
    PERFORMANCE perf ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p ON perf.performer_id = p.performer_id
JOIN 
    VISITOR v ON r.visitor_id = v.visitor_id
WHERE 
    v.email = @visitor_email
GROUP BY 
    r.performance_id, p.stage_name;

-- -----------------------------------------------------
-- Strategy 1: Nested Loop Join with STRAIGHT_JOIN
-- -----------------------------------------------------
SELECT 'NESTED LOOP JOIN STRATEGY' AS 'Strategy';
EXPLAIN
SELECT STRAIGHT_JOIN
    perf.performance_id AS 'Performance ID',
    p.stage_name AS 'Performer',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    VISITOR v
JOIN 
    RATING r USE INDEX (PRIMARY) ON v.visitor_id = r.visitor_id
JOIN 
    PERFORMANCE perf USE INDEX (PRIMARY) ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p USE INDEX (PRIMARY) ON perf.performer_id = p.performer_id
WHERE 
    v.email = @visitor_email
GROUP BY 
    r.performance_id, p.stage_name;

-- Εκτέλεση του nested loop join query
SELECT STRAIGHT_JOIN
    perf.performance_id AS 'Performance ID',
    p.stage_name AS 'Performer',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    VISITOR v
JOIN 
    RATING r USE INDEX (PRIMARY) ON v.visitor_id = r.visitor_id
JOIN 
    PERFORMANCE perf USE INDEX (PRIMARY) ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p USE INDEX (PRIMARY) ON perf.performer_id = p.performer_id
WHERE 
    v.email = @visitor_email
GROUP BY 
    r.performance_id, p.stage_name;

-- -----------------------------------------------------
-- Strategy 2: Hash Join (using BNL - Block Nested Loop)
-- -----------------------------------------------------
SELECT 'HASH JOIN STRATEGY (BNL)' AS 'Strategy';
EXPLAIN
SELECT 
    perf.performance_id AS 'Performance ID',
    p.stage_name AS 'Performer',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    VISITOR v
JOIN 
    RATING r IGNORE INDEX (PRIMARY, idx_rating_visitor_id, idx_rating_performance_id) ON v.visitor_id = r.visitor_id
JOIN 
    PERFORMANCE perf IGNORE INDEX (PRIMARY, idx_performance_performer_id) ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p IGNORE INDEX (PRIMARY) ON perf.performer_id = p.performer_id
WHERE 
    v.email = @visitor_email
GROUP BY 
    r.performance_id, p.stage_name;

-- Εκτέλεση του hash join query
SELECT 
    perf.performance_id AS 'Performance ID',
    p.stage_name AS 'Performer',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    VISITOR v
JOIN 
    RATING r IGNORE INDEX (PRIMARY, idx_rating_visitor_id, idx_rating_performance_id) ON v.visitor_id = r.visitor_id
JOIN 
    PERFORMANCE perf IGNORE INDEX (PRIMARY, idx_performance_performer_id) ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p IGNORE INDEX (PRIMARY) ON perf.performer_id = p.performer_id
WHERE 
    v.email = @visitor_email
GROUP BY 
    r.performance_id, p.stage_name;

-- -----------------------------------------------------
-- Strategy 3: Merge Join (using ordered indexes)
-- -----------------------------------------------------
SELECT 'MERGE JOIN STRATEGY' AS 'Strategy';
EXPLAIN
SELECT 
    perf.performance_id AS 'Performance ID',
    p.stage_name AS 'Performer',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    VISITOR v FORCE INDEX (idx_visitor_email)
JOIN 
    RATING r FORCE INDEX (idx_rating_visitor_id) ON v.visitor_id = r.visitor_id
JOIN 
    PERFORMANCE perf FORCE INDEX (PRIMARY) ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p FORCE INDEX (PRIMARY) ON perf.performer_id = p.performer_id
WHERE 
    v.email = @visitor_email
GROUP BY 
    r.performance_id, p.stage_name;

-- Εκτέλεση του merge join query
SELECT 
    perf.performance_id AS 'Performance ID',
    p.stage_name AS 'Performer',
    ROUND(AVG(r.overall_impression), 2) AS 'Avg Overall Impression'
FROM 
    VISITOR v FORCE INDEX (idx_visitor_email)
JOIN 
    RATING r FORCE INDEX (idx_rating_visitor_id) ON v.visitor_id = r.visitor_id
JOIN 
    PERFORMANCE perf FORCE INDEX (PRIMARY) ON r.performance_id = perf.performance_id
JOIN 
    PERFORMER p FORCE INDEX (PRIMARY) ON perf.performer_id = p.performer_id
WHERE 
    v.email = @visitor_email
GROUP BY 
    r.performance_id, p.stage_name;

-- Εμφάνιση των αποτελεσμάτων profiling
SELECT 'PROFILING RESULTS' AS 'Analysis';
SHOW PROFILES;

-- Λεπτομερές profiling για κάθε στρατηγική
SELECT 'DETAILED PROFILING FOR DEFAULT JOIN' AS 'Analysis';
SHOW PROFILE FOR QUERY 5;

SELECT 'DETAILED PROFILING FOR NESTED LOOP JOIN' AS 'Analysis';
SHOW PROFILE FOR QUERY 9;

SELECT 'DETAILED PROFILING FOR HASH JOIN' AS 'Analysis';
SHOW PROFILE FOR QUERY 13;

SELECT 'DETAILED PROFILING FOR MERGE JOIN' AS 'Analysis';
SHOW PROFILE FOR QUERY 17;

-- Συνοπτικός πίνακας στρατηγικών
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

-- Απενεργοποίηση του profiling
SET profiling = 0;