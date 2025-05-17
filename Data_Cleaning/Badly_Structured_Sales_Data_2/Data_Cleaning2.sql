-- Data Normalization: The code normalizes the sales data by restructuring it into a format where each row represents a single shipping mode and segment with associated sales data.

-- This table will have the normalized data
CREATE TABLE sales2_Normalized (
	Order_Date VARCHAR(50),
    Sales DECIMAL(10,2),
    Ship_mode VARCHAR(50),
    Segment VARCHAR(50)
);

ALTER TABLE sales2
RENAME COLUMN `ï»¿Ship Mode` TO order_id,
RENAME COLUMN `First Class` TO FC_consumer,
RENAME COLUMN `MyUnknownColumn` TO FC_corporate,
RENAME COLUMN `MyUnknownColumn_[0]` TO FC_homeoffice,
RENAME COLUMN `Same Day` TO SD_consumer,
RENAME COLUMN `MyUnknownColumn_[1]` TO SD_corporate,
RENAME COLUMN `MyUnknownColumn_[2]` TO SD_homeoffice,
RENAME COLUMN `Second Class` TO SC_consumer,
RENAME COLUMN `MyUnknownColumn_[3]` TO SC_corporate,
RENAME COLUMN `MyUnknownColumn_[4]` TO SC_homeoffice,
RENAME COLUMN `Standard Class` TO STC_consumer,
RENAME COLUMN `MyUnknownColumn_[5]` TO STC_corporate,
RENAME COLUMN `MyUnknownColumn_[6]` TO STC_homeoffice;

-- Deleting Unwanted Rows
DELETE FROM sales2 
WHERE order_id = 'Segment' OR order_id = 'Order Date';

-- Setting Locale for Date Parsing
SET GLOBAL lc_time_names = 'es_ES'; -- This doesnt work on my MySql so Ill manually change the month abreviations

-- Replace the month abreviation to then format to date
UPDATE sales2
SET order_id = STR_TO_DATE(
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(order_id,'ene', 'Jan'),'feb', 'Feb'),'mar', 'Mar'),'abr', 'Apr'),'ago', 'Aug'),'dic', 'Dec'),
    '%d-%b-%y');
    
    
/*
-Each SELECT statement retrieves data from sales2, transforms the sales data
 (replaces commas with periods for decimal points), and assigns the correct shipping mode and segment.
 
-The UNION ALL is used to combine results from multiple SELECT statements into one.

-Each SELECT statement focuses on a different shipping mode and segment (e.g., 'First Class' for FC_consumer, 'Same Day' for SD_consumer, etc.).

-The WHERE clause ensures that only non-null and non-empty values for sales are included.
*/

INSERT INTO sales2_Normalized (Order_Date, sales, ship_mode, Segment)
SELECT 
		order_id,
		CAST(REPLACE(FC_consumer, ',', '.') AS DECIMAL(10,2)) AS sales,
        'First Class' AS ship_mode,
        'Consumer' AS segment
FROM sales2
WHERE FC_consumer IS NOT NULL AND FC_consumer != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(FC_corporate, ',', '.') AS DECIMAL(10,2)) AS sales,
        'First Class' AS ship_mode,
        'corporate' AS segment
FROM sales2
WHERE FC_corporate IS NOT NULL AND FC_corporate != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(FC_homeoffice, ',', '.') AS DECIMAL(10,2)) AS sales,
        'First Class' AS ship_mode,
        'HomeOffice' AS segment
FROM sales2
WHERE FC_homeoffice IS NOT NULL AND FC_homeoffice != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(SD_consumer, ',', '.') AS DECIMAL(10,2)) AS sales,
        'Same Day' AS ship_mode,
        'Consumer' AS segment
FROM sales2
WHERE SD_consumer IS NOT NULL AND SD_consumer != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(SD_corporate, ',', '.') AS DECIMAL(10,2)) AS sales,
        'Same Day' AS ship_mode,
        'Corporate' AS segment
FROM sales2
WHERE SD_corporate IS NOT NULL AND SD_corporate != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(SD_homeoffice, ',', '.') AS DECIMAL(10,2)) AS sales,
        'Same Daye' AS ship_mode,
        'Homeoffice' AS segment
FROM sales2
WHERE SD_homeoffice IS NOT NULL AND SD_homeoffice != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(SC_consumer, ',', '.') AS DECIMAL(10,2)) AS sales,
        'Second Class' AS ship_mode,
        'Consumer' AS segment
FROM sales2
WHERE SC_consumer IS NOT NULL AND SC_consumer != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(SC_corporate, ',', '.') AS DECIMAL(10,2)) AS sales,
        'Second Class' AS ship_mode,
        'Corporate' AS segment
FROM sales2
WHERE SC_corporate IS NOT NULL AND SC_corporate != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(SC_homeoffice, ',', '.') AS DECIMAL(10,2)) AS sales,
        'Second Class' AS ship_mode,
        'Homeoffice' AS segment
FROM sales2
WHERE SC_homeoffice IS NOT NULL AND SC_homeoffice != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(STC_consumer, ',', '.') AS DECIMAL(10,2)) AS sales,
        'Standard Class' AS ship_mode,
        'Consumer' AS segment
FROM sales2
WHERE STC_consumer IS NOT NULL AND STC_consumer != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(STC_homeoffice, ',', '.') AS DECIMAL(10,2)) AS sales,
        'Standard Class' AS ship_mode,
        'Homeoffice' AS segment
FROM sales2
WHERE STC_homeoffice IS NOT NULL AND STC_homeoffice != ''
UNION ALL
SELECT 
		order_id,
		CAST(REPLACE(STC_corporate, ',', '.') AS DECIMAL(10,2)) AS sales,
        'Standard Class' AS ship_mode,
        'Corporate' AS segment
FROM sales2
WHERE STC_corporate IS NOT NULL AND STC_corporate != '';

SELECT YEAR(Order_Date) year_date, Sum(Sales) Year_Gross FROM sales2_normalized
GROUP BY 1;
