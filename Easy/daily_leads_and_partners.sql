-- LeetCode Problem: https://leetcode.com/problems/daily-leads-and-partners/
-- PostgreSQL

/*
Επίλυση:
Για κάθε συνδυασμό ημερομηνίας και μάρκας (make), υπολογίζουμε:
- τον αριθμό μοναδικών leads (lead_id)
- τον αριθμό μοναδικών συνεργατών (partner_id)
Χρησιμοποιούμε GROUP BY σε date_id και make_name.
*/

SELECT 
  date_id, 
  make_name, 
  COUNT(DISTINCT lead_id) AS unique_leads, 
  COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY date_id, make_name;
