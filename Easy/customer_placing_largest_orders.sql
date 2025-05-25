-- LeetCode Problem: https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
-- PostgreSQL

/*
Επίλυση:
Ομαδοποιούμε τα δεδομένα με βάση τον πελάτη (customer_number) και μετράμε τον αριθμό των παραγγελιών του καθενός.
Ταξινομούμε φθίνουσα κατά το πλήθος των παραγγελιών και κρατάμε μόνο τον πρώτο (δηλαδή αυτόν με τις περισσότερες παραγγελίες).
*/

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;
