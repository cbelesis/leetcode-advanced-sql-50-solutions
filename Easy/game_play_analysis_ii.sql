-- LeetCode Problem: https://leetcode.com/problems/game-play-analysis-ii/
-- PostgreSQL

/*
Επίλυση:
Χρησιμοποιούμε ένα υποερώτημα για να εντοπίσουμε την πρώτη μέρα (min event_date) 
που κάθε παίκτης έκανε log in.
Στο εξωτερικό ερώτημα επιλέγουμε τις αντίστοιχες γραμμές με βάση το player_id και την event_date.
*/

SELECT player_id, device_id
FROM Activity
WHERE (player_id, event_date) IN (
    SELECT player_id, MIN(event_date)
    FROM Activity
    GROUP BY player_id
);
