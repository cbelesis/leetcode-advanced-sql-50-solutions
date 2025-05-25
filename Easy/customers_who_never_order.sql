-- LeetCode Problem: https://leetcode.com/problems/customers-who-never-order/
-- PostgreSQL

/*
Επίλυση:
Επιστρέφουμε τα ονόματα των πελατών που δεν έχουν κάνει καμία παραγγελία.
Χρησιμοποιούμε υποερώτημα με SELECT DISTINCT για να πάρουμε τα customerId από τον πίνακα Orders,
και κάνουμε έλεγχο με NOT IN στον πίνακα Customers.
*/

SELECT name AS Customers
FROM Customers
WHERE id NOT IN (
    SELECT DISTINCT customerId
    FROM Orders
);
