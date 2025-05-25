-- LeetCode Problem: https://leetcode.com/problems/calculate-special-bonus/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε bonus μόνο για υπαλλήλους με περιττό employee_id και όνομα που δεν ξεκινά από 'M'.
Χρησιμοποιούμε CASE για να εφαρμόσουμε τον έλεγχο, αλλιώς επιστρέφουμε 0.
Το αποτέλεσμα ταξινομείται κατά employee_id.
*/

SELECT employee_id,
       CASE 
           WHEN employee_id % 2 = 1 AND name NOT LIKE 'M%' THEN salary 
           ELSE 0 
       END AS bonus
FROM Employees
ORDER BY employee_id;
