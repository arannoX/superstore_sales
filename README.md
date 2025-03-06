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

## Insights & Findings

### 1. Sales & Profit Trends
- **Highest Sales Month:** Q4 (October-December) had the highest sales and profitability.
- **Weakest Months:** February and March had the lowest sales, with March even showing losses.
- **Sales vs. Profit Misalignment:** Some months, like September, had high sales but lower profit margins.

### 2. Customer Segmentation
- **Corporate Segment:** The most dominant and profitable segment.
- **Small Business:** Lower sales but relatively good profitability.
- **Consumer Segment:** Despite decent sales, profitability was lower, indicating potential inefficiencies or higher discounting.

### 3. Order & Shipping Behavior
- **Most Used Shipping Mode:** Regular Air (7,036 orders), indicating a preference for speed at a moderate cost.
- **Least Used Shipping Mode:** Express Air (1,107 orders), suggesting fewer customers opt for premium fast shipping.
- **Average Delivery Time:** 2 days across all orders.
- **Regional Shipping Costs:** The East region had the highest shipping costs, while the South had the lowest.

### 4. Discounts & Profitability
- **Break-even Point:** Discounts beyond 16% led to losses.
- **Worst Discount Level:** 25% discount resulted in the worst average profit (-$481.04).

### 5. Regional & Manager Performance
- **Top Performing Region:** The Central region generated the highest profit.
- **Struggling Region:** The South region had the lowest sales and profit.
- **Best Performing Manager:** Chris led in both sales and profit.
- **Least Performing Manager:** Sam had the lowest sales and profit, indicating a need for strategy improvement.

### 6. Customer Retention (RFM Analysis)
Customer retention was evaluated using the Recency, Frequency, and Monetary (RFM) model to classify customers based on their purchasing behavior. This segmentation enables businesses to tailor retention strategies effectively:

- **Loyal Customers:** High-value customers with frequent purchases. Retention efforts should include personalized experiences, early access to promotions, and loyalty rewards.
- **Slipping Away Customers:** Previously engaged customers with declining activity. Re-engagement tactics such as exclusive discounts, personalized outreach, and reminder campaigns should be employed.
- **Churned Customers:** Customers with minimal engagement and low spending. Win-back strategies, special reactivation offers, and targeted marketing can help revive interest.

By leveraging RFM analysis, businesses can design data-driven customer retention strategies that enhance engagement, foster loyalty, and maximize customer lifetime value.


## Recommendations Based on Insights & Findings

### Optimize Discount Strategies
- Maintain discounts below 16% to prevent profit erosion.
- Offer strategic discounts to high-value customers rather than across all customer segments.

### Improve Regional Performance
- Investigate the challenges faced by the South region and implement targeted sales strategies.
- Leverage successful strategies from the Central region to improve weaker regions.

### Enhance Shipping Efficiency
- Explore cost-effective shipping options for the East region.
- Encourage customers to consolidate orders to optimize shipping costs.

### Managerial Training & Strategy
- Provide additional training and resources for underperforming managers like Sam.
- Encourage knowledge sharing between high-performing and struggling managers to improve overall sales and profitability.

### Strengthen Customer Retention
- Develop personalized marketing campaigns for loyal and slipping-away customers.
- Offer incentives such as exclusive deals or early access to products for high-frequency customers.

## Conclusion
The analysis provides actionable insights for optimizing sales, refining discount strategies, improving customer retention, and enhancing operational efficiency. By focusing on high-value customers, addressing regional performance gaps, and improving shipping cost management, the business can drive growth and profitability effectively.
