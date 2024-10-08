/* 
	Which is the leading brand in the Dips & Salsa category?
*/
/* 
	Assumtions:
	- A leading brand is defined as the brand with the most sales in the Dips & Salsa category.
	- We assume that each brand can only belong to one category. For example, TOSTITOS can only be under the Dips & Salsa category, not the Chips category.
*/

WITH sales_by_brand_category AS (
    -- Calculate total sales by brand in the Dips & Salsa category
    SELECT
        p.BRAND
        , SUM(t.FINAL_SALE) AS total_sales  -- Calculate the total sales for each brand
    FROM trans t
    LEFT JOIN user u
    ON t.USER_ID = u.ID
    LEFT JOIN product p
    ON t.BARCODE = p.BARCODE
    WHERE p.CATEGORY_1 = 'Dips & Salsa'  -- Filter for the 'Dips & Salsa' category
      OR p.CATEGORY_2 = 'Dips & Salsa'
      OR p.CATEGORY_3 = 'Dips & Salsa'
      OR p.CATEGORY_4 = 'Dips & Salsa'
      AND p.BRAND IS NOT NULL  -- Exclude products with missing brand values
    GROUP BY p.BRAND
)

-- Select the leading brand based on total sales
SELECT
    BRAND
    , total_sales
FROM sales_by_brand_category
ORDER BY total_sales DESC
LIMIT 1;  -- Limit to only the top brand