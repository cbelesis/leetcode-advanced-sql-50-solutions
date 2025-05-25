-- LeetCode Problem: https://leetcode.com/problems/rearrange-products-table/
-- PostgreSQL

/*
Επίλυση:
Κάνουμε unpivot τον πίνακα Products μετατρέποντας τις στήλες store1, store2, store3 σε γραμμές.
Χρησιμοποιούμε UNION για κάθε στήλη, εξαιρώντας τις null τιμές.
Κάθε εγγραφή περιλαμβάνει product_id, store (ως 'store1', 'store2', 'store3') και την τιμή (price).
*/

SELECT product_id, 'store1' AS store, store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION

SELECT product_id, 'store2' AS store, store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION

SELECT product_id, 'store3' AS store, store3 AS price
FROM Products
WHERE store3 IS NOT NULL;
