/* 
	What are the top 5 brands by sales among users that have had their account for at least six months?
*/
/* 
	Assumtions:
	- FINAL_SALE is assumed to represent the final amount paid for the product, which could include any discounts or adjustments.
	- We are including all the duplicate rows when calculating total sales because we haven't clarified the reason for the duplicates.
*/

-- Define a CTE to calculate total sales by brand
WITH sales_by_brand AS (
    SELECT
        p.BRAND
        , SUM(t.FINAL_SALE) AS total_sales  -- Calculate the total sales for each brand
    FROM trans t
    LEFT JOIN user u
    ON t.USER_ID = u.ID
    LEFT JOIN product p
    ON t.BARCODE = p.BARCODE
    WHERE u.CREATED_DATE <= DATE('now', '-6 months')  -- Only consider users who have had an account for at least 6 months
      AND p.BRAND IS NOT NULL  -- Exclude products with missing brand values
    GROUP BY p.BRAND
)

-- Select the brand and total sales from the CTE and order by total sales in descending order
SELECT
    BRAND
    , total_sales
FROM sales_by_brand
ORDER BY total_sales DESC
LIMIT 5;  -- Filter to get only the top 5 brands with highest sales