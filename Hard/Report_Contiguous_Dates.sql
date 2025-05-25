--https://leetcode.com/problems/report-contiguous-dates/
--PostgreSQL

-- Ενώνουμε τα δεδομένα των πινάκων Failed και Succeeded σε ένα CTE
WITH cte1 AS (
    (
        SELECT fail_date AS event_date, 'failed' AS status
        FROM Failed
    )
    UNION ALL
    (
        SELECT success_date AS event_date, 'succeeded' AS status
        FROM Succeeded
    )
),

-- Εδώ κάνουμε το grouping για να βρούμε συνεχόμενες ημερομηνίες με το ίδιο status
cte2 AS (
    SELECT *,
        ROW_NUMBER() OVER (ORDER BY event_date) AS rn,  -- γενική αρίθμηση με βάση την ημερομηνία
        DENSE_RANK() OVER (PARTITION BY status ORDER BY event_date) AS rnk, -- αρίθμηση εντός κάθε status
        ROW_NUMBER() OVER (ORDER BY event_date) - DENSE_RANK() OVER (PARTITION BY status ORDER BY event_date) AS diff
        -- Το "κλειδί" για εύρεση συνεχόμενων ημερομηνιών με το ίδιο status είναι αυτή η διαφορά!
    FROM cte1
    WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'
)

-- Ομαδοποιούμε με βάση status και diff (όπου diff = ίδιο για συνεχόμενες)
-- και βρίσκουμε το start και end κάθε περιόδου
SELECT 
    status AS period_state, 
    MIN(event_date) AS start_date, 
    MAX(event_date) AS end_date
FROM cte2
GROUP BY status, diff
ORDER BY start_date;
