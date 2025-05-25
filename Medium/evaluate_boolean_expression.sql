-- LeetCode Problem: https://leetcode.com/problems/evaluate-boolean-expression/
-- PostgreSQL

/*
Επίλυση:
Κάνουμε JOIN τον πίνακα Expressions με δύο aliases του πίνακα Variables (l και r) για να πάρουμε τις τιμές των operands.
Στη συνέχεια χρησιμοποιούμε CASE για να συγκρίνουμε τις τιμές με βάση τον τελεστή (operator) και να επιστρέψουμε την τιμή 'true' ή 'false'.
*/

SELECT
e.left_operand,
e.operator,
e.right_operand,
CASE
WHEN e.operator = '>' AND l.value > r.value THEN 'true'
WHEN e.operator = '<' AND l.value < r.value THEN 'true'
WHEN e.operator = '=' AND l.value = r.value THEN 'true'
ELSE 'false'
END AS value
FROM Expressions e
JOIN Variables l ON l.name = e.left_operand
JOIN Variables r ON r.name = e.right_operand;