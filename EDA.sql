-- Selecting the Superstore Sales database
USE SUPERSTORE_SALES_DB;

-- **** Part 1. Data Overview: After Cleaning the Dataset **** 

-- Counting the total number of rows in the table  
SELECT 
    COUNT(*) AS TOTAL_ROWS
FROM
    SALES_DATA; -- Expected: 9426 rows, Found: 9426 rows

-- Counting the number of unique orders based on ORDER_ID  
SELECT 
    COUNT(DISTINCT ORDER_ID) AS UNIQUE_ORDERS
FROM
    SALES_DATA; -- Unique Orders: 6455

-- Calculating the number of duplicate orders by subtracting unique orders from total rows  
SELECT 
    COUNT(*) - COUNT(DISTINCT ROW_ID) AS DUPLICATE_ROW
FROM
    SALES_DATA; -- No duplicate rows

-- Retrieving column names and data types for the specified table  
SELECT 
    COLUMN_NAME, DATA_TYPE
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'SALES_DATA';

-- **** Part 2. Statistical Summary ****

--  Statistical Summary of Sales and Profit
SELECT 
    ROUND(MIN(SALES), 2) AS MIN_SALES,
    ROUND(MAX(SALES), 2) AS MAX_SALES,
    ROUND(AVG(SALES), 2) AS AVG_SALES,
    ROUND(STDDEV(SALES), 2) AS STD_SALES,
    ROUND(MIN(PROFIT), 2) AS MIN_PROFIT,
    ROUND(MAX(PROFIT), 2) AS MAX_PROFIT,
    ROUND(AVG(PROFIT), 2) AS AVG_PROFIT,
    ROUND(STDDEV(PROFIT), 2) AS STD_PROFIT
FROM
    SALES_DATA;

-- **** Part 3. Categorical Data Analysis ****

SELECT 
    ORDER_PRIORITY, COUNT(*) AS COUNT
FROM
    SALES_DATA
GROUP BY ORDER_PRIORITY
ORDER BY COUNT DESC;

SELECT 
    SHIP_MODE, COUNT(*) AS COUNT
FROM
    SALES_DATA
GROUP BY SHIP_MODE
ORDER BY COUNT DESC;

-- **** Part 4. Order & Customer Behavior ****

-- Top 10 Customers according to sales
SELECT 
    CUSTOMER_ID,
    ROUND(SUM(SALES), 2) AS TOTAL_SALES,
    ROUND(SUM(PROFIT), 2) AS TOTAL_PROFIT
FROM
    SALES_DATA
GROUP BY CUSTOMER_ID
ORDER BY TOTAL_SALES DESC
LIMIT 10;

-- Retrieving the total number of unique customers and total sales for each customer segment, 
-- ordered by total sales in descending order.
SELECT 
    CUSTOMER_SEGMENT,
    COUNT(DISTINCT CUSTOMER_ID) AS TOTAL_CUSTOMERS,
    ROUND(SUM(SALES), 2) AS TOTAL_SALES,
    ROUND(SUM(PROFIT), 2) AS PROFIT
FROM
    SALES_DATA
GROUP BY CUSTOMER_SEGMENT
ORDER BY PROFIT DESC;
/*
Findings: 
Corporate is the most dominant and profitable segment.
Small Business has lower sales but good profitability.
Consumer Segment struggles with lower profits despite decent sales.
*/

-- **** Part 5. Time Series Analysis ****

SELECT 
    YEAR(ORDER_DATE) AS ORDER_YEAR,
    MONTH(ORDER_DATE) AS ORDER_MONTH,
    ROUND(SUM(SALES), 2) AS TOTAL_SALES,
    ROUND(SUM(PROFIT), 2) AS TOTAL_PROFIT
FROM
    SALES_DATA
GROUP BY ORDER_YEAR , ORDER_MONTH
ORDER BY ORDER_YEAR , ORDER_MONTH;

-- Identifying the top-selling month across all years  
WITH BEST_SELLING_MONTH AS (
    SELECT 
        MONTH(ORDER_DATE) AS ORDER_MONTH,
        ROUND(SUM(SALES), 2) AS TOTAL_SALES,
        ROUND(SUM(PROFIT), 2) AS TOTAL_PROFIT
    FROM SALES_DATA
    GROUP BY ORDER_MONTH
)

