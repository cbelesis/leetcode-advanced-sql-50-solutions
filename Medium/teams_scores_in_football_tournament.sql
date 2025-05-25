-- LeetCode Problem: https://leetcode.com/problems/team-scores-in-football-tournament/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε το συνολικό σκορ κάθε ομάδας από τους αγώνες. Κάθε ομάδα μπορεί να εμφανίζεται είτε ως team1 είτε ως team2.
Χρησιμοποιούμε UNION ALL για να ενώσουμε τα σκορ ως team_id από τις δύο στήλες (team1 και team2).
Ομαδοποιούμε και αθροίζουμε τα σκορ για κάθε ομάδα.
Ταξινομούμε κατά team_id.
*/

SELECT team_id, SUM(score) AS total_score
FROM (
    SELECT team1 AS team_id, team1_score AS score FROM Matches
    UNION ALL
    SELECT team2 AS team_id, team2_score AS score FROM Matches
) AS all_scores
GROUP BY team_id
ORDER BY team_id;
