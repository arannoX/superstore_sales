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

