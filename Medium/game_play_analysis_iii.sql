-- LeetCode Problem: https://leetcode.com/problems/game-play-analysis-iii/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε το αθροιστικό σύνολο (cumulative sum) των games_played για κάθε player_id, 
ταξινομημένα κατά event_date.
*/

SELECT player_id, 
       event_date, 
       SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
FROM Activity;
