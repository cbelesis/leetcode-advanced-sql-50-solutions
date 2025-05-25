-- LeetCode Problem: https://leetcode.com/problems/friendly-movies-streamed-last-month/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε μοναδικούς τίτλους (title) που πληρούν τα εξής κριτήρια:
- Είναι παιδικό περιεχόμενο (Kids_content = 'Y')
- Είναι ταινίες (content_type = 'Movies')
- Προβλήθηκαν τον Ιούνιο του 2020 (program_date LIKE '2020-06%')
Χρησιμοποιούμε JOIN μεταξύ Content και TVProgram με βάση το content_id.
*/

SELECT DISTINCT title
FROM Content c
JOIN TVProgram t ON c.content_id = t.content_id
WHERE c.Kids_content = 'Y'
  AND c.content_type = 'Movies'
  AND t.program_date LIKE '2020-06%';
