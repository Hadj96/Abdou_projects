SELECT * FROM sales;

-- ERASE NON NEEDED COLUMNS

ALTER TABLE sales
DROP COLUMN `Consumer Total`;

ALTER TABLE sales
DROP COLUMN `Corporate Total`;

ALTER TABLE sales
DROP COLUMN `Home Office Total`;

/*
To consolidate all the information into fewer columns, we need to follow these steps for each column:

1. Create the tables where we want to store the data.
2. Format the column to ensure compatibility (e.g., formatting sales numbers).
3. Transfer the data along with the labels or attributes we want to associate with each record.
4. Drop unnecessary columns after the data has been migrated.

*/

-- Creating the new columns
ALTER TABLE sales
ADD COLUMN Sales DECIMAL(10,2),
ADD COLUMN Ship_mode VARCHAR(50)  ,
ADD COLUMN  Segment VARCHAR(50);

-- Renaming Order ID column
ALTER TABLE sales
RENAME COLUMN `ï»¿Segment>>` TO Order_ID ;

		-- DATA MIGRATION

-- Consumer/First Class 

Update Sales 
SET Consumer = ''
Where Consumer = 'First Class';

UPDATE sales 
SET Consumer = REPLACE(Consumer, ',', '.')
WHERE Consumer IS NOT NULL and Consumer != '';


UPDATE sales
SET
	Sales = CAST(Consumer AS DECIMAL(10, 2)),
    Ship_mode = 'First Class',
    Segment = 'Consumer'
    WHERE Consumer != '' AND Consumer IS NOT NULL;
    
    -- Consumer/Same Day
    
    Update Sales 
SET MyUnknownColumn = ''
Where MyUnknownColumn = 'Same Day';

UPDATE sales 
SET MyUnknownColumn = REPLACE(MyUnknownColumn, ',', '.')
WHERE MyUnknownColumn IS NOT NULL and MyUnknownColumn != '';


UPDATE sales
SET
	Sales = CAST(MyUnknownColumn AS DECIMAL(10, 2)),
    Ship_mode = 'Same Day',
    Segment = 'Consumer'
    WHERE MyUnknownColumn != '' AND MyUnknownColumn IS NOT NULL;
    
    -- Consumer/Second Class
    
Update Sales 
SET `MyUnknownColumn_[0]` = ''
Where `MyUnknownColumn_[0]` = 'Second Class';

UPDATE sales 
SET `MyUnknownColumn_[0]` = REPLACE(`MyUnknownColumn_[0]`, ',', '.')
WHERE `MyUnknownColumn_[0]` IS NOT NULL and `MyUnknownColumn_[0]` != '';


UPDATE sales
SET
	Sales = CAST(`MyUnknownColumn_[0]` AS DECIMAL(10, 2)),
    Ship_mode = 'Second Class',
    Segment = 'Consumer'
    WHERE `MyUnknownColumn_[0]` != '' AND `MyUnknownColumn_[0]` IS NOT NULL;
    
    
-- Consumer/Standard Class

Update Sales 
SET `MyUnknownColumn_[1]` = ''
Where `MyUnknownColumn_[1]` = 'Standard Class';

UPDATE sales 
SET `MyUnknownColumn_[1]` = REPLACE(`MyUnknownColumn_[1]`, ',', '.')
WHERE `MyUnknownColumn_[1]` IS NOT NULL and `MyUnknownColumn_[1]` != '';


UPDATE sales
SET
	Sales = CAST(`MyUnknownColumn_[1]` AS DECIMAL(10, 2)),
    Ship_mode = 'Standard Class',
    Segment = 'Consumer'
    WHERE `MyUnknownColumn_[1]` != '' AND `MyUnknownColumn_[1]` IS NOT NULL;
    
-- Corporate/First class
    
Update Sales 
SET Corporate = ''
Where Corporate = 'First Class';

UPDATE sales 
SET Corporate = REPLACE(Corporate, ',', '.')
WHERE Corporate IS NOT NULL and Corporate != '';


UPDATE sales
SET
	Sales = CAST(Corporate AS DECIMAL(10, 2)),
    Ship_mode = 'First Class',
    Segment = 'Corporate'
    WHERE Corporate != '' AND Corporate IS NOT NULL;
    

-- Corporate/Same Day

UPDATE Sales 
SET `MyUnknownColumn_[2]` = ''
WHERE `MyUnknownColumn_[2]` = 'Same Day';

UPDATE Sales 
SET `MyUnknownColumn_[2]` = REPLACE(`MyUnknownColumn_[2]`, ',', '.')
WHERE `MyUnknownColumn_[2]` IS NOT NULL AND `MyUnknownColumn_[2]` != '';

UPDATE Sales
SET
    Sales = CAST(`MyUnknownColumn_[2]` AS DECIMAL(10, 2)),
    Ship_mode = 'Same Day',
    Segment = 'Corporate'
WHERE `MyUnknownColumn_[2]` != '' AND `MyUnknownColumn_[2]` IS NOT NULL;

-- Corporate/Second Class


UPDATE Sales 
SET `MyUnknownColumn_[3]` = ''
WHERE `MyUnknownColumn_[3]` = 'Second Class';

UPDATE Sales 
SET `MyUnknownColumn_[3]` = REPLACE(`MyUnknownColumn_[3]`, ',', '.')
WHERE `MyUnknownColumn_[3]` IS NOT NULL AND `MyUnknownColumn_[3]` != '';


