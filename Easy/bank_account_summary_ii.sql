-- LeetCode Problem: https://leetcode.com/problems/bank-account-summary-ii/
-- PostgreSQL

/*
Επίλυση:
Κάνουμε LEFT JOIN μεταξύ των πινάκων Users και Transactions χρησιμοποιώντας το account πεδίο.
Ομαδοποιούμε ανά λογαριασμό (account) και υπολογίζουμε το συνολικό ποσό (balance) για κάθε χρήστη.
Χρησιμοποιούμε HAVING για να φιλτράρουμε μόνο όσους έχουν balance > 10000.
*/

select name,sum(amount) balance
from Transactions t
join Users u
on t.account = u.account
group by name
having sum(amount)>10000
