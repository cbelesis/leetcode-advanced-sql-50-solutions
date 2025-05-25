-- LeetCode Problem: https://leetcode.com/problems/department-highest-salary/
-- PostgreSQL

/*
Επίλυση:
Χρησιμοποιούμε ένα CTE για να υπολογίσουμε την κατάταξη (dense_rank)
των μισθών ανά department. Επιλέγουμε τους υπαλλήλους με τον υψηλότερο μισθό (rank = 1)
και επιστρέφουμε το όνομα του τμήματος, του υπαλλήλου και τον μισθό.
*/

WITH CTE AS (
    SELECT departmentId, id, name, salary,
           DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee
)
SELECT d.name AS Department, e.name AS Employee, e.salary
FROM Department d
JOIN CTE e ON d.id = e.departmentId
WHERE e.rnk = 1;
