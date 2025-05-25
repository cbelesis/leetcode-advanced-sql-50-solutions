-- LeetCode Problem: https://leetcode.com/problems/sellers-with-no-sales/
-- PostgreSQL

/*
Επίλυση:
Χρειαζόμαστε τους πωλητές (seller_id) που δεν έχουν κάνει καμία πώληση τον μήνα Αύγουστο του 2020.
Χρησιμοποιούμε LEFT JOIN μεταξύ Sellers και Orders και φιλτράρουμε για NULL εγγραφές στις παραγγελίες του συγκεκριμένου μήνα.
Αυτό εξασφαλίζει ότι ο πωλητής δεν εμφανίζεται καθόλου σε παραγγελίες του Αυγούστου 2020.
*/

SELECT s.seller_id
FROM Sellers s
LEFT JOIN Orders o
  ON s.seller_id = o.seller_id
  AND TO_CHAR(o.sale_date, 'YYYY-MM') = '2020-08'
WHERE o.seller_id IS NULL;
