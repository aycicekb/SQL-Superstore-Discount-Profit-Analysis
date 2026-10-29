
-- Exploring the minimum, average, and maximum values of the discount column
SELECT min(discount) as min_discount,
       avg(discount) as avg_discount,
       max(discount) as max_discount
FROM superstore
 /*
    min: 0%
    avg: 15%
    max: 80%
 */


-- Exploring the frequency of discount values
SELECT
   discount*100 as discount,
    COUNT(discount) as discount_frqncy
FROM superstore
GROUP BY discount 
ORDER BY discount_frqncy desc
/*
    0%  - 4798
    20% - 3657
    70% - 418
    80% - 300
    30% - 227
    40% - 206
    60% - 138
    10% - 94
    50% - 66
    15% - 52
    32% - 27
    45% - 11
*/

-- Exploring profit margins
SELECT
    discount,
    profit,
    CASE 
        WHEN sales = 0 THEN NULL
        ELSE (CAST(profit AS NUMERIC) / sales) * 100 
    END AS profit_margin
FROM superstore


-- Exploring average profit margin values in accordance with discounts
WITH profit_margin_table AS (
    SELECT
        ROUND(discount * 100) as discount,
        CASE 
            WHEN sales = 0 THEN NULL
            ELSE (CAST(profit AS NUMERIC) / sales) * 100 
        END AS profit_margin
    FROM superstore
)

SELECT
    discount,
    ROUND(AVG(profit_margin), 2) as avg_profit_margin
FROM profit_margin_table
GROUP BY discount
ORDER BY avg_profit_margin desc
/*
    0%  - 34.02%
    20% - 17.68%
    10% - 15.58%
    15% - 3.42%
    30% - -11.55%
    32% - -17.43%
    40% - -22.25%
    45% - -45.45%
    50% - -54.91%
    60% - -68.91%
    70% - -79.47%
    80% - -182.50%
*/


-- Exploring total profit and total profit margin
WITH profit_margin_table AS (
    SELECT
        sales,
        profit,
        ROUND(discount * 100) as discount,
        CASE 
            WHEN sales = 0 THEN NULL
            ELSE (CAST(profit AS NUMERIC) / sales) * 100 
        END AS profit_margin
    FROM superstore
)

SELECT 
    discount,
    COUNT(*) as row_count,
    ROUND(SUM(sales), 2) as sum_sales,
    ROUND(SUM(profit), 2) as sum_profit,
    ROUND((CAST(SUM(profit) AS NUMERIC)) / SUM(sales) * 100, 2) as sum_profit_margin
FROM profit_margin_table
GROUP BY discount
ORDER BY sum_profit desc
/*
|discount |sum_profit_margin |
    0%  - 29.51%
    10% - 16.61%
    20% - 11.82%
    15% - 5.15%
    30% - -10.05%
    32% - -16.50%
    40% - -19.81%
    50% - -34.80%
    45% - -45.45%
    60% - -89.66%
    70% - -98.66%
    80% - -180.03%
*/
