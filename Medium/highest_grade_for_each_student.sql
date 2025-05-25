-- LeetCode Problem: https://leetcode.com/problems/highest-grade-for-each-student/
-- PostgreSQL

/*
Επίλυση:
Για κάθε φοιτητή επιστρέφουμε την καταχώρηση με τη μεγαλύτερη βαθμολογία.
Αν υπάρχουν πολλαπλές εγγραφές με την ίδια μέγιστη βαθμολογία για έναν φοιτητή, επιλέγουμε την εγγραφή με το μικρότερο course_id.
Χρησιμοποιούμε ROW_NUMBER() για να αριθμήσουμε τις βαθμολογίες ανά φοιτητή κατά φθίνουσα σειρά βαθμολογίας και αύξουσα course_id.
Φιλτράρουμε όπου row_number = 1.
*/

WITH ranked_grades AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY student_id 
               ORDER BY grade DESC, course_id ASC
           ) AS rn
    FROM Enrollments
)
SELECT student_id, course_id, grade
FROM ranked_grades
WHERE rn = 1
ORDER BY student_id;
