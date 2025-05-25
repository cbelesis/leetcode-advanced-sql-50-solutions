-- LeetCode Problem: https://leetcode.com/problems/consecutive-available-seats/
-- PostgreSQL

/*
Επίλυση:
Εντοπίζουμε τα seat_id από τον πίνακα Cinema που είναι ελεύθερα (free = 1)
και έχουν τουλάχιστον ένα διπλανό κάθισμα (seat_id ± 1) που είναι επίσης ελεύθερο.
Χρησιμοποιούμε υποερωτήματα με IN για να ελέγξουμε τις γειτονικές θέσεις.
*/

SELECT seat_id
FROM Cinema
WHERE free = 1
  AND (
    seat_id - 1 IN (SELECT seat_id FROM Cinema WHERE free = 1)
    OR
    seat_id + 1 IN (SELECT seat_id FROM Cinema WHERE free = 1)
);
