-- LeetCode Problem: https://leetcode.com/problems/the-latest-login-in-2020/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε το μέγιστο login_date για κάθε user_id μόνο για το έτος 2020.
Χρησιμοποιούμε WHERE για φιλτράρισμα του έτους 2020 και GROUP BY user_id.
*/

SELECT user_id, MAX(login_date) AS latest_login
FROM Logins
WHERE EXTRACT(YEAR FROM login_date) = 2020
GROUP BY user_id;
