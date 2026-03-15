-- Core Business KPIs

SELECT
COUNT(*) AS Total_Orders,
ROUND(SUM(Sales),2) AS Total_Revenue,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Time,
ROUND(AVG(Shipping_Cost),2) AS Avg_Shipping_Cost
FROM Raw_Logistics;

-- Delivery Speed Analysis

SELECT
Ship_Mode,
COUNT(*) AS Total_Orders,
ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Time
FROM Raw_Logistics
GROUP BY Ship_Mode
ORDER BY Avg_Delivery_Time;

-- Region Performance

SELECT
Region,
COUNT(*) AS Orders,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Time
FROM Raw_Logistics
GROUP BY Region
ORDER BY Revenue DESC;

-- Delivery Performance KPI

SELECT
ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Time,
MIN(Delivery_Days) AS Fastest_Delivery,
MAX(Delivery_Days) AS Slowest_Delivery
FROM Raw_Logistics;

-- Shipping Cost Efficiency KPI

SELECT
Ship_Mode,
ROUND(AVG(Shipping_Cost),2) AS Avg_Shipping_Cost,
ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Time,
COUNT(*) AS Total_Orders
FROM Raw_Logistics
GROUP BY Ship_Mode
ORDER BY Avg_Shipping_Cost DESC;

-- Shipping Cost by Region

SELECT
Region,
ROUND(AVG(Shipping_Cost),2) AS Avg_Shipping_Cost,
ROUND(SUM(Shipping_Cost),2) AS Total_Shipping_Cost
FROM Raw_Logistics
GROUP BY Region
ORDER BY Avg_Shipping_Cost DESC;

-- Monthly Orders Trend

SELECT
Order_Year,
Order_Month,
COUNT(*) AS Total_Orders
FROM Raw_Logistics
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;

-- Monthly Revenue Trend

SELECT
Order_Year,
Order_Month,
ROUND(SUM(Sales),2) AS Monthly_Revenue
FROM Raw_Logistics
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;

-- Profitability by Shipping Mode

SELECT
Ship_Mode,
COUNT(*) AS Total_Orders,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit,
ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin_Percent
FROM Raw_Logistics
GROUP BY Ship_Mode
ORDER BY Profit_Margin_Percent DESC;

-- Late Delivery Analysis

SELECT
COUNT(*) AS Total_Orders,
SUM(CASE WHEN Delivery_Days > 5 THEN 1 ELSE 0 END) AS Late_Deliveries,
ROUND(
SUM(CASE WHEN Delivery_Days > 5 THEN 1 ELSE 0 END)
/ COUNT(*) * 100,2) AS Late_Percentage
FROM Raw_Logistics;

-- Slowest Regions

SELECT
Region,
ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Days,
COUNT(*) AS Orders
FROM Raw_Logistics
GROUP BY Region
ORDER BY Avg_Delivery_Days DESC;

-- Shipping Cost vs Profit

SELECT
Ship_Mode,
ROUND(AVG(Shipping_Cost),2) AS Avg_Shipping_Cost,
ROUND(AVG(Profit),2) AS Avg_Profit
FROM Raw_Logistics
GROUP BY Ship_Mode
ORDER BY Avg_Shipping_Cost DESC;

-- Order Size Distribution

SELECT
Order_Size_Category,
COUNT(*) AS Orders,
ROUND(SUM(Sales),2) AS Revenue
FROM Raw_Logistics
GROUP BY Order_Size_Category
ORDER BY Revenue DESC;

-- Region Profitability

SELECT
Region,
ROUND(SUM(Profit),2) AS Profit,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM Raw_Logistics
GROUP BY Region
ORDER BY Profit_Margin DESC;

-- Delivery Time Matrix

SELECT
Region,
Ship_Mode,
ROUND(AVG(Delivery_Days),2) AS Avg_Delivery
FROM Raw_Logistics
GROUP BY Region, Ship_Mode
ORDER BY Region;
