# 📊 Blinkit Sales Analysis

## 📌 Overview
This project performs a **comprehensive sales analysis** of the `Blinkit_data` dataset using SQL and visualizes the results in a **dynamic Power BI dashboard**.  
The analysis covers **total sales, average sales, ratings, item categories, outlet types, sizes, and location tiers**.

---

## 📂 Project Structure
1. **SQL Queries** – For data aggregation, transformation, and KPI calculation.  
2. **Power BI Dashboard** – An interactive visualization of the SQL outputs with filters and drilldowns.

---
https://drive.google.com/file/d/1k5m-_dWy0Ms_jO8E94XXrZIbUTUn3uQp/view?usp=drive_link

## 🛠 SQL Analysis

### 1️⃣ Overall KPIs
---
# Total Sales in Millions
SELECT CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)) AS TOTAL_SALES_IN_MILLIONS FROM Blinkit_data;

# Average Sales
SELECT CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVERAGE_SALES FROM Blinkit_data;

# Number of Items
SELECT COUNT(*) AS NO_OF_ITEMS FROM Blinkit_data;

 #Average Ratings
SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS FROM Blinkit_data;
---
https://drive.google.com/file/d/1EHMthBOu6-ZUhoJo8OjQBzh7rEWcfrmB/view?usp=sharing


2️⃣ Sales by Fat Content
---
SELECT Item_Fat_Content, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
    COUNT(*) AS NO_OF_ITEMS,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
FROM Blinkit_data
GROUP BY Item_Fat_Content
ORDER BY TOTAL_SALES DESC;
---
https://drive.google.com/file/d/1Tv2MOCpdEJiJZK1e6W1YM3DE1TmieRW9/view?usp=sharing

3️⃣ Sales by Item Type
---
SELECT Item_Type, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
    COUNT(*) AS NO_OF_ITEMS,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
FROM Blinkit_data
GROUP BY Item_Type
ORDER BY TOTAL_SALES DESC;
---
https://drive.google.com/file/d/1Tv2MOCpdEJiJZK1e6W1YM3DE1TmieRW9/view?usp=sharing

4️⃣ Fat Content by Location (Pivot)
---
SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM (
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM Blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT (
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;
---
https://drive.google.com/file/d/1RR836moe20EPQ0DqNO61MxfIR2d9NjvZ/view?usp=sharing

5️⃣ Sales by Establishment Year
---
SELECT Outlet_Establishment_Year, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
    COUNT(*) AS NO_OF_ITEMS,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
FROM Blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY TOTAL_SALES DESC;
---
https://drive.google.com/file/d/1krLreKhxCwwgZBARyKSJZj9BXRlHROk8/view?usp=drive_link

6️⃣ Sales by Outlet Size (% Share)
---
SELECT Outlet_Size, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM Blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;
---
https://drive.google.com/file/d/1V36PRUW63GwGTMGMNjQOD3ibWKs3xkOP/view?usp=sharing

7️⃣ Sales by Location Type (KPIs)
---
SELECT Outlet_Location_Type, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
    CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
    COUNT(*) AS NO_OF_ITEMS,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
FROM Blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_SALES DESC;
---
https://drive.google.com/file/d/1ewdx0GsPv4NnaeUCk7JiGNSXlDEjcPnL/view?usp=sharing

8️⃣ Sales by Outlet Type
---
SELECT Outlet_Type, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
    CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
    COUNT(*) AS NO_OF_ITEMS,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
FROM Blinkit_data
GROUP BY Outlet_Type
ORDER BY TOTAL_SALES DESC;
---
https://drive.google.com/file/d/158oWre6gDox0M42QA8xhgZWtg_Nhao5e/view?usp=sharing


