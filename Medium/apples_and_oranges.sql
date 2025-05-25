-- LeetCode Problem: https://leetcode.com/problems/apples-oranges/
-- PostgreSQL

/*
Επίλυση:
Για κάθε ημερομηνία πώλησης (sale_date), υπολογίζουμε τη διαφορά των πωλήσεων μεταξύ apples και oranges.
Χρησιμοποιούμε δύο CASE WHEN μέσα σε SUM για να διαχωρίσουμε τα sold_num των apples και oranges,
και στη συνέχεια αφαιρούμε τα αντίστοιχα αθροίσματα.
Το αποτέλεσμα μετονομάζεται ως 'diff' και ταξινομείται κατά ημερομηνία.
*/

SELECT 
  sale_date, 
  SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE 0 END) - 
  SUM(CASE WHEN fruit = 'oranges' THEN sold_num ELSE 0 END) AS diff
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;
