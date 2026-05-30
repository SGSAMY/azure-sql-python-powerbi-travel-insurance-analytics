# Travel Insurance Customer Retention & Revenue Analytics

## End-to-End Azure SQL, Python, Data Engineering & Power BI Analytics Solution

---

## Project Overview

This project demonstrates an end-to-end Business Intelligence and Customer Analytics solution built using Azure SQL Database, Python, Pandas, SQLAlchemy, DAX, and Power BI.

The objective was to simulate a real-world Travel Insurance analytics platform capable of:

- Loading raw customer and policy data into Azure SQL Database
- Performing data cleansing and transformation
- Conducting exploratory data analysis (EDA)
- Creating analytical features for customer segmentation and retention analysis
- Building business-focused SQL views
- Developing an interactive executive Power BI dashboard
- Providing actionable insights for revenue growth, customer retention, and churn reduction

---

## Business Scenario

Travel insurance providers need to understand:

- Which products generate the highest revenue
- Which customer segments are most valuable
- Which customers are at risk of churn
- Which retention actions should be prioritised
- How premium revenue changes over time
- Which sales channels drive the highest value customers

This solution provides stakeholders with actionable insights to support marketing, retention and business growth strategies.

---

# Technology Stack

| Technology | Purpose |
|------------|----------|
| Azure SQL Database | Cloud Data Warehouse |
| Python | Data Cleansing & Feature Engineering |
| Pandas | Data Transformation |
| SQLAlchemy | Azure SQL Connectivity |
| Matplotlib | Exploratory Data Analysis |
| SQL Views | Business Analytics Layer |
| Power BI | Dashboard & Visualisation |
| DAX | KPI Calculations & Measures |

---

# Solution Architecture

```text
Travel Insurance Dataset (CSV)
            │
            ▼
Azure SQL Database
(travel_insurance_raw)
            │
            ▼
Data Cleansing Layer
(travel_insurance_clean)
            │
            ▼
Analytics Layer
(travel_insurance_analytics)
            │
            ▼
Feature Engineering
(travel_insurance_enriched)
            │
            ▼
Business Views
(SQL Analytics Views)
            │
            ▼
Power BI Dashboard
            │
            ▼
Business Insights
```

---

# Dataset

A synthetic Travel Insurance dataset containing approximately 8,000 customer records was generated for analytical purposes.

## Products

- Annual Multi Trip
- Single Trip
- Backpacker
- Winter Sports
- Cruise

## Core Attributes

- Customer_ID
- Policy_ID
- Product
- Premium_GBP
- Claim_Amount_GBP
- Customer_Age
- Cover_Level
- Region
- Destination
- Sales_Channel
- Renewal_Probability
- Churn_Risk_Score
- Customer_Lifetime_Value_GBP

---

# Azure SQL Database Setup

## Step 1 - Create Azure SQL Database

Created Azure SQL Database:

```sql
TravelInsuranceDB
```

Azure SQL Server:

```sql
travelins.database.windows.net
```

---

## Step 2 - Configure Firewall

Enabled:

- Allow Azure Services
- Allow Client IP Address

to permit access from:

- SQL Server Management Studio (SSMS)
- Python
- Power BI

---

## Step 3 - Import Dataset

Imported travel insurance CSV data into Azure SQL using:

```sql
travel_insurance_raw
```

---

# Data Engineering & SQL Layer

## Raw Layer

```sql
travel_insurance_raw
```

Contains original imported data.

---

## Cleansing Layer

Created:

```sql
travel_insurance_clean
```

Tasks performed:

- Data type corrections
- Null handling
- Numeric conversion
- Date validation

---

## Analytics Layer

Created:

```sql
travel_insurance_analytics
```

Added:

- Churn Risk Bands
- CLV Bands
- Renewal Bands
- Claim Status

---

## Enrichment Layer

Created:

```sql
travel_insurance_enriched
```

Additional business dimensions added through Python:

- Product
- Region
- Destination
- Cover_Level
- Customer_Segment
- Sales_Channel
- Next_Best_Action
- Policy_Sale_Date

---

# Python Integration

Connected Azure SQL Database using SQLAlchemy and ODBC Driver 18.

```python
from sqlalchemy import create_engine
import pandas as pd
```

Connection established via:

- SQLAlchemy
- ODBC Driver 18
- Azure SQL Database

---

# Exploratory Data Analysis (EDA)

Performed EDA using:

- Pandas
- Matplotlib

## Dataset Validation

```python
df.shape
df.info()
df.describe()
```

---

## Churn Risk Distribution

Histogram analysis conducted on:

```python
Churn_Risk_Score
```

to identify high-risk customer populations.

---

## Summary Statistics

Analysed:

- Premium Amount
- Claim Amount
- Renewal Probability
- Churn Risk Score
- Customer Lifetime Value

---

# Feature Engineering

Created business-oriented analytical fields.

---

## Churn Risk Band

- Low
- Medium
- High

---

## CLV Band

- Low Value
- Medium Value
- High Value

---

## Claim Status