UPDATE Sales
SET
    Sales = CAST(`MyUnknownColumn_[3]` AS DECIMAL(10, 2)),
    Ship_mode = 'Second Class',
    Segment = 'Corporate'
WHERE `MyUnknownColumn_[3]` != '' AND `MyUnknownColumn_[3]` IS NOT NULL;

-- corporate/Standard Class

UPDATE Sales 
SET `MyUnknownColumn_[4]` = ''
WHERE `MyUnknownColumn_[4]` = 'Standard Class';

UPDATE Sales 
SET `MyUnknownColumn_[4]` = REPLACE(`MyUnknownColumn_[4]`, ',', '.')
WHERE `MyUnknownColumn_[4]` IS NOT NULL AND `MyUnknownColumn_[4]` != '';


UPDATE Sales
SET
    Sales = CAST(`MyUnknownColumn_[4]` AS DECIMAL(10, 2)),
    Ship_mode = 'Standard Class',
    Segment = 'Corporate'
WHERE `MyUnknownColumn_[4]` != '' AND `MyUnknownColumn_[4]` IS NOT NULL;


-- Home Office/First class
    
Update Sales 
SET `Home Office` = ''
Where `Home Office`= 'First Class';

UPDATE sales 
SET `Home Office` = REPLACE(`Home Office`, ',', '.')
WHERE `Home Office` IS NOT NULL and `Home Office` != '';


UPDATE sales
SET
	Sales = CAST(`Home Office` AS DECIMAL(10, 2)),
    Ship_mode = 'First Class',
    Segment = 'Home Office'
    WHERE `Home Office` != '' AND `Home Office` IS NOT NULL;

-- Home Office/Same Day

UPDATE Sales 
SET `MyUnknownColumn_[5]` = ''
WHERE `MyUnknownColumn_[5]` = 'Same Day';

UPDATE Sales 
SET `MyUnknownColumn_[5]` = REPLACE(`MyUnknownColumn_[5]`, ',', '.')
WHERE `MyUnknownColumn_[5]` IS NOT NULL AND `MyUnknownColumn_[5]` != '';

UPDATE Sales
SET
    Sales = CAST(`MyUnknownColumn_[5]` AS DECIMAL(10, 2)),
    Ship_mode = 'Same Day',
    Segment = 'Home Office'
WHERE `MyUnknownColumn_[5]` != '' AND `MyUnknownColumn_[5]` IS NOT NULL;

-- Home Office/Second Class

UPDATE Sales 
SET `MyUnknownColumn_[6]` = ''
WHERE `MyUnknownColumn_[6]` = 'Second Class';

UPDATE Sales 
SET `MyUnknownColumn_[6]` = REPLACE(`MyUnknownColumn_[6]`, ',', '.')
WHERE `MyUnknownColumn_[6]` IS NOT NULL AND `MyUnknownColumn_[6]` != '';


UPDATE Sales
SET
    Sales = CAST(`MyUnknownColumn_[6]` AS DECIMAL(10, 2)),
    Ship_mode = 'Second Class',
    Segment = 'Home Office'
WHERE `MyUnknownColumn_[6]` != '' AND `MyUnknownColumn_[6]` IS NOT NULL;

-- Home Office/Standard Class

UPDATE Sales 
SET `MyUnknownColumn_[7]` = ''
WHERE `MyUnknownColumn_[7]` = 'Standard Class';

UPDATE Sales 
SET `MyUnknownColumn_[7]` = REPLACE(`MyUnknownColumn_[7]`, ',', '.')
WHERE `MyUnknownColumn_[7]` IS NOT NULL AND `MyUnknownColumn_[7]` != '';


UPDATE Sales
SET
    Sales = CAST(`MyUnknownColumn_[7]` AS DECIMAL(10, 2)),
    Ship_mode = 'Standard Class',
    Segment = 'Home Office'
WHERE `MyUnknownColumn_[7]` != '' AND `MyUnknownColumn_[7]` IS NOT NULL;


-- DROP COLUMNS and ROWS that we dont need anymore

SELECT * from sales;

ALTER TABLE sales
DROP COLUMN Consumer,
DROP COLUMN Corporate,
DROP COLUMN `Home Office`,
DROP COLUMN	MyUnknownColumn,
DROP COLUMN	`MyUnknownColumn_[0]`,
DROP COLUMN	`MyUnknownColumn_[1]`,
DROP COLUMN	`MyUnknownColumn_[2]`,
DROP COLUMN	`MyUnknownColumn_[3]`,
DROP COLUMN	`MyUnknownColumn_[4]`,
DROP COLUMN	`MyUnknownColumn_[5]`,
DROP COLUMN	`MyUnknownColumn_[6]`,
DROP COLUMN	`MyUnknownColumn_[7]`;

DELETE FROM sales
WHERE Order_ID = 'Ship Mode>>' OR Order_ID = 'Order ID' OR Order_ID = 'Grand Total';

-- Calculating Grand total From each Segment and Class

SELECT Segment, Ship_mode, ROUND(SUM(Sales)) Grand_Total, ROUND(AVG(Sales)) Total_AVG
FROM sales
GROUP BY 1, 2 
ORDER BY Grand_Total DESC, Total_AVG DESC;
