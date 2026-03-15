UPDATE Raw_Logistics
SET Order_Date = STR_TO_DATE(Order_Date,'%d-%m-%Y'),
    Ship_Date = STR_TO_DATE(Ship_Date,'%d-%m-%Y');

    ALTER TABLE Raw_Logistics
MODIFY Order_Date DATE,
MODIFY Ship_Date DATE;

ALTER TABLE Raw_Logistics
ADD Delivery_Days INT;

UPDATE Raw_Logistics
SET Delivery_Days = DATEDIFF(Ship_Date, Order_Date);

SELECT
COUNT(*) AS Null_Delivery
FROM Raw_Logistics
WHERE Delivery_Days IS NULL;

SELECT
Order_Date,
Ship_Date
FROM Raw_Logistics
LIMIT 20;

ALTER TABLE Raw_Logistics
ADD Delivery_Days INT,
ADD Order_Year INT,
ADD Order_Month INT,
ADD Order_Quarter INT;

UPDATE Raw_Logistics
SET Delivery_Days = DATEDIFF(Ship_Date, Order_Date);

SELECT
Order_Date,
Ship_Date,
Delivery_Days
FROM Raw_Logistics
LIMIT 20;

UPDATE Raw_Logistics
SET
Order_Year = YEAR(Order_Date),
Order_Month = MONTH(Order_Date),
Order_Quarter = QUARTER(Order_Date);

ALTER TABLE Raw_Logistics
ADD Shipping_Speed VARCHAR(20),
ADD Order_Size_Category VARCHAR(20),
ADD Profit_Category VARCHAR(20);

UPDATE Raw_Logistics
SET Shipping_Speed = 
CASE
    WHEN Delivery_Days <= 2 THEN 'Fast'
    WHEN Delivery_Days BETWEEN 3 AND 5 THEN 'Medium'
    ELSE 'Slow'
END;

SELECT
Delivery_Days,
Shipping_Speed
FROM Raw_Logistics
LIMIT 20;

UPDATE Raw_Logistics
SET Order_Size_Category =
CASE
    WHEN Sales < 500 THEN 'Small'
    WHEN Sales BETWEEN 500 AND 2000 THEN 'Medium'
    ELSE 'Large'
END;

SELECT
Sales,
Order_Size_Category
FROM Raw_Logistics
ORDER BY Sales DESC
LIMIT 20;
