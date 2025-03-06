-- Selecting the Superstore Sales database  
USE SUPERSTORE_SALES_DB;

-- Loading bulk data using INFILE
SHOW VARIABLES LIKE 'secure_file_priv';

-- Loading bulk data using INFILE
-- Defining how data is structured in the CSV file  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_sales_data.csv'
INTO TABLE SALES_DATA
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' -- Each new line is treated as a new record
IGNORE 1 ROWS -- Skipping the first row as it contains column headers
(
    ROW_ID, ORDER_PRIORITY, DISCOUNT, UNIT_PRICE, SHIPPING_COST, CUSTOMER_ID, 
    CUSTOMER_NAME, SHIP_MODE, CUSTOMER_SEGMENT, PRODUCT_CATEGORY, PRODUCT_SUB_CATEGORY, 
    PRODUCT_CONTAINER, PRODUCT_NAME, @PRODUCT_BASE_MARGIN, REGION, MANAGER, 
    STATE_OR_PROVINCE, CITY, POSTAL_CODE, ORDER_DATE, SHIP_DATE, PROFIT, 
    QUANTITY_ORDERED_NEW, SALES, ORDER_ID, RETURN_STATUS
)

-- Setting NULL values for PRODUCT_BASE_MARGIN if the CSV contains empty values  
SET 
    PRODUCT_BASE_MARGIN = NULLIF(@PRODUCT_BASE_MARGIN, '');