-- LeetCode Problem: https://leetcode.com/problems/customer-order-frequency/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε το ποσό που ξόδεψε κάθε πελάτης τον Ιούνιο και τον Ιούλιο 2020.
Χρησιμοποιούμε CTE για να συγκεντρώσουμε τις συνολικές δαπάνες ανά μήνα και φιλτράρουμε μόνο όσους ξόδεψαν ≥ 100 και στους δύο μήνες.
*/

WITH CTE AS (
  SELECT 
    c.customer_id, 
    c.name, 
    SUM(CASE WHEN LEFT(o.order_date, 7) = '2020-06' THEN p.price * o.quantity ELSE 0 END) AS june_spent,
    SUM(CASE WHEN LEFT(o.order_date, 7) = '2020-07' THEN p.price * o.quantity ELSE 0 END) AS july_spent
  FROM Customers c
  JOIN Orders o ON c.customer_id = o.customer_id
  JOIN Product p ON p.product_id = o.product_id
  GROUP BY c.customer_id, c.name
)
SELECT customer_id, name 
FROM CTE
WHERE june_spent >= 100 AND july_spent >= 100;
