-- LeetCode Problem: https://leetcode.com/problems/shortest-distance-in-a-line/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε το απόλυτο μήκος της διαφοράς των x συντεταγμένων για κάθε ζεύγος διαφορετικών σημείων.
Χρησιμοποιούμε CROSS JOIN για να πάρουμε όλα τα ζεύγη σημείων.
Επιλέγουμε τη μικρότερη απόσταση (MIN).
*/

SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point p1
CROSS JOIN Point p2
WHERE p1.x != p2.x;
