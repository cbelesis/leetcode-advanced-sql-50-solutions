-- LeetCode Problem: https://leetcode.com/problems/the-most-recent-orders-for-each-product/
-- PostgreSQL

/*
Επίλυση:
1. Χρησιμοποιούμε DENSE_RANK για να ταξινομήσουμε τις παραγγελίες ανά προϊόν κατά φθίνουσα σειρά ημερομηνίας.
2. Στο τελικό SELECT φιλτράρουμε ώστε να κρατήσουμε μόνο την πιο πρόσφατη παραγγελία για κάθε προϊόν.
*/

WITH CTE AS (
    SELECT 
        p.product_name, 
        o.product_id, 
        o.order_id, 
        o.order_date,
        DENSE_RANK() OVER (PARTITION BY o.product_id ORDER BY o.order_date DESC) AS rnk
    FROM Orders o
    LEFT JOIN Products p ON o.product_id = p.product_id
)

SELECT 
    product_name, 
    product_id, 
    order_id, 
    order_date
FROM CTE
WHERE rnk = 1
ORDER BY product_name, product_id, order_id;
