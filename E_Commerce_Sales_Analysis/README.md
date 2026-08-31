# E-Commerce Sales Analysis

## 📊 Project Overview

This project analyzes an e-commerce sales dataset using **Python, Pandas, Matplotlib, and Seaborn**.

The objective is to transform raw transaction data into meaningful business insights related to sales performance, products, customers, cities, payment methods, order status, and monthly trends.

## 🎯 Business Questions

The analysis focuses on questions such as:

* What is the overall revenue and sales volume?
* Which products generate the most revenue?
* Which products sell the highest quantity?
* Which customers generate the most revenue?
* How does Average Order Value (AOV) vary?
* Which months perform best and worst?
* Which cities generate the highest revenue?
* Which payment methods are most commonly used?
* What percentage of orders are cancelled or returned?
* Which products contribute most to monthly revenue?

## 🛠️ Tools & Technologies

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Jupyter Notebook

## 🧹 Data Preparation

The project includes practical data-cleaning tasks such as:

* Handling missing values
* Detecting and removing duplicate records
* Standardizing categorical values
* Converting date columns to datetime
* Creating calculated fields
* Validating customer and transaction data

A `Revenue` column was created using:

**Revenue = Quantity × Unit Price**

## 📈 Analysis Performed

### Business KPIs

* Total Orders
* Total Quantity Sold
* Gross Revenue
* Completed Revenue
* Average Order Value
* Completion Rate
* Cancellation Rate
* Return Rate

### Product Analysis

* Revenue by Product
* Quantity Sold by Product
* Revenue per Unit
* Product-level AOV
* Monthly Product Performance

### Customer Analysis

* Customer Revenue
* Order Frequency
* Quantity Purchased
* Average Order Value
* Customer Value Segmentation

### Time Analysis

* Monthly Revenue
* Monthly Orders
* Monthly Quantity
* Monthly AOV
* Product × Month Revenue

### Geographic & Transaction Analysis

* Revenue by City
* City-level AOV
* Revenue by Payment Method
* Order Status Analysis
* Gross vs Completed Revenue

## 📊 Key Insights

The analysis identified several important business patterns:

* **Laptop** is the dominant revenue-generating product.
* **Mobile** is another major contributor and performs particularly strongly during certain months.
* High-volume products do not necessarily generate the highest revenue because product price has a major effect on revenue.
* High-value customers contribute substantially more revenue than lower-value customer segments.
* Monthly sales performance varies considerably throughout the year.
* Some cities generate higher revenue despite having similar order volumes.
* Payment methods show different levels of usage and revenue contribution.
* Cancelled and returned orders represent revenue that requires further investigation.

## 💡 Business Recommendations

Based on the analysis:

1. Protect inventory availability for high-performing products such as Laptop and Mobile.
2. Develop loyalty and retention strategies for high-value customers.
3. Investigate the reasons behind cancelled and returned orders.
4. Focus marketing efforts on stronger-performing geographic markets.
5. Use upselling, bundles, and cross-selling to increase Average Order Value.

## 📁 Project Structure

```text
Ecommerce-Sales-Analysis/
│
├── ecommerce_sales_data_corrected.csv
├── ecommerce_sales_analysis.ipynb
└── README.md
```

## 🚀 Skills Demonstrated

This project demonstrates practical skills in:

* Data Cleaning
* Exploratory Data Analysis (EDA)
* Pandas Data Manipulation
* GroupBy & Aggregation
* Business KPI Analysis
* Customer Analysis
* Product Analysis
* Time-Series Analysis
* Data Visualization
* Matplotlib
* Seaborn
* Business Insight Generation
* Data-driven Recommendations

## 👩‍💻 Author

**Farah Inayat**

Aspiring Data Analyst | Python | Pandas | Data Visualization

