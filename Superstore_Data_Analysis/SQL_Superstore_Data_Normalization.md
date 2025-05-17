```sql 
USE EC;
DESC superstore;
SELECT * FROM superstore;

-- This select will help us easily write a consult about null values

SELECT CONCAT('`', COLUMN_NAME, '` IS NULL OR ', 'TRIM(','`',COLUMN_NAME, '`',')','` = \'\'', 'OR') AS '`COL_NAME` IS NULL OR TRIM(`COL_NAME`)` = ''OR'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'superstore';

-- Finding NULL values
SELECT *
FROM superstore
WHERE `Category` IS NULL OR TRIM(`Category`) = ''
   OR `City` IS NULL OR TRIM(`City`) = ''
   OR `Country` IS NULL OR TRIM(`Country`) = ''
   OR `Customer ID` IS NULL OR TRIM(`Customer ID`) = ''
   OR `Customer Name` IS NULL OR TRIM(`Customer Name`) = ''
   OR `Discount` IS NULL OR TRIM(`Discount`) = ''
   OR `Order Date` IS NULL OR TRIM(`Order Date`) = ''
   OR `Order ID` IS NULL OR TRIM(`Order ID`) = ''
   OR `Postal Code` IS NULL OR TRIM(`Postal Code`) = ''
   OR `Product ID` IS NULL OR TRIM(`Product ID`) = ''
   OR `Product Name` IS NULL OR TRIM(`Product Name`) = ''
   OR `Profit` IS NULL OR TRIM(`Profit`) = ''
   OR `Quantity` IS NULL OR TRIM(`Quantity`) = ''
   OR `Region` IS NULL OR TRIM(`Region`) = ''
   OR `Row ID` IS NULL OR TRIM(`Row ID`) = ''
   OR `Sales` IS NULL OR TRIM(`Sales`) = ''
   OR `Segment` IS NULL OR TRIM(`Segment`) = ''
   OR `Ship Date` IS NULL OR TRIM(`Ship Date`) = ''
   OR `Ship Mode` IS NULL OR TRIM(`Ship Mode`) = ''
   OR `State` IS NULL OR TRIM(`State`) = ''
   OR `Sub-Category` IS NULL OR TRIM(`Sub-Category`) = '';
   
   -- FORMATING
   
   -- Date fromating
		-- First we Update to set in a recognizable format
   
   UPDATE superstore
   SET `order date` = date_format(str_to_date(`order date`, '%m/%d/%Y'), '%d-%m-%Y'),
			`ship date`=  date_format(str_to_date(`ship date`, '%m/%d/%Y'), '%d-%m-%Y');
	
		
		-- Then we will change the column datatype
        
	ALTER TABLE superstore
    MODIFY COLUMN `order date` DATE,
    MODIFY COLUMN `ship date` DATE ;  	
    
-- We will now create the tables to put the values on
SELECT * FROM customers;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    `Postal Code` INT
);


-- Create Products Table
CREATE TABLE Products (
    ProductID VARCHAR(20) PRIMARY KEY,
    ProductName VARCHAR(250),
    SubCategory VARCHAR(50),
    Category VARCHAR(50)
);

CREATE TABLE Orders (
     Sale_id INT AUTO_INCREMENT PRIMARY KEY,
    OrderID VARCHAR(20),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(20),
    Region VARCHAR(20),
    ProductID VARCHAR(20),
    Quantity INT,
    Discount DECIMAL(10, 2),
    Sales DECIMAL(10, 2),
    Profit DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Updating newly Created tables
SELECT * FROM superstore;

-- Checking if the same Order ID is shared by different customers

SELECT `Order ID`, COUNT(DISTINCT `Customer ID`) AS Customer_Count
FROM superstore
GROUP BY `Order ID`
HAVING Customer_Count > 1;

INSERT INTO customers
SELECT DISTINCT `Customer ID`, `Customer Name`, `Segment`
FROM superstore;

 SELECT 
        `Order ID`,
        `Customer Name`,
        `order date`,
        ROW_NUMBER() OVER (PARTITION BY `Order ID`,`Customer Name` ORDER BY `Customer Name`, `order date`) AS row_num
    FROM superstore;


-- Create temporary table where we will set an unique indentifier for the duplicated Product IDs

CREATE TEMPORARY TABLE ProductMapping AS
WITH Duplicate_Products AS (
	SELECT `Product ID`, COUNT(DISTINCT `Product Name`) AS name_count
    FROM superstore
    GROUP BY `Product ID`
    HAVING COUNT(DISTINCT `Product Name`) > 1
    ),
Rows_to_update AS ( 
    SELECT DISTINCT sp.`Product ID`, sp.`Product Name`
    FROM superstore sp
    JOIN Duplicate_Products dp ON sp.`Product ID` = dp.`Product ID`
    ORDER BY sp.`Product ID` , sp.`Product Name`), 
ranked_rows AS(
SELECT `Product ID` ,`Product Name`,
	ROW_NUMBER () OVER(partition by `Product ID`) as row_num
    FROM Rows_to_update)
SELECT 
    CASE 
        WHEN row_num > 1 THEN CONCAT(`Product ID`, '-', row_num)
        ELSE `Product ID`
    END AS new_product_id,
    `Product ID` AS original_product_id,
    `Product Name`
FROM ranked_rows;

-- Joining the mapping with superstore table

UPDATE superstore s
JOIN ProductMapping pm
ON s.`Product ID` = pm.original_product_id AND s.`Product Name` = pm.`Product Name`
SET s.`Product ID` = pm.new_product_id;


-- Products table
INSERT INTO products (`ProductID`, `ProductName`, `SubCategory`, `Category`)
SELECT DISTINCT `Product ID`, `Product name`,`Sub-Category`,Category 
FROM superstore;

-- location Table
INSERT INTO location (City, Region, State, `Postal Code`)
SELECT DISTINCT City, Region, State, `Postal Code`
FROM superstore;


-- Orders Table


INSERT INTO orders (OrderID,
                    OrderDate,
                    ShipDate, 
                    ShipMode, 
                    CustomerID, 
                    Region, 
                    ProductID, 
                    Quantity, 
                    Discount, 
                    Sales, 
                    Profit)
SELECT `Order ID`, 
       `order date`, 
       `ship date`, 
       `Ship Mode`, 
       `Customer ID`, 
       Region, 
       `Product ID`, 
       Quantity, 
       Discount, 
       Sales, 
       Profit 
FROM superstore;
