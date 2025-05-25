-- LeetCode Problem: https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
-- PostgreSQL

/*
Επίλυση:
Ομαδοποιούμε βάσει actor_id και director_id και φιλτράρουμε τα ζεύγη που έχουν συνεργαστεί τουλάχιστον 3 φορές.
Επιστρέφουμε μόνο τα αναγνωριστικά (IDs) των ηθοποιών και σκηνοθετών.
*/

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;
