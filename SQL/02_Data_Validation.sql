SELECT COUNT(*) AS Total_Rows
FROM Raw_Logistics;

SELECT Row_ID, COUNT(*)
FROM Raw_Logistics
GROUP BY Row_ID
HAVING COUNT(*) > 1;

SELECT
COUNT(*) - COUNT(Order_ID) AS Missing_OrderID,
COUNT(*) - COUNT(Customer_ID) AS Missing_CustomerID,
COUNT(*) - COUNT(Sales) AS Missing_Sales,
COUNT(*) - COUNT(Ship_Date) AS Missing_ShipDate
FROM Raw_Logistics;

DESCRIBE Raw_Logistics;

SELECT COUNT(*) FROM Raw_Logistics;

SELECT
MIN(Sales),
MAX(Sales)
FROM Raw_Logistics;
