-- =========================================
-- Retail Sales Analysis - SQL Queries
-- =========================================

-- View full dataset
SELECT *
FROM sales;


-- 1. Revenue for each payment method
SELECT payment_method, SUM(total) AS total_sales
FROM sales
GROUP BY payment_method
ORDER BY total_sales DESC;


-- 2. Most preferred payment method (by transaction count)
SELECT payment_method, COUNT(*) AS transaction_count
FROM sales
GROUP BY payment_method
ORDER BY transaction_count DESC;


-- 3. Min, Max, Avg rating for each category
SELECT category,
       MIN(rating) AS min_rating,
       MAX(rating) AS max_rating,
       AVG(rating) AS avg_rating
FROM sales
GROUP BY category;


-- 4. Branch-wise performance
SELECT Branch,
       SUM(total) AS revenue,
       COUNT(*) AS total_transactions,
       AVG(rating) AS avg_rating
FROM sales
GROUP BY Branch
ORDER BY revenue DESC, avg_rating DESC;


-- 5. Avg rating by branch and category
SELECT Branch,
       Category,
       AVG(rating) AS avg_rating
FROM sales
GROUP BY Branch, Category
ORDER BY Branch;


-- 6. Top revenue by city and branch (Top 3)
SELECT City,
       Branch,
       SUM(total) AS revenue
FROM sales
GROUP BY City, Branch
ORDER BY revenue DESC
LIMIT 3;


-- 7. Category with highest revenue
SELECT Category,
       SUM(total) AS revenue
FROM sales
GROUP BY Category
ORDER BY revenue DESC;


-- 8. Time-based analysis (Time of Day classification)
SELECT time,
       CAST(time AS TIME) AS actual_time,
       CASE
           WHEN CAST(time AS TIME) < '12:00:00' THEN 'Morning'
           WHEN CAST(time AS TIME) >= '17:00:00' THEN 'Evening'
           ELSE 'Afternoon'
       END AS time_of_day
FROM sales;


-- 9. Top 3 revenue categories per branch
WITH cte AS (
    SELECT Branch,
           Category,
           SUM(total) AS revenue,
           RANK() OVER (PARTITION BY Branch ORDER BY SUM(total) DESC) AS rnk
    FROM sales
    GROUP BY Branch, Category
)
SELECT *
FROM cte
WHERE rnk <= 3;


-- 10. Top 2 revenue categories per branch
WITH t AS (
    SELECT Branch,
           Category,
           SUM(total) AS revenue,
           RANK() OVER (PARTITION BY Branch ORDER BY SUM(total) DESC) AS rnk
    FROM sales
    GROUP BY Branch, Category
)
SELECT *
FROM t
WHERE rnk <= 2;


-- 11. Cumulative revenue per branch over time
SELECT Branch,
       STR_TO_DATE(date, '%d/%m/%y') AS sale_date,
       SUM(total) OVER (PARTITION BY Branch ORDER BY STR_TO_DATE(date, '%d/%m/%y')) AS cumulative_revenue
FROM sales
ORDER BY sale_date, Branch;


-- 12. Percentage contribution of categories per branch
WITH cte AS (
    SELECT Branch,
           Category,
           SUM(total) AS revenue
    FROM sales
    GROUP BY Branch, Category
)
SELECT *,
       SUM(revenue) OVER (PARTITION BY Branch) AS branch_total_revenue,
       (revenue / SUM(revenue) OVER (PARTITION BY Branch)) * 100 AS revenue_percentage
FROM cte
ORDER BY Branch;


-- 13. High revenue but low rating categories
WITH cte AS (
    SELECT Branch,
           Category,
           SUM(total) AS revenue,
           AVG(rating) AS avg_rating
    FROM sales
    GROUP BY Branch, Category
),
final AS (
    SELECT *,
           SUM(revenue) OVER (PARTITION BY Branch) AS branch_revenue,
           AVG(avg_rating) OVER (PARTITION BY Branch) AS branch_avg_rating
    FROM cte
)
SELECT *
FROM final
WHERE avg_rating < branch_avg_rating
  AND revenue > 0.03 * branch_revenue;
