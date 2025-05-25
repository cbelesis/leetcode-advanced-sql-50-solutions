-- LeetCode Problem: https://leetcode.com/problems/number-of-calls-between-two-persons/
-- PostgreSQL

/*
Επίλυση:
Χρησιμοποιούμε UNION ALL για να λάβουμε όλες τις κλήσεις και προς τις δύο κατευθύνσεις (from_id ↔ to_id),
ώστε να μετρήσουμε τον συνολικό αριθμό και διάρκεια κλήσεων μεταξύ κάθε ζεύγους.
Στη συνέχεια φιλτράρουμε ώστε from_id < to_id για να αποφύγουμε διπλές εγγραφές (π.χ. (1,2) και (2,1)).
Ομαδοποιούμε με βάση τα δύο άτομα και επιστρέφουμε πλήθος και συνολική διάρκεια.
*/

SELECT 
  from_id AS person1, 
  to_id AS person2, 
  COUNT(*) AS call_count, 
  SUM(duration) AS total_duration
FROM (
  SELECT from_id, to_id, duration FROM Calls
  UNION ALL
  SELECT to_id, from_id, duration FROM Calls
) t
WHERE from_id < to_id
GROUP BY from_id, to_id;
