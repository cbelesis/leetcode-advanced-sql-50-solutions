-- LeetCode Problem: https://leetcode.com/problems/countries-you-can-safely-invest-in/
-- PostgreSQL

/*
Επίλυση:
Ενώνουμε τους πίνακες Country, Person και Calls για να υπολογίσουμε τον μέσο χρόνο διάρκειας κλήσεων ανά χώρα.
- Ενώνουμε Country με Person μέσω του country_code και του prefix του τηλεφώνου.
- Ενώνουμε τις κλήσεις όπου το άτομο είναι είτε καλών είτε καλούμενος.
- Ομαδοποιούμε κατά χώρα και κρατάμε όσες έχουν μέση διάρκεια > του συνολικού μέσου όρου όλων των κλήσεων.
*/

SELECT c.name AS country
FROM Country c
JOIN Person p ON c.country_code = LEFT(p.phone_number, 3)
JOIN Calls cl ON cl.caller_id = p.id OR cl.callee_id = p.id
GROUP BY c.name
HAVING AVG(cl.duration) > (
    SELECT AVG(duration)
    FROM Calls
);
