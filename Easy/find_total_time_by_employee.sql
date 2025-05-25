-- LeetCode Problem: https://leetcode.com/problems/find-total-time-spent-by-each-employee/
-- PostgreSQL

/*
Επίλυση:
Ομαδοποιούμε τα δεδομένα ανά ημέρα (event_day) και υπάλληλο (emp_id).
Για κάθε ομάδα υπολογίζουμε το συνολικό χρόνο που εργάστηκε ο υπάλληλος αφαιρώντας την ώρα εισόδου από την ώρα εξόδου και αθροίζοντας.
*/

SELECT event_day AS day, 
       emp_id, 
       SUM(out_time - in_time) AS total_time
FROM Employees
GROUP BY event_day, emp_id;