- Claim
- No Claim

---

## Renewal Band

- Likely Renew
- Possible Renew
- Unlikely Renew

---

## Customer Segmentation

- Bronze
- Silver
- Gold
- Platinum

based on customer value and engagement.

---

## Next Best Action Model

Generated customer retention actions:

- Retain
- Upsell
- Cross Sell
- Reactivate
- No Action

based on churn risk and customer value.

---

# SQL Analytics Views

Created business-facing analytical views.

---

## Product Performance

```sql
vw_product_performance
```

Provides:

- Total Policies
- Total Premium
- Total Claims
- Average CLV
- Average Churn Risk

---

## Customer Segmentation

```sql
vw_customer_segmentation
```

Provides:

- Revenue by Segment
- Customer Counts
- Average Renewal Probability

---

## Churn Analysis

```sql
vw_churn_analysis
```

Provides:

- Churn Risk Distribution
- Customer Counts
- Renewal Analysis

---

## Customer Value Analysis

```sql
vw_customer_value
```

Provides:

- CLV Bands
- Average Premium
- Average Claims

---

## Channel Performance

```sql
vw_channel_performance
```

Provides:

- Revenue by Channel
- Renewal Performance
- Customer Counts

---

## Renewal Analysis

```sql
vw_renewal_analysis
```

Provides:

- Renewal Band Metrics
- Customer Retention Indicators

---

## Executive Summary

```sql
vw_executive_summary
```

Provides:

- Total Customers
- Total Premium
- Total Claims
- Average CLV
- Average Churn Risk
- Average Renewal Probability

---

# Power BI Dashboard

## Executive Dashboard

Developed an interactive dashboard featuring:

### Interactive Filters

- Product
- Cover Level
- Customer Segment
- Sales Channel
- Sale Year

---

## KPI Cards

- Total Customers
- Average Churn Risk %
- Average Renewal %
- Average Customer Lifetime Value
- YoY Premium Growth %

---

# Dashboard Visuals

## YoY Premium Sales by Customer Segment

Small multiples visual showing:

- Bronze
- Silver
- Gold
- Platinum

revenue trends across multiple years.

---

## Premium Sales by Product

Bar chart comparing:

- Annual Multi Trip
- Backpacker
- Winter Sports
- Single Trip
- Cruise

---

## Customer Retention Strategy Recommendations

Treemap visual displaying:

- Retain
- Upsell
- Reactivate
- Cross Sell
- No Action

for high-risk customers.

---

## Churn Risk by Cover Level

Combination chart analysing:

**Premium Revenue vs Average Churn Risk**

across:

- Basic
- Standard
- Premium

cover levels.

---

## Premium Revenue Driver Analysis

Decomposition Tree visual enabling drill-down by:

- Product
- Customer Segment
- Next Best Action
- Cover Level

to identify revenue drivers and retention opportunities.

---

# Key Business Insights

## Customer Retention

The majority of high-risk customers require:

- Retain
- Upsell

actions.

---

## Revenue Drivers

Premium revenue is heavily influenced by:

- Product Type
- Customer Segment
- Cover Level

---

## Customer Value

Gold and Platinum customers generate the highest revenue and customer lifetime value.

---

## Churn Analysis

Premium cover customers exhibit lower churn risk than Basic cover customers.

---

# Skills Demonstrated

## Data Engineering

- Azure SQL Database
- SQL Data Modelling
- Data Cleansing
- Data Transformation

## Analytics

- Customer Segmentation
- Churn Analytics
- Retention Analytics
- Revenue Analysis

## Python

- Pandas
- SQLAlchemy
- Exploratory Data Analysis
- Feature Engineering

## Business Intelligence

- Power BI
- DAX
- Dashboard Design
- Interactive Reporting

---

# Project Outcomes

Successfully delivered an end-to-end customer retention and revenue analytics platform capable of transforming raw travel insurance data into actionable business insights supporting:

- Customer Retention
- Revenue Optimisation
- Churn Reduction
- Marketing Effectiveness
- Strategic Decision Making

---

# Dashboard Preview

## Executive Dashboard

![Executive Dashboard](screenshots/dashboard%20preview.png)

---

## Customer Churn Risk Distribution

![Customer Churn Risk Distribution](screenshots/Customer%20Churn%20Risk%20Distribution.png)

---

## Correlation Analysis

![Correlation Analysis](screenshots/Corellation%20metrics.png)

---

## Azure SQL Database Connection from Power BI

![Power BI Azure SQL Connection](screenshots/Loading%20data%20to%20Power%20BI%20from%20Azure%20DB.png)

---

## Azure SQL Login Configuration

![Azure SQL Login](screenshots/Azure%20login.png)
---

# Author

## Satheesh Gurusamy

Senior Marketing Data Analyst | Business Intelligence Professional

### Technology Stack

Azure SQL • Python • SQL • Power BI • DAX • Customer Analytics • Retention Analytics • Revenue Analytics

### LinkedIn

Add your LinkedIn profile URL here.

### GitHub

https://github.com/SGSAMY
