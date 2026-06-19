# 🚀 Marketing Analytics Dashboard | Python + SQL + Power BI

A complete end-to-end **Marketing Analytics Project** designed to help businesses understand customer behavior, campaign performance, spending patterns, and customer segmentation.

This project combines **Python, SQL, and Power BI** to transform raw marketing data into actionable insights and interactive dashboards.

---

# 📌 Business Problem

Modern businesses spend significant resources on marketing campaigns but often struggle to answer questions such as:

- Which customers generate the highest revenue?
- Which marketing campaigns are most successful?
- What are the spending patterns of customers?
- Which customer segments contribute the most to revenue?
- How do demographics influence purchasing behavior?

Without proper analytics, organizations may waste resources on ineffective campaigns and fail to target profitable customer segments.

---

# 🎯 Objective

To build a complete analytics solution that:

- Understands customer demographics and spending habits.
- Evaluates campaign effectiveness.
- Identifies high-value customers.
- Discovers profitable customer segments.
- Provides interactive dashboards for decision-making.

---

# 🛠 Technologies Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- MySQL
- SQL
- Power BI
- DAX

---

# 📂 Dataset

### Marketing Campaign Dataset

Dataset Source:

https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis

---

# Project Workflow

```
Raw Dataset
      ↓
Data Cleaning using Python
      ↓
Feature Engineering
      ↓
Loading Data into MySQL
      ↓
SQL Analysis
      ↓
Power BI Data Modeling
      ↓
DAX Measures
      ↓
Interactive Dashboard
```

---

# Python Tasks

✔ Data Cleaning

✔ Missing Value Treatment

✔ Feature Engineering

✔ Exploratory Data Analysis

✔ Customer Analysis

✔ Spending Analysis

✔ Campaign Analysis

✔ Segmentation Analysis

---

# SQL Analysis

The processed dataset was imported into MySQL and analyzed using SQL queries.

---

## Revenue by Education

```sql
SELECT
Education,
ROUND(
SUM(Total_Spending),2
) AS Revenue
FROM Fact_Sales F
JOIN Dim_Customers C
ON F.ID=C.ID
GROUP BY Education
ORDER BY Revenue DESC;
```

---

## Revenue by Marital Status

```sql
SELECT
Marital_Status,
ROUND(
SUM(Total_Spending),2
) AS Revenue
FROM Fact_Sales F
JOIN Dim_Customers C
ON F.ID=C.ID
GROUP BY Marital_Status
ORDER BY Revenue DESC;
```

---

## Revenue by Income Group

```sql
SELECT
Income_Group,
ROUND(
SUM(Total_Spending),2
) AS Revenue
FROM Fact_Sales F
JOIN Dim_Customers C
ON F.ID=C.ID
GROUP BY Income_Group
ORDER BY Revenue DESC;
```

---

## Revenue by Customer Segment

```sql
SELECT
Customer_Segment,
ROUND(
SUM(Total_Spending),2
) AS Revenue
FROM Fact_Sales F
JOIN Dim_Customers C
ON F.ID=C.ID
GROUP BY Customer_Segment
ORDER BY Revenue DESC;
```

---

## Top 10 Customers

```sql
SELECT
F.ID,
ROUND(
SUM(Total_Spending),2
) AS Spending
FROM Fact_Sales F
GROUP BY ID
ORDER BY Spending DESC
LIMIT 10;
```

---

## Campaign Success

```sql
SELECT
SUM(Response) AS Successful_Responses
FROM Dim_Campaigns;
```

---

## Average Income by Education

```sql
SELECT
Education,
ROUND(
AVG(Income),2
) Avg_Income
FROM Dim_Customers
GROUP BY Education
ORDER BY Avg_Income DESC;
```

---

## Age Group Analysis

```sql
SELECT
Age_Group,
COUNT(*) Customers
FROM Dim_Customers
GROUP BY Age_Group;
```

---

## Product Category Spending

