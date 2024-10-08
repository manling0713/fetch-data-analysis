/* 
   What are the top 5 brands by receipts scanned among users 21 and over? 
*/

/* Assumptions:
   - Each receipt may include multiple items, so we count the distinct occurrences of RECEIPT_ID rather than the total number of counts.
   - Since there are 6 brands with the same total of 2 receipts scanned, we use DENSE_RANK() to include all brands tied at the same rank, ensuring no brand is excluded from the top results.
*/

-- CTE to calculate the total number of receipts scanned per brand and the rank
WITH total_scanned AS(
  SELECT p.BRAND
      , COUNT(DISTINCT t.RECEIPT_ID) AS receipts_scanned 
      , RANK() OVER(ORDER BY COUNT(t.RECEIPT_ID) DESC) AS rnk -- Rank the brands based on total receipts scanned
  FROM trans t
  JOIN user u
  ON t.USER_ID = u.ID
  JOIN product p
  ON t.BARCODE = p.BARCODE
  WHERE u.BIRTH_DATE <= DATE('now', '-21 years') -- Filter for users 21 and older based on birth date
    AND p.BRAND IS NOT NULL -- Exclude the missing values
  GROUP BY p.BRAND
)

-- Query to retrieve top 5 brands based on scanned receipts
SELECT brand
  , receipts_scanned
FROM total_scanned
WHERE rnk <= 5; -- Filter to get only the top 5 brands