# 📊 Superstore Dataset Analysis Report

## Abstract
This analysis explores sales, profitability, and operational trends within the Superstore dataset using Power BI. It focuses on identifying high-performing product categories and customer segments, uncovering underperforming regions and SKUs, and evaluating the impact of discounts and shipping methods on profit margins. Key visualizations and metrics guide strategic recommendations for improving profitability, optimizing product bundling, and refining discount strategies. The report is designed to support data-driven decision-making and performance optimization for retail operations.

## Dataset Description
The Superstore dataset contains approximately 10,000 records of orders from a fictional retail company over a 4-year period (2014–2017). The dataset includes the following key fields:

- Order and ship dates

- Product category, sub-category, and name

- Sales, profit, discount, and quantity

- Customer details (ID, name, segment)

- Regional information (region, state, city)

- Shipping mode and delivery details

This dataset is widely used for sales analytics and dashboarding practice, offering a comprehensive overview of retail operations across multiple business dimensions.

## 📚 Table of Contents
[🔗 View Interactive Power BI Report](https://app.powerbi.com/view?r=eyJrIjoiZDI5MWI5OGQtMmIyNy00YjVjLTgxNDItZDJmMWQ1MTVkODU2IiwidCI6IjRiMzI5MDRlLTM3NDAtNDRlYi04YTM2LTE1OTQ3MDE0MzNjOCIsImMiOjl9&pageName=aa1d03d8fa078633a90f)

1. [Executive Summary](#1-executive-summary)
2. [Category & Product Performance](#2-category--product-performance)
3. [Shipping Mode Insights](#3-shipping-mode-insights)
4. [Segment & Customer Performance](#4-segment--customer-performance)
5. [Regional & State-Level Performance](#5-regional--state-level-performance)
6. [Discounts vs. Profitability](#6-discounts-vs-profitability)
7. [Final Recommendations](#7--Final-Recommendations)

## 1. Executive Summary

- Compound Annual Growth Rate (CAGR):
    - Sales: +14%
    - Profit: +24%
      
  ![ProfitAndSalesCAGR](Graphs/ProfitAndSalesCAGR.png)
- Total Sales: $2.27M
    - Technology: $835K (37%)
    - Office Supplies: $703K (31%)
    - Furniture: $733M (32%)
     
     ![Total Sales by Category](Graphs/TotalSalesCategory.png)
- Total Profit: $283K
    - Technology: $145K (51%)
    - Office Supplies: $120K (43%)
    - Furniture: $17K (6%)
  
  ![Total Profit Category](Graphs/TotalSProfitCategory.png)
- Top Performing States: California & New York (~50% of total profit)
 
  ![Profitable States](<Graphs/Profitable States.png>)
- Under-performing Regions: Central & South
- 18.65% of all the sales were unprofitable, totaling a loss of $154K
 
  ![Under-Performing Regions](<Graphs/Under-Performing Regions.png>)


---

## 2. Category & Product Performance

🟢 High Profitability Subcategories:

- Copiers: 20% of the total profit comes from less 1% of the orders
- Phones, Accessories, and Paper collectively drive 40% of the total profit
- Labels & Envelopes show excellent margins despite lower overall profit

  ![High Profitable Subcategories](<Graphs/High Profitable Subcategories.png>)

🔴 Under-performing Subcategories:

- The Furniture Category generates 21% of sales but only 6% of profit
- Tables, Bookcases, Machines, and Supplies often result in negative profit
- Nearly 65% of total losses stem from Binders, Tables, and Machines
  
  ![Less Profitable Subcategories](<Graphs/Less Profitable Subcategories.png>)

### 💡 Recommendations:

- Limit or eliminate discounts on high-sales, low-margin items (e.g., Binders)
- Consider bundling low-performing products with high-margin ones:
    - Tables with Chairs
    - Bookcases with Binders or Paper
    - Supplies with Envelopes or Paper
- Phase out consistently unprofitable products

---

## 3. Shipping Mode Insights

- Standard Class: 60% of shipments – most cost-effective
- Second Class: 20%
- First Class: 15%
- Same-Day: 5% – low usage and profitability

  ![Orders By Shipmode](<Graphs/Orders By Shipmodee.png>)

### 💡 Recommendation:

- Prioritize Standard Class for most orders. Use Same-Day shipping selectively (e.g., premium customers or urgent orders).

---

## 4. Segment & Customer Performance

- Segment Share of Sales:
    - Consumer: 1.15M (50%)
    - Corporate: 700K (30%)
    - Home Office: 430K (19%)
- 20% of customers are unprofitable
- Several high-revenue customers yield little or negative profit
  
  ![Sales by Segment](<Graphs/Sales by Segment.png>)

### 💡 Recommendation:

- Review discount policies and servicing costs for unprofitable customers.

---

## 5. Regional & State-Level Performance

### States with the Poorest Profit Margins:

🔻 Texas: -15% Profit Margin 

- Binders:    −162%   
- Appliances: −255%   
- Furnishing: -88%    

🔻 Ohio -22% Profit Margin 

- Machines:   −131%    
- Binders:    −73%    
- Bookcases:  −65%    


🔻 Pensylvania -13% Profit Margin 

- Machines:   −104%  
- Binders:    −73%   
- Bookcases:  −55%   


🔻 Illinois -15% Profit margin 

- Appliances: −254%  
- Binders:    −158%  
- Furnishing: -90%   


These states have the lowest profit margins, and due to their relatively high sales volumes, they result in significant overall profit losses.
 
  ![Lowest Profit States](<Graphs/Lowest Profit States.png>)

### States Strong Margin but Low Sales:

- District of Columbia, Maine, South Dakota
- Despite strong profit margins, total profit remains low due to limited sales volume
  
  ![GoodMarginBadTotalProfit](Graphs/GoodMarginBadTotalProfit.png)

  
### 💡 Recommendations:

- Discontinue or revise products with poor margins, especially those frequently discounted
- Launch marketing campaigns in Central & Southern regions to boost order volume
- Offer localized promotions in under-performing areas with sales potential

---

### 6. Discounts vs. Profitability

- Discounts above 20% generally reduce profitability without increasing sales
- Optimal discount level: ~20% (boosts sales effectively)
  
  ![Discount and Profit Trend](<Graphs/Discount And Profit Trend.png>)

  ![Sales Quantity by Discount](<Graphs/Sales Quantity by Discount.png>)
- The largest profit declines from discounting come from Tables, Bookcases, Machines, and especially Binders
  
- Sales consistently show a significant upward trend from August to December in both 2014 and 2017, indicating a strong seasonal pattern likely driven by end-of-year demand, holidays, and promotional periods.
  ![Sales Quantity trend](<Graphs/Sales Quantity trend.png>)

### 💡 Recommendations:

- Avoid heavy discounting on low-margin items
- Offer targeted discounts on high-margin, less frequently ordered items (e.g., Copiers) to stimulate sales

---

### 7. ✅ Final Recommendations

- Phase out consistently unprofitable SKUs (especially Tables, Machines, Bookcases, Supplies)
- Refine discounting strategy: prioritize profitability over volume
- Increase sales in underperforming regions using bundling and targeted promotions
- Replicate high-margin products like Copiers in top-performing regions
- Implement regular profitability audits to ensure discounts and product strategies remain aligned with margin goals.
- Leverage Power BI to build dynamic dashboards for regional managers to track KPI shifts in near real-time.