-- LeetCode Problem: https://leetcode.com/problems/maximum-transaction-each-day/
-- PostgreSQL

/*
Επίλυση:
1. Για κάθε μέρα βρίσκουμε το μέγιστο ποσό.
2. Έπειτα επιλέγουμε όλα τα transaction_id που έχουν αυτή τη μέγιστη τιμή ανά μέρα.
*/

SELECT transaction_id
FROM Transactions
WHERE (day, amount) IN (
    SELECT day, MAX(amount)
    FROM Transactions
    GROUP BY day
)
ORDER BY transaction_id;
