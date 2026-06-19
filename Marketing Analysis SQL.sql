CREATE DATABASE Marketing_Analytics;
USE Marketing_Analytics;
CREATE TABLE Dim_Customers (
    ID INT PRIMARY KEY,
    Year_Birth INT,
    Age INT,
    Age_Group VARCHAR(30),
    Education VARCHAR(50),
    Marital_Status VARCHAR(50),
    Income FLOAT,
    Income_Group VARCHAR(30),
    Children INT,
    Customer_Segment VARCHAR(30)
);

CREATE TABLE Dim_Campaigns (
    ID INT PRIMARY KEY,
    AcceptedCmp1 INT,
    AcceptedCmp2 INT,
    AcceptedCmp3 INT,
    AcceptedCmp4 INT,
    AcceptedCmp5 INT,
    Response INT
);

CREATE TABLE Fact_Sales (
    ID INT,
    Dt_Customer DATE,
    Recency INT,
    MntWines INT,
    MntFruits INT,
    MntMeatProducts INT,
    MntFishProducts INT,
    MntSweetProducts INT,
    MntGoldProds INT,
    Total_Spending INT,
    NumDealsPurchases INT,
    NumWebPurchases INT,
    NumCatalogPurchases INT,
    NumStorePurchases INT,
    NumWebVisitsMonth INT,
    Total_Purchases INT,

    FOREIGN KEY (ID)
    REFERENCES Dim_Customers(ID)
);

#Total Revenue
Select Round 
(SUM(Total_Spending),2
)As Total_Revenue 
from Fact_Sales;

#Average Spending
SELECT
ROUND(
AVG(Total_Spending),2
) AS Avg_Spending
FROM Fact_Sales;

#Revenue by Education
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

#Revenue by Marital Status
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

#Revenue by Income Group
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

#Revenue by Customer Segment
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

#Top 10 Customers
SELECT
F.ID,
ROUND(
SUM(Total_Spending),2
) AS Spending
FROM Fact_Sales F
GROUP BY ID
ORDER BY Spending DESC
LIMIT 10;

#Campaign Success
SELECT
SUM(Response) AS Successful_Responses
FROM Dim_Campaigns;

#Average Income by Education
SELECT
Education,
ROUND(
AVG(Income),2
) Avg_Income
FROM Dim_Customers
GROUP BY Education
ORDER BY Avg_Income DESC;

#Age Group Analysis
SELECT
Age_Group,
COUNT(*) Customers
FROM Dim_Customers
GROUP BY Age_Group;

#Product Category Spending
SELECT
SUM(MntWines) Wines,
SUM(MntFruits) Fruits,
SUM(MntMeatProducts) Meat,
SUM(MntFishProducts) Fish,
SUM(MntSweetProducts) Sweets,
SUM(MntGoldProds) Gold
FROM Fact_Sales;

#Purchase Channel Analysis
SELECT
SUM(NumWebPurchases) AS Web,
SUM(NumCatalogPurchases) AS Catalog,
SUM(NumStorePurchases) AS Store
FROM Fact_Sales;

#Top Income Customers
SELECT
ID,
Income
FROM Dim_Customers
ORDER BY Income DESC
LIMIT 10;

#Complaint Analysis
SELECT
COUNT(*) Total_Customers
FROM Dim_Campaigns
WHERE Response=1;

#Average Recency
SELECT
ROUND(
AVG(Recency),2
)
AS Avg_Recency
FROM Fact_Sales;
