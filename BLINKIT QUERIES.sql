SELECT CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)) AS TOTAL_SALES_IN_MILLIONS FROM Blinkit_data
SELECT CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVERAGE_SALES FROM Blinkit_data 
SELECT COUNT(*) AS NO_OF_ITEMS FROM Blinkit_data
SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS FROM Blinkit_data

SELECT Item_Fat_Content, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	COUNT(*) AS NO_OF_ITEMS,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
 FROM Blinkit_data

GROUP BY Item_Fat_Content
ORDER BY TOTAL_SALES DESC

SELECT Item_Type, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	COUNT(*) AS NO_OF_ITEMS,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
 FROM Blinkit_data
GROUP BY Item_type
ORDER BY TOTAL_SALES DESC

SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

SELECT Outlet_Establishment_Year, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	COUNT(*) AS NO_OF_ITEMS,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
 FROM Blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY TOTAL_SALES DESC 

SELECT Outlet_Size, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC

SELECT Outlet_Location_Type, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	COUNT(*) AS NO_OF_ITEMS,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
 FROM Blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_SALES DESC

SELECT Outlet_Type, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_SALES,
	COUNT(*) AS NO_OF_ITEMS,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATINGS
 FROM Blinkit_data
GROUP BY Outlet_Type
ORDER BY TOTAL_SALES DESC
