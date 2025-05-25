-- LeetCode Problem: https://leetcode.com/problems/biggest-window-between-visits/
-- MySQL version

/*
Επίλυση:
1. Για κάθε χρήστη, βρίσκουμε την επόμενη ημερομηνία επίσκεψης με LEAD.
2. Αν δεν υπάρχει επόμενη επίσκεψη, χρησιμοποιούμε default ημερομηνία '2021-01-01'.
3. Υπολογίζουμε τη διαφορά μεταξύ των ημερών.
4. Παίρνουμε τη μέγιστη διαφορά (biggest window) ανά χρήστη.
*/

WITH CTE AS (
    SELECT 
        user_id, 
        visit_date, 
        LEAD(visit_date, 1, '2021-01-01') OVER(PARTITION BY user_id ORDER BY visit_date) AS next_date
    FROM UserVisits
)

SELECT 
    user_id, 
    MAX(DATEDIFF(next_date, visit_date)) AS biggest_window
FROM CTE
GROUP BY user_id;
