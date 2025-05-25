-- LeetCode Problem: https://leetcode.com/problems/sales-person/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε τους πωλητές που **δεν έχουν κάνει πώληση** σε πελάτη από το "RED" city.
Χρησιμοποιούμε NOT IN με subquery που εντοπίζει τους πωλητές που πούλησαν σε "RED" πελάτες.
*/

select sp.name
from SalesPerson sp
where sales_id not in
    (select o.sales_id
    from Orders o
    where o.com_id in
        (select c.com_id 
        from Company c
        where c.name = 'RED'))