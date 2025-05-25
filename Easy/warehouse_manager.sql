-- LeetCode Problem: https://leetcode.com/problems/warehouse-manager/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε τον συνολικό όγκο (volume) κάθε αποθήκης πολλαπλασιάζοντας τις μονάδες (units) επί το μέγεθος (size) του προϊόντος.
Η πληροφορία για το μέγεθος έρχεται από το Common Table Expression (CTE), το οποίο περιέχει τα προϊόντα και τα μεγέθη τους.
Κάνουμε LEFT JOIN ώστε να περιλαμβάνονται όλες οι αποθήκες ακόμα και αν δεν αντιστοιχεί κάποιο προϊόν στο CTE.
Ομαδοποιούμε με βάση το όνομα της αποθήκης.
*/

SELECT name AS warehouse_name, 
       SUM(units * size) AS volume
FROM Warehouse w
LEFT JOIN Products c
  ON c.product_id = w.product_id
GROUP BY name;
