-- LeetCode Problem: https://leetcode.com/problems/the-most-frequently-ordered-products-for-each-customer/
-- PostgreSQL

/*
Επίλυση:
1. Υπολογίζουμε για κάθε πελάτη πόσες φορές παρήγγειλε κάθε προϊόν (cte1).
2. Χρησιμοποιούμε DENSE_RANK για να βρούμε το πιο συχνά παραγγελθέν προϊόν ανά πελάτη (cte2).
3. Φιλτράρουμε τα προϊόντα με rank = 1 και κάνουμε join με Products για το όνομα προϊόντος.
*/

WITH cte1 AS (
    SELECT 
        customer_id, 
        product_id, 
        COUNT(product_id) AS count_product
    FROM Orders
    GROUP BY customer_id, product_id
),
cte2 AS (
    SELECT 
        customer_id, 
        product_id, 
        DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY count_product DESC) AS rnk
    FROM cte1
)

SELECT 
    c.customer_id, 
    c.product_id, 
    p.product_name
FROM cte2 c
JOIN Products p ON p.product_id = c.product_id
WHERE rnk = 1;
