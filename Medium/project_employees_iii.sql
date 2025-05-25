-- LeetCode Problem: https://leetcode.com/problems/project-employees-iii/
-- PostgreSQL

/*
Επίλυση:
1. Χρησιμοποιούμε ένα CTE για να υπολογίσουμε τη σειρά εμπειρίας ανά project.
2. Επιλέγουμε εκείνους τους εργαζόμενους που έχουν τη μέγιστη εμπειρία ανά project.
*/

WITH CTE AS (
    SELECT 
        p.project_id, 
        p.employee_id, 
        e.experience_years, 
        DENSE_RANK() OVER (
            PARTITION BY p.project_id 
            ORDER BY e.experience_years DESC
        ) AS rnk
    FROM Project p
    LEFT JOIN Employee e ON p.employee_id = e.employee_id
)

SELECT project_id, employee_id
FROM CTE
WHERE rnk = 1;
