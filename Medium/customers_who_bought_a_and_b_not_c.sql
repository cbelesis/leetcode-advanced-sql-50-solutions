-- LeetCode Problem: https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/
-- PostgreSQL

/*
Επίλυση:
Θέλουμε τους πελάτες που αγόρασαν προϊόντα A και B αλλά όχι C.
Χρησιμοποιούμε GROUP BY και HAVING για να ελέγξουμε τα προϊόντα που έχει αγοράσει κάθε πελάτης.
Αν το σύνολο περιέχει και τα δύο 'A' και 'B' αλλά όχι το 'C', τότε περιλαμβάνεται στο αποτέλεσμα.
*/

SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING 
    COUNT(DISTINCT CASE WHEN product_name = 'A' THEN 1 END) > 0 AND
    COUNT(DISTINCT CASE WHEN product_name = 'B' THEN 1 END) > 0 AND
    COUNT(DISTINCT CASE WHEN product_name = 'C' THEN 1 END) = 0;
