-- LeetCode Problem: https://leetcode.com/problems/employees-with-missing-information/
-- PostgreSQL

/*
Επίλυση:
Βρίσκουμε τους εργαζόμενους που υπάρχουν στον έναν πίνακα (Employees ή Salaries) αλλά όχι στον άλλο.
Χρησιμοποιούμε UNION για να ενώσουμε τα αποτελέσματα των δύο ερωτημάτων.
Ταξινομούμε κατά employee_id.
*/

SELECT employee_id
FROM Employees
WHERE employee_id NOT IN (
    SELECT employee_id FROM Salaries
)
UNION
SELECT employee_id
FROM Salaries
WHERE employee_id NOT IN (
    SELECT employee_id FROM Employees
)
ORDER BY 1;
