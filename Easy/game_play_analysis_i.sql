-- LeetCode Problem: https://leetcode.com/problems/game-play-analysis-i/
-- PostgreSQL

/*
Επίλυση:
Βρίσκουμε όλους τους players που έπαιξαν στο παιχνίδι με game_mode = 'Solo'.
Αφαιρούμε όσους είναι επίσης στο παιχνίδι με game_mode = 'Solo Ranked'.
Χρησιμοποιούμε DISTINCT για να αποφύγουμε διπλότυπα.
*/

select player_id, min(event_date) as first_login
from Activity
group by 1;
