-- LeetCode Problem: https://leetcode.com/problems/top-travellers/
-- PostgreSQL

/*
Επίλυση:
Χρειαζόμαστε το σύνολο των χιλιομέτρων που έχει διανύσει κάθε χρήστης (user_id), είτε έχει κάνει ταξίδια είτε όχι.
Χρησιμοποιούμε LEFT JOIN μεταξύ Users και Rides για να διατηρήσουμε και χρήστες χωρίς διαδρομές.
Ομαδοποιούμε κατά user_id και first_name, και παίρνουμε SUM των χιλιομέτρων, αντικαθιστώντας τα NULL με 0.
Ταξινομούμε πρώτα κατά φθίνουσα σειρά χιλιομέτρων και έπειτα αλφαβητικά.
*/

SELECT 
  u.name,
  COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name;
