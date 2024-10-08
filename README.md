# Fetch - Data Analyst Take-Home Exercise

This project is part of a take-home assignment for a Data Analyst role at Fetch. The goal of this analysis is to explore, clean, and derive insights from product, user, and transaction data in order to identify key trends and address any data quality issues.

## Python Packages Used

The following Python packages were used in this project:

- `pandas`
- `numpy`
- `matplotlib`

Make sure to install these packages before running the notebook:
```bash
! pip install pandas numpy matplotlib
```

## First: explore the data

### Are there any data quality issues present?
1.   Missing Values

   *   In the product table, it's understandable that there are increasing missing values in Category 3 and 4, as not all products have subcategories. However, for the manufacturer and brand columns, there are 226,472 missing values, which makes it difficult to analyze brand information.

  *   In both the product and transaction tables, there are 4,025 and 5,762 missing values for barcodes, respectively. This leads to a significant loss of important product information, which may cause us to miss key insights when analyzing users' product preferences.
  * In the users table, the language column has 30,508 missing values. However, the Fetch App only supports two languages—English and Spanish. This makes me question the reason behind the large number of missing values.
2.   Duplicate Rows

 * There are 215 duplicate rows in the product table, indicating that some products may have been entered multiple times, which could lead to redundancy.
  * There are 171 duplicate rows in the transaction table, suggesting that some transactions might have been recorded more than once, potentially causing incorrect transaction totals.
  * I recommend dropping those duplicate values if it is confirmed that the rows in those tables are an confirmed issue, as this will help improve the accuracy of our analysis.

### Are there any fields that are challenging to understand?

1. The quantity columns in the transactions table should be of numeric data type, but there are many instances where string "zero" is used. It's unclear why "zero" is written as text instead of using 0 or null, which makes it difficult to understand the purpose.

2. In the transactions table, it seems that some receipt_id has two rows, with the differences being in either the quantity or sales columns. This is confusing and raises questions about why this discrepancy exists.

## Second: provide queries

Please refer to the [SQL queries](https://github.com/manling0713/fetch-data-analysis/tree/main/SQL%20queries) for the 3 questions below:
1. What are the top 5 brands by receipts scanned among users 21 and over?
2. What are the top 5 brands by sales among users that have had their account for at least six months?
3. Which is the leading brand in the Dips & Salsa category?

## Third: communicate with stakeholders

Hi,

I hope you're doing well. I’m Queenie from the Data Analytics team. I’ve just finished analyzing user, product, and transaction data, and I wanted to share some key observations along with a few questions and issues that need to be addressed before I can proceed with further analysis.<br><br>


**Data Quality Issues**
1. Missing Values


*   We have 226k missing brand and manufacturer values in the product tables, and 5,762 missing barcode values in the transaction tables. This is concerning as it limits our ability to analyze branding and product performance effectively.

* **Question**: Can you help clarify why we have such a large amount of missing product information? Is there a reason this data is unavailable, or is there an issue with how the information is captured when users scan receipts?

2. Missing Language Information

* There are over 30k missing values for language information in users table. Given that we currently support only two languages (English and Spanish), this should be easy to collect.

* **Question**: Is there a specific reason why we are missing language information for so many users?

3. Duplicate Data

* I found 215 duplicate rows in the product table and 171 duplicate rows in the transaction table. This suggests that we may be capturing the same records multiple times.
* **Question**: Do you know if this is due to how product and transaction data is being entered into the system? If these duplicates are confirmed to be an issue, I recommend we remove them to improve the quality of the dataset.
* Additionally, I noticed some transactions with the same receipt ID have slightly different details (such as quantity or sales amount).

* **Question**: Could you clarify the reason for this discrepancy? Is this intentional, or might there be an issue with how transactions are recorded?

**Interesting Findings:**

1.   Top Brands by Sales <br>
One of the key insights from the data is that CVS leads in total sales. This suggests that Fetch's collaboration with CVS, particularly the “30 points per dollar” promotion, has successfully influenced consumer preferences and boosted CVS’s sales.

2. Dips & Salsa Category <br>
In the Dips & Salsa category, Tostitos is the leading brand in terms of total sales. This indicates strong consumer interest in this product. Since we already collaborate with Tostitos, it might be worth exploring additional marketing campaigns with them to leverage the existing consumer interest.

Once we resolve these issues, I’ll be able to dive deeper into the data and provide more valuable insights. I look forward to your input, and please let me know if you need any further clarification. Thank you!<br><br>


Best regards,<br>
Queenie(Man-Ling) Chao
