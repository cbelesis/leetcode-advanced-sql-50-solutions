-- LeetCode Problem: https://leetcode.com/problems/grand-slam-titles/
-- PostgreSQL

/*
Επίλυση:
Για κάθε παίκτη υπολογίζουμε το πλήθος των grand slam τίτλων που έχει κερδίσει σε όλα τα τουρνουά,
χρησιμοποιώντας SUM με CASE για κάθε τουρνουά.
Φιλτράρουμε να δείξουμε μόνο παίκτες με τουλάχιστον έναν τίτλο.
*/

SELECT p.player_id, 
       p.player_name,
       SUM(
           (CASE WHEN p.player_id = c.Wimbledon THEN 1 ELSE 0 END) +
           (CASE WHEN p.player_id = c.Fr_open THEN 1 ELSE 0 END) +
           (CASE WHEN p.player_id = c.US_open THEN 1 ELSE 0 END) +
           (CASE WHEN p.player_id = c.Au_open THEN 1 ELSE 0 END)
       ) AS grand_slams_count
FROM Players p 
CROSS JOIN Championships c
GROUP BY p.player_id
HAVING SUM(
           (CASE WHEN p.player_id = c.Wimbledon THEN 1 ELSE 0 END) +
           (CASE WHEN p.player_id = c.Fr_open THEN 1 ELSE 0 END) +
           (CASE WHEN p.player_id = c.US_open THEN 1 ELSE 0 END) +
           (CASE WHEN p.player_id = c.Au_open THEN 1 ELSE 0 END)
       ) > 0;
