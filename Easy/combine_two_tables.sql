-- LeetCode Problem: https://leetcode.com/problems/combine-two-tables/
-- PostgreSQL

/*
Επίλυση:
Χρειαζόμαστε έναν πίνακα με όλα τα άτομα από τον πίνακα Person, είτε έχουν παραγγελία είτε όχι.
Χρησιμοποιούμε LEFT JOIN για να ενώσουμε τους πίνακες Person και Address στη στήλη personId.
Αν δεν υπάρχει αντίστοιχη εγγραφή στη διεύθυνση, τα πεδία address θα είναι NULL.
*/

SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;
