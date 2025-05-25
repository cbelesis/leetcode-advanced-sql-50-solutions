-- LeetCode Problem: https://leetcode.com/problems/leetflex-banned-accounts/
-- PostgreSQL

/*
Επίλυση:
Ενώνουμε τον πίνακα LogInfo με τον εαυτό του (self-join) με βάση το ίδιο account_id,
και ψάχνουμε περιπτώσεις όπου ένα account κάνει login από διαφορετική IP
κατά τη διάρκεια ήδη ενεργής περιόδου σύνδεσης (session).
Αυτό υποδεικνύει ύποπτη δραστηριότητα και πρέπει να απαγορευτεί.
*/

SELECT DISTINCT l1.account_id
FROM LogInfo l1 
JOIN LogInfo l2
  ON l1.account_id = l2.account_id
 AND l1.ip_address != l2.ip_address
 AND l1.login BETWEEN l2.login AND l2.logout;
