-- LeetCode Problem: https://leetcode.com/problems/the-most-recent-three-orders/
-- PostgreSQL

/*
Επίλυση:
1. Χρησιμοποιούμε DENSE_RANK για να πάρουμε τις πιο πρόσφατες 3 παραγγελίες κάθε πελάτη.
2. Κάνουμε JOIN με τον πίνακα Customers για να εμφανίσουμε το όνομα του πελάτη.
3. Φιλτράρουμε όπου rank <= 3.
*/

WITH CTE AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rnk
    FROM Orders
)

SELECT 
    c.name AS customer_name, 
    cte.customer_id, 
    cte.order_id, 
    cte.order_date
FROM CTE
JOIN Customers c ON cte.customer_id = c.customer_id
WHERE rnk <= 3
ORDER BY customer_name, cte.customer_id, cte.order_date DESC;
