-- LeetCode Problem: https://leetcode.com/problems/immediate-food-delivery-i/
-- PostgreSQL

/*
Επίλυση:
Υπολογίζουμε το ποσοστό των παραγγελιών που παραδόθηκαν αμέσως, δηλαδή όταν η ημερομηνία παραγγελίας (order_date)
είναι ίδια με την προτιμώμενη ημερομηνία παράδοσης (customer_pref_delivery_date).
Χρησιμοποιούμε τη λογική έκφραση (order_date = customer_pref_delivery_date) η οποία επιστρέφει true/false και
μετατρέπεται σε 1/0 σε αριθμητικό πλαίσιο.
Τέλος, στρογγυλοποιούμε το αποτέλεσμα σε 2 δεκαδικά ψηφία.
*/

SELECT ROUND(SUM(order_date = customer_pref_delivery_date)::decimal / COUNT(*) * 100, 2) AS immediate_percentage
FROM Delivery;