```sql
SELECT
SUM(MntWines) Wines,
SUM(MntFruits) Fruits,
SUM(MntMeatProducts) Meat,
SUM(MntFishProducts) Fish,
SUM(MntSweetProducts) Sweets,
SUM(MntGoldProds) Gold
FROM Fact_Sales;
```

---

## Purchase Channel Analysis

```sql
SELECT
SUM(NumWebPurchases) AS Web,
SUM(NumCatalogPurchases) AS Catalog,
SUM(NumStorePurchases) AS Store
FROM Fact_Sales;
```

---

## Top Income Customers

```sql
SELECT
ID,
Income
FROM Dim_Customers
ORDER BY Income DESC
LIMIT 10;
```

---

## Customers Responding to Campaigns

```sql
SELECT
COUNT(*) Total_Customers
FROM Dim_Campaigns
WHERE Response=1;
```

---

## Average Recency

```sql
SELECT
ROUND(
AVG(Recency),2
)
AS Avg_Recency
FROM Fact_Sales;
```

---

# Power BI Data Model

Star Schema Model

### Fact Table

- Fact_Sales

### Dimension Tables

- Dim_Customers
- Dim_Campaigns

---

# Dashboard Pages

---

# 1. Executive Overview

Provides a high-level summary of:

- Total Revenue
- Total Customers
- Average Spending
- Response Rate

---

# 2. Customer Analytics

Analyzes:

- Revenue by Age Group
- Revenue by Education
- Revenue by Marital Status
- Income Group Distribution

---

# 3. Spending Analytics

Analyzes:

- Product Spending Distribution
- Purchase Channel Analysis
- Spending Distribution

---

# 4. Campaign Performance

Analyzes:

- Campaign Acceptance Comparison
- Response Distribution
- Response by Education
- Response by Income Group
- Response by Marital Status

---

# 5. Customer Segmentation

Analyzes:

- Revenue by Customer Segment
- Customer Distribution
- Income Group Analysis
- Revenue by Education
- Revenue by Age Group

---

# Key Insights

### High-income customers contribute the majority of revenue.

### Married customers generate the highest revenue.

### Graduation and PhD customers are the most profitable.

### Web and Store purchases dominate customer transactions.

### Campaign acceptance varies significantly across campaigns.

### A small customer segment contributes a large share of revenue.

---

# Folder Structure

```
Marketing Analytics Dashboard
│
├── Dataset
│
├── Python
│      ├── Data Cleaning.ipynb
│      ├── EDA.ipynb
│
├── SQL
│      ├── Queries.sql
│
├── Power BI
│      ├── Marketing Analytics Dashboard.pbix
│
├── Images
│      ├── overview.png
│      ├── customer analytics.png
│      ├── spending analytics.png
│      ├── campaign performance.png
│      ├── customer segmentation.png
│
└── README.md
```

---

# Dashboard Preview

## Executive Overview

```markdown
![Overview](Images/overview.png)
```

---

## Customer Analytics

```markdown
![Customer Analytics](Images/customer analytics.png)
```

---

## Spending Analytics

```markdown
![Spending Analytics](Images/spending analytics.png)
```

---

## Campaign Performance

```markdown
![Campaign Performance](Images/campaign performance.png)
```

---

## Customer Segmentation

```markdown
![Customer Segmentation](Images/customer segmentation.png)
```

---

# Skills Demonstrated

- Data Analysis
- Exploratory Data Analysis
- Data Cleaning
- Feature Engineering
- SQL Joins
- Aggregate Functions
- Window Functions
- Data Modeling
- Star Schema
- DAX
- Power BI
- Dashboard Design
- Business Intelligence
- Customer Segmentation
- Marketing Analytics

---

# Conclusion

This project demonstrates how Python, SQL, and Power BI can be combined to build a complete Marketing Analytics solution capable of helping businesses optimize customer targeting, improve campaign performance, and maximize revenue through data-driven decision-making.
