CREATE DATABASE Logistics_Analytics;

USE Logistics_Analytics;

CREATE TABLE Raw_Logistics (

Row_ID INT,
Order_ID VARCHAR(50),

Order_Date DATE,
Ship_Date DATE,

Ship_Mode VARCHAR(50),
Order_Priority VARCHAR(20),

Customer_ID VARCHAR(50),
Customer_Name VARCHAR(100),
Segment VARCHAR(50),

Country VARCHAR(50),
City VARCHAR(100),
State VARCHAR(100),
Postal_Code VARCHAR(20),
Region VARCHAR(50),
Market VARCHAR(50),

Product_ID VARCHAR(50),
Category VARCHAR(50),
Sub_Category VARCHAR(50),
Product_Name VARCHAR(255),

Sales DECIMAL(10,2),
Quantity INT,
Discount DECIMAL(5,2),
Profit DECIMAL(10,2),

Shipping_Cost DECIMAL(10,2)

);

SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE
'C:/Users/dell/OneDrive/Documents/DATA ANALYST PROJECTS/Ecommerce-Logistics-Project/Data/Raw/Global_Superstore2.csv'
INTO TABLE Raw_Logistics
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE Raw_Logistics;

CREATE TABLE Raw_Logistics (

Row_ID INT,
Order_ID VARCHAR(50),
Order_Date VARCHAR(20),
Ship_Date VARCHAR(20),
Ship_Mode VARCHAR(50),
Customer_ID VARCHAR(50),
Customer_Name VARCHAR(100),
Segment VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
Country VARCHAR(50),
Postal_Code VARCHAR(20),
Market VARCHAR(50),
Region VARCHAR(50),
Product_ID VARCHAR(50),
Category VARCHAR(50),
Sub_Category VARCHAR(50),
Product_Name VARCHAR(255),
Sales DECIMAL(10,2),
Quantity INT,
Discount DECIMAL(5,2),
Profit DECIMAL(10,2),
Shipping_Cost DECIMAL(10,2),
Order_Priority VARCHAR(20)

);

LOAD DATA LOCAL INFILE
'C:/Users/dell/OneDrive/Documents/DATA ANALYST PROJECTS/Ecommerce-Logistics-Project/Data/Raw/Global_Superstore2.csv'
INTO TABLE Raw_Logistics
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
