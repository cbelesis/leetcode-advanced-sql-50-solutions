-- LeetCode Problem: https://leetcode.com/problems/find-the-team-size/
-- PostgreSQL

/*
Επίλυση:
Για κάθε employee_id, χρησιμοποιούμε το window function COUNT(*) OVER(PARTITION BY team_id)
ώστε να υπολογίσουμε πόσα άτομα ανήκουν στην ίδια ομάδα (team_id).
Το αποτέλεσμα ταξινομείται κατά employee_id.
*/

SELECT employee_id, 
       COUNT(*) OVER(PARTITION BY team_id) AS team_size
FROM Employee
ORDER BY employee_id;
