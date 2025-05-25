-- LeetCode Problem: https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges/
-- PostgreSQL

/*
Επίλυση:
1. Βρίσκουμε τη διαφορά `log_id - row_number()` για να εντοπίσουμε συνεχόμενες ακολουθίες.
2. Η διαφορά αυτή παραμένει σταθερή για συνεχόμενα log_ids.
3. Κάνουμε group by σε αυτή τη διαφορά για να εντοπίσουμε ranges.
*/

SELECT 
    MIN(log_id) AS start_id, 
    MAX(log_id) AS end_id
FROM (
    SELECT 
        log_id, 
        ROW_NUMBER() OVER (ORDER BY log_id) AS rn,
        log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS diff
    FROM Logs
) temp
GROUP BY diff;
