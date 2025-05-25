-- LeetCode Problem: https://leetcode.com/problems/find-customers-with-positive-revenue-this-year/

/*
Επίλυση:
Φιλτράρω τις εγγραφές όπου το έτος είναι 2021 και το revenue είναι θετικό.
*/
-- PostgreSQL
SELECT customer_id
FROM Customers
WHERE year = 2021 AND revenue > 0;
