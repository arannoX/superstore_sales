-- Selecting the Superstore Sales database
USE SUPERSTORE_SALES_DB;

/*
Segment the Customers based on their Recency (R), Frequency (F) & Monetary (M)
*/

-- Creating a view named RFM_SCORE_DATA.
-- It calculates Recency, Frequency, and Monetary (RFM) values for each customer based on sales data.

CREATE OR REPLACE VIEW RFM_SCORE_DATA AS
WITH CUSTOMER_AGGREGATED_DATA AS
(SELECT
	CUSTOMER_ID,
    DATEDIFF((SELECT MAX(ORDER_DATE) FROM SALES_DATA), MAX(ORDER_DATE)) AS RECENCY_VALUE,
    COUNT(DISTINCT ORDER_ID) AS FREQUENCY_VALUE,
    ROUND(SUM(SALES),0) AS MONETARY_VALUE
FROM SALES_DATA
GROUP BY CUSTOMER_ID),

RFM_SCORE AS
(SELECT 
	C.*,
    NTILE(4) OVER (ORDER BY RECENCY_VALUE DESC) AS R_SCORE,
    NTILE(4) OVER (ORDER BY FREQUENCY_VALUE ASC) AS F_SCORE,
    NTILE(4) OVER (ORDER BY MONETARY_VALUE ASC) AS M_SCORE
FROM CUSTOMER_AGGREGATED_DATA AS C)

SELECT
	R.CUSTOMER_ID,
    R.RECENCY_VALUE,
    R_SCORE,
    R.FREQUENCY_VALUE,
    F_SCORE,
    R.MONETARY_VALUE,
    M_SCORE,
    (R_SCORE + F_SCORE + M_SCORE) AS TOTAL_RFM_SCORE,
    CONCAT_WS('', R_SCORE, F_SCORE, M_SCORE) AS RFM_SCORE_COMBINATION
FROM RFM_SCORE AS R;


-- Creating a view named RFM_ANALYSIS.
-- It categorizes customers based on their RFM score combinations.
-- The classification includes segments such as 'Churned Customer', 'Slipping Away', 'New Customers', 
-- 'Potential Churners', 'Active', and 'Loyal', helping in customer retention and marketing strategies.

CREATE OR REPLACE VIEW RFM_ANALYSIS AS
SELECT 
    RFM_SCORE_DATA.*,
    CASE
        WHEN RFM_SCORE_COMBINATION IN (111, 112, 121, 132, 211, 211, 212, 114, 141) THEN 'CHURNED CUSTOMER'
        WHEN RFM_SCORE_COMBINATION IN (133, 134, 143, 224, 334, 343, 344, 144) THEN 'SLIPPING AWAY, CANNOT LOSE'
        WHEN RFM_SCORE_COMBINATION IN (311, 411, 331) THEN 'NEW CUSTOMERS'
        WHEN RFM_SCORE_COMBINATION IN (222, 231, 221,  223, 233, 322) THEN 'POTENTIAL CHURNERS'
        WHEN RFM_SCORE_COMBINATION IN (323, 333,321, 341, 422, 332, 432) THEN 'ACTIVE'
        WHEN RFM_SCORE_COMBINATION IN (433, 434, 443, 444) THEN 'LOYAL'
    ELSE 'Other'
    END AS CUSTOMER_SEGMENT
FROM RFM_SCORE_DATA;
/*
Analyzes customer segments by:
1. Counting the number of customers in each segment.
2. Calculating the average monetary value per segment.
The results provide insights into customer distribution and spending behavior across different RFM categories.
*/
SELECT
	CUSTOMER_SEGMENT,
    COUNT(*) AS NUMBER_OF_CUSTOMERS,
    ROUND(AVG(MONETARY_VALUE),0) AS AVERAGE_MONETARY_VALUE
FROM RFM_ANALYSIS
GROUP BY CUSTOMER_SEGMENT;
/*
Findings from the Output:
Churned Customers (622 customers) have the lowest average monetary value (486), indicating minimal spending.
Loyal Customers (434 customers) have the highest average monetary value (8,502), demonstrating their significant contribution to revenue.
Potential Churners (350 customers) spend moderately (1,064), requiring retention strategies to prevent loss.
Slipping Away Customers (350 customers) have high spending (6,902), making them a critical segment to retain.
Active Customers (367 customers) spend an average of 950, indicating a stable mid-tier group.
New Customers (17 customers) have the lowest count and an average spend of 185, requiring nurturing to increase loyalty.
The "Other" category (563 customers) has an average monetary value of 3,233, likely consisting of mixed customer behaviors.
*/
