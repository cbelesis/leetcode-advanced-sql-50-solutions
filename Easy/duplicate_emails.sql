-- LeetCode Problem: https://leetcode.com/problems/duplicate-emails/
-- PostgreSQL

/*
Επίλυση:
Ομαδοποιούμε τις εγγραφές με βάση το email και χρησιμοποιούμε HAVING για να κρατήσουμε μόνο όσα εμφανίζονται περισσότερες από μία φορές.
Επιστρέφουμε τη στήλη email με το alias "Email" όπως ζητείται στην εκφώνηση.
*/

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