SELECT ORDER_MONTH, TOTAL_SALES, TOTAL_PROFIT 
FROM BEST_SELLING_MONTH 
ORDER BY TOTAL_SALES DESC;
/*
Finding:
Q4 (October, November, December) is the most profitable quarter, with consistently high sales and profit.
February and March are the weakest months, with low sales and March even incurring losses.
Sales and profit do not always align (e.g., September has high sales but lower profit, while December has strong profitability).
*/

-- ****Part 6. Shipping****

-- Counting Orders for each shiping mode
SELECT SHIP_MODE, COUNT(*) AS ORDER_COUNT 
FROM SALES_DATA 
GROUP BY SHIP_MODE 
ORDER BY ORDER_COUNT DESC;
/*
### Findings:

1. Regular Air is the most frequently used shipping mode, with 7,036 orders.
2. Delivery Truck is used for 1,283 orders, making it the second most common mode.
3. Express Air has the lowest usage, with 1,107 orders.
4. The high preference for Regular Air suggests that customers prioritize a balance between speed and cost.
5. The lower count for Express Air could indicate that fewer customers opt for premium, faster shipping options.
6. Delivery Truck usage is moderate, likely due to regional or cost-related preferences.
*/

-- Checking average shipping cost for each region and the difference between highest and lowest
WITH SHIPPING_COSTS AS (
    SELECT 
        REGION, 
        ROUND(AVG(SHIPPING_COST), 2) AS AVG_SHIPPING_COST
    FROM SALES_DATA
    GROUP BY REGION
)
SELECT 
    REGION, 
    AVG_SHIPPING_COST,
    ROUND((MAX(AVG_SHIPPING_COST) OVER () - MIN(AVG_SHIPPING_COST) OVER ()),2) AS DIFF_HIGHEST_LOWEST
FROM SHIPPING_COSTS
ORDER BY AVG_SHIPPING_COST DESC;
/*
Findings:
The East region has the highest shipping cost on average.
The South region has the lowest shipping cost.
The difference between maximum and minimum shipping cost is 1.34.
*/

-- Checking average delivery time
SELECT 
    ROUND(AVG(DATEDIFF(SHIP_DATE, ORDER_DATE)), 0) AS AVG_DELIVERY_DAYS
FROM
    SALES_DATA; -- Findings: Average Delivery Days 2

-- **** Part 7. Discounts ****

-- Calculating the average profit for each discount level.
SELECT DISCOUNT, ROUND(AVG(PROFIT),2) AS AVG_PROFIT 
FROM SALES_DATA 
GROUP BY DISCOUNT 
ORDER BY DISCOUNT;

/*
Findings:
Break-even or loss starts at a 16% discount (AVG_PROFIT = -74.51).
The worst loss occurs at 25% discount (AVG_PROFIT = -481.04).
*/

-- Part 8. Regional & Manager Analysis

-- Calculating total sales and total profit for each region
SELECT REGION, ROUND(SUM(SALES),2) AS TOTAL_SALES, ROUND(SUM(PROFIT),2) AS TOTAL_PROFIT 
FROM SALES_DATA 
GROUP BY REGION 
ORDER BY TOTAL_SALES DESC;
/*
Findings:
Central region is the most profitable, generating the highest total profit.
East and West regions have similar sales figures, but East has a higher profit, suggesting better margin control.
South region struggles the most, both in sales and profit, requiring further investigation.
*/

-- Calculateing the total sales and total profit for each manager
SELECT MANAGER, ROUND(SUM(SALES),2) AS TOTAL_SALES, ROUND(SUM(PROFIT),2) AS TOTAL_PROFIT
FROM SALES_DATA 
GROUP BY MANAGER 
ORDER BY TOTAL_SALES DESC;

/*
Findings:
Chris is the top performer in both total sales and profit.
Despite lower sales, Erin has a higher profit than William, suggesting Erin might have better profit margins.
Sam's performance is the weakest, both in terms of sales and profit.
*/
