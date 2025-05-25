--https://leetcode.com/problems/find-the-subtasks-that-did-not-execute/
--PostgreSQL

-- Δημιουργούμε έναν αναδρομικό CTE που παράγει ακεραίους από 1 έως το μέγιστο subtasks_count που υπάρχει στον πίνακα Tasks
WITH RECURSIVE t(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1
    FROM t
    WHERE n < (SELECT MAX(subtasks_count) FROM Tasks)
),

-- Δημιουργούμε έναν πίνακα (cte) που για κάθε task δημιουργεί όλες τις πιθανές υποεργασίες του (subtask_id)
cte AS (
    SELECT 
        task_id, 
        n AS subtask_id,          -- Ο αριθμός του subtask (π.χ. 1, 2, ..., subtasks_count)
        subtasks_count
    FROM Tasks
    JOIN t ON n <= subtasks_count  -- Κρατάμε μόνο τις γραμμές όπου ο αριθμός είναι εντός ορίου
)

-- Τελική επιλογή: βρίσκουμε τα (task_id, subtask_id) που δεν υπάρχουν στον πίνακα Executed
SELECT 
    cte.task_id, 
    cte.subtask_id
FROM cte
LEFT JOIN Executed e 
    ON cte.task_id = e.task_id AND cte.subtask_id = e.subtask_id
WHERE e.task_id IS NULL  -- Αν δεν υπάρχει αντίστοιχη εγγραφή στην Executed, τότε το subtask δεν εκτελέστηκε
ORDER BY cte.task_id, cte.subtask_id;

