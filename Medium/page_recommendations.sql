-- LeetCode Problem: https://leetcode.com/problems/page-recommendations/
-- PostgreSQL

/*
Επίλυση:
Χρησιμοποιούμε CTE για να έχουμε διπλής κατεύθυνσης φιλία (user1-user2 και user2-user1).
Βρίσκουμε τις σελίδες που έχουν κάνει like οι φίλοι του χρήστη 1, αλλά όχι ο ίδιος ο χρήστης.
Επιλέγουμε distinct recommended pages.
*/

WITH t1 AS (
    SELECT user1_id, user2_id
    FROM Friendship
    UNION
    SELECT user2_id, user1_id
    FROM Friendship
)
SELECT DISTINCT l.page_id AS recommended_page
FROM t1
JOIN Likes l ON t1.user2_id = l.user_id
WHERE t1.user1_id = 1
  AND l.page_id NOT IN (
      SELECT page_id
      FROM Likes
      WHERE user_id = 1
  );
