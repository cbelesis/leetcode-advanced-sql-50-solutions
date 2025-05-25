-- LeetCode Problem: https://leetcode.com/problems/tree-node/
-- PostgreSQL

/*
Επίλυση:
Κατηγοριοποιούμε κάθε node ως:
- 'Root' αν το p_id είναι null,
- 'Inner' αν το id εμφανίζεται ως p_id σε άλλο node (δηλαδή έχει παιδιά),
- 'Leaf' σε διαφορετική περίπτωση (κανένα παιδί).
*/

SELECT id,
       CASE 
         WHEN p_id IS NULL THEN 'Root'
         WHEN id IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'
         ELSE 'Leaf'
       END AS type
FROM Tree;
