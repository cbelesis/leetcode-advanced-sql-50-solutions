-- LeetCode: https://leetcode.com/problems/find-the-quiet-students-in-all-exams/
-- MySQL λύση

WITH CTE1 AS (
    SELECT exam_id, student_id, score,
        DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) AS rank_highest,
        DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score ASC) AS rank_lowest
    FROM Exam
),
CTE2 AS (
    SELECT student_id 
    FROM CTE1
    WHERE rank_highest = 1 OR rank_lowest = 1
),
CTE3 AS (
    SELECT DISTINCT student_id
    FROM Exam
    WHERE student_id NOT IN (SELECT student_id FROM CTE2)
)

SELECT student_id, student_name 
FROM Student
WHERE student_id IN (SELECT student_id FROM CTE3)
ORDER BY student_id;

