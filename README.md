# Superstore Sales Data Analysis


## Project Overview
This project analyzes transactional data from a retail superstore to uncover key insights related to sales performance, customer segmentation, and profitability. Using SQL-based data processing, we conducted extensive data cleaning, exploratory data analysis (EDA), and customer retention analysis through RFM segmentation. The findings provide strategic recommendations for optimizing sales, discount strategies, and customer retention efforts.

## Files in the Repository
- `superstore_sales_data.csv`: Raw dataset containing transactional sales data.
- `load_data.sql`: SQL script for loading data into a MySQL database.
- `clean_data.sql`: SQL script for cleaning and standardizing data.
- `EDA.sql`: SQL queries for exploratory data analysis.
- `RFM_analysis.sql`: SQL script for conducting RFM analysis and customer segmentation.


## Methodology

### Data Collection
The dataset used in this project is the `superstore_sales_data.csv`, which contains transactional data from a retail superstore. The data was loaded into a MySQL database using `load_data.sql`. The key steps involved in data collection were:

- Creating the `SUPERSTORE_SALES_DB` database.
- Defining the `SALES_DATA` table structure.
- Loading data using the MySQL `LOAD DATA INFILE` method.

### Data Cleaning
Data cleaning was performed using `clean_data.sql` to ensure consistency and accuracy. The following key operations were conducted:

- Converted `ORDER_DATE` and `SHIP_DATE` from Excel serial format to MySQL `DATE` format.
- Checked for duplicate `ROW_ID`s and found none.
- Identified and handled missing values, particularly imputing `PRODUCT_BASE_MARGIN` using the average per `PRODUCT_SUB_CATEGORY`.
- Standardized text-based categorical values by converting them to lowercase and trimming spaces.
- Rounded numerical values to two decimal places for consistency.
- Validated data integrity by ensuring no negative `QUANTITY_ORDERED_NEW` values.

### Exploratory Data Analysis (EDA)
EDA was conducted using `EDA.sql` to uncover key insights and trends within the dataset. This involved:

- Statistical summaries of key metrics such as sales and profit.
- Analysis of categorical data, including `ORDER_PRIORITY`, `SHIP_MODE`, and `CUSTOMER_SEGMENT`.
- Identification of top customers, trends in sales across different months, and the impact of discounts on profitability.

### RFM Analysis
To segment customers, `RFM_analysis.sql` was used to calculate Recency (R), Frequency (F), and Monetary (M) scores:

- **Recency:** Days since the last purchase.
- **Frequency:** Number of distinct orders per customer.
- **Monetary:** Total sales per customer.

Customers were segmented into categories like 'Loyal', 'New', 'Slipping Away', and 'Churned' for targeted marketing efforts.


## Requirements
- MySQL Server 8.0 or later
- A compatible SQL client (MySQL Workbench, DBeaver, etc.)
- Access to `superstore_sales_data.csv`

## How to Use
1. **Set up the database:**
   - Run `create_database_and_tables.sql` to create the database and tables.
2. **Load the data:**
   - Execute `load_data.sql` to insert data into the database.
3. **Clean the data:**
   - Run `clean_data.sql` to process and format the dataset.
4. **Perform EDA:**
   - Execute `EDA.sql` to generate insights from the dataset.
5. **Run Customer Segmentation:**
   - Execute `RFM_analysis.sql` to classify customers based on their purchasing behavior.

## Insights and Findings
- Q4 (October to December) is the most profitable quarter.
- Corporate customers are the most valuable segment.
- Discounts beyond 16% significantly impact profitability.
- The Central region contributes the highest profit.
- Regular Air is the most preferred shipping mode.
- RFM segmentation helps identify loyal and at-risk customers for better targeting.

## Conclusion
This project provides a structured approach to analyzing superstore sales data, helping businesses make data-driven decisions for pricing, inventory, and customer engagement.

