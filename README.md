# Superstore Sales Data Analysis

## Project Overview
This project aims to analyze sales data from a superstore to gain business insights. It involves database creation, data cleaning, exploratory data analysis (EDA), and customer segmentation using RFM (Recency, Frequency, and Monetary) analysis.

## Files in the Repository

### 1. **superstore_sales_data.csv**
   - This is the main dataset containing sales transactions.
   - It includes details such as order priority, discount, unit price, shipping cost, customer details, product details, profit, and sales figures.

### 2. **create_database_and_tables.sql**
   - Creates the `SUPERSTORE_SALES_DB` database.
   - Defines the `SALES_DATA` table with appropriate column types.
   - Establishes the schema to store transactional sales data.

### 3. **load_data.sql**
   - Loads the `superstore_sales_data.csv` into the `SALES_DATA` table using MySQL's `LOAD DATA INFILE` command.
   - Ensures data integrity by handling null values.

### 4. **clean_data.sql**
   - Cleans and preprocesses the dataset:
     - Converts date columns from Excel serial format to MySQL date format.
     - Removes duplicate records.
     - Identifies and imputes missing values for `PRODUCT_BASE_MARGIN`.
     - Standardizes categorical data by converting text to lowercase and trimming spaces.
     - Validates numerical values and ensures they are correctly formatted.

### 5. **EDA.sql**
   - Performs exploratory data analysis, including:
     - Summary statistics of sales and profit.
     - Analysis of order priority, shipping mode, and customer behavior.
     - Time-series analysis to identify seasonal trends.
     - Regional and managerial performance insights.
     - Impact of discounts on profitability.

### 6. **RFM_analysis.sql**
   - Conducts customer segmentation using RFM analysis:
     - Computes recency (time since last purchase), frequency (number of purchases), and monetary value (total spend).
     - Assigns RFM scores and segments customers into groups such as loyal, new, or at-risk.

## Methodology
1. **Data Acquisition:**
   - Sales transaction data is sourced from `superstore_sales_data.csv`.
2. **Database Setup:**
   - The MySQL database is created, and the schema is defined.
3. **Data Loading & Cleaning:**
   - The raw data is imported and processed to ensure quality and consistency.
4. **Exploratory Data Analysis (EDA):**
   - Key insights are derived from summary statistics, trend analysis, and customer behavior studies.
5. **Customer Segmentation (RFM Analysis):**
   - Customers are categorized based on purchasing patterns to enhance marketing strategies.

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

