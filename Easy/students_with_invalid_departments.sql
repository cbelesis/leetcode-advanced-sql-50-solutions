-- LeetCode Problem: https://leetcode.com/problems/students-with-invalid-departments/
-- PostgreSQL

/*
Επίλυση:
Επιλέγουμε φοιτητές των οποίων το department_id δεν υπάρχει στον πίνακα Departments.
Αυτό το πετυχαίνουμε με ένα φίλτρο `NOT IN` σε υποερώτημα που περιέχει όλα τα έγκυρα department ids.
*/

SELECT id, name
FROM Students
WHERE department_id NOT IN (
    SELECT id
    FROM Departments
);
