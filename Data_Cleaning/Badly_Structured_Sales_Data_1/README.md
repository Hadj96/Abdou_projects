# Project Summary

This project involves cleaning and restructuring a sales dataset to consolidate multiple columns into a more manageable format. The process includes data transformation, renaming columns, updating records, and removing unnecessary columns. Below is an overview of the steps taken:

## Initial Data Exploration
- Selected and reviewed the table to understand its structure.

## Remove Unnecessary Columns

## Create New Columns
- To consolidate data from the previous columns.

## Data Migration
- Transferred data from the old columns (`Consumer`, `Corporate`, `Home Office`) into the new `Sales`, `Ship_mode`, and `Segment` columns.
- Each record was updated with the corresponding `Ship_mode` (e.g., `First Class`, `Same Day`, etc.) and `Segment` (e.g., `Consumer`, `Corporate`, `Home Office`).

## Drop Unused Columns
- Dropped the old columns and any temporary columns used during the migration process.

## Delete Unwanted Rows
- Removed rows where `Order_ID` contained values like `'Ship Mode>>'`, `'Order ID'`, or `'Grand Total'` to clean up the dataset.

## Final Calculations
- Calculated the total and average sales per `Segment` and `Ship_mode`, generating a report with the `Grand_Total` and `Total_AVG`.
