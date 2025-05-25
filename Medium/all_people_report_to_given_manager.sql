-- LeetCode Problem: https://leetcode.com/problems/all-people-report-to-the-given-manager/
-- MySQL version

/*
Επίλυση:
1. Θέλουμε όλους όσους αναφέρονται άμεσα ή έμμεσα σε manager με `employee_id = 1`.
2. Συνδέουμε τους Employees τρεις φορές:
   - e1: υπάλληλος
   - e2: manager του e1
   - e3: manager του manager (δηλαδή 2 επίπεδα πάνω)
3. Φιλτράρουμε ώστε ο manager του manager (e3) να είναι ο employee με id = 1.
4. Εξαιρούμε τον ίδιο τον manager 1 από τα αποτελέσματα.
*/

SELECT e1.employee_id
FROM Employees e1
JOIN Employees e2 ON e1.manager_id = e2.employee_id
JOIN Employees e3 ON e2.manager_id = e3.employee_id
WHERE e3.manager_id = 1 
  AND e1.employee_id != 1;
