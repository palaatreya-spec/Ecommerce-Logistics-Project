-- Main KPI View

CREATE OR REPLACE VIEW vw_logistics_kpis AS
SELECT

COUNT(*) AS Total_Orders,

ROUND(SUM(Sales),2) AS Total_Revenue,

ROUND(SUM(Profit),2) AS Total_Profit,

ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Time,

ROUND(AVG(Shipping_Cost),2) AS Avg_Shipping_Cost

FROM Raw_Logistics;

-- Region Performance

CREATE OR REPLACE VIEW vw_region_performance AS
SELECT

Region,

COUNT(*) AS Orders,

ROUND(SUM(Sales),2) AS Revenue,

ROUND(SUM(Profit),2) AS Profit,

ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Time

FROM Raw_Logistics

GROUP BY Region;

-- Shipping Mode Analysis

CREATE OR REPLACE VIEW vw_shipping_analysis AS
SELECT

Ship_Mode,

COUNT(*) AS Orders,

ROUND(AVG(Shipping_Cost),2) AS Avg_Shipping_Cost,

ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Time,

ROUND(SUM(Sales),2) AS Revenue

FROM Raw_Logistics

GROUP BY Ship_Mode;

-- Monthly Trend

CREATE OR REPLACE VIEW vw_monthly_trend AS
SELECT

Order_Year,
Order_Month,

COUNT(*) AS Orders,

ROUND(SUM(Sales),2) AS Revenue,

ROUND(SUM(Profit),2) AS Profit

FROM Raw_Logistics

GROUP BY Order_Year, Order_Month

ORDER BY Order_Year, Order_Month;

-- Delivery Performance

CREATE OR REPLACE VIEW vw_delivery_performance AS
SELECT

Region,
Ship_Mode,

ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Time,

MIN(Delivery_Days) AS Fastest_Delivery,

MAX(Delivery_Days) AS Slowest_Delivery

FROM Raw_Logistics

GROUP BY Region, Ship_Mode;

SHOW FULL TABLES
WHERE TABLE_TYPE LIKE 'VIEW';
