DROP TABLE IF EXISTS dbo.travel_insurance_analytics;

SELECT
    Policy_ID,
    Customer_ID,
    Premium_GBP,
    Claim_Amount_GBP,
    Email_Open_Rate,
    Renewal_Probability,
    Churn_Risk_Score,
    Customer_Lifetime_Value_GBP,

    CASE
        WHEN Churn_Risk_Score >= 0.70 THEN 'High'
        WHEN Churn_Risk_Score >= 0.40 THEN 'Medium'
        ELSE 'Low'
    END AS Churn_Risk_Band,

    CASE
        WHEN Customer_Lifetime_Value_GBP >= 4000 THEN 'High Value'
        WHEN Customer_Lifetime_Value_GBP >= 2000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS CLV_Band,

    CASE
        WHEN Claim_Amount_GBP > 0 THEN 'Claimed'
        ELSE 'No Claim'
    END AS Claim_Status,

    CASE
        WHEN Renewal_Probability >= 0.70 THEN 'Likely Renew'
        WHEN Renewal_Probability >= 0.40 THEN 'Possible Renew'
        ELSE 'At Risk'
    END AS Renewal_Band

INTO dbo.travel_insurance_analytics

FROM dbo.travel_insurance_clean;

SELECT COUNT(*) AS TotalRows
FROM dbo.travel_insurance_analytics;

-- View 1 - Executive KPIs


CREATE OR ALTER VIEW dbo.vw_executive_summary AS
SELECT
    COUNT(*) AS Total_Customers,
    SUM(Premium_GBP) AS Total_Premium,
    SUM(Claim_Amount_GBP) AS Total_Claims,
    AVG(Renewal_Probability) AS Avg_Renewal_Probability,
    AVG(Churn_Risk_Score) AS Avg_Churn_Risk,
    AVG(Customer_Lifetime_Value_GBP) AS Avg_CLV
FROM dbo.travel_insurance_analytics;

SELECT *
FROM dbo.vw_executive_summary;

-- View 2 - Churn Analysis

CREATE OR ALTER VIEW dbo.vw_churn_analysis AS
SELECT
    Churn_Risk_Band,
    COUNT(*) AS Customers,
    AVG(Customer_Lifetime_Value_GBP) AS Avg_CLV,
    AVG(Renewal_Probability) AS Avg_Renewal
FROM dbo.travel_insurance_analytics
GROUP BY Churn_Risk_Band;

-- View 3 - Renewal Analysis

CREATE OR ALTER VIEW dbo.vw_renewal_analysis AS
SELECT
    Renewal_Band,
    COUNT(*) AS Customers,
    AVG(Premium_GBP) AS Avg_Premium,
    AVG(Customer_Lifetime_Value_GBP) AS Avg_CLV
FROM dbo.travel_insurance_analytics
GROUP BY Renewal_Band;

-- View 4 - Customer Value Analysis

CREATE OR ALTER VIEW dbo.vw_customer_value AS
SELECT
    CLV_Band,
    COUNT(*) AS Customers,
    AVG(Premium_GBP) AS Avg_Premium,
    AVG(Claim_Amount_GBP) AS Avg_Claims
FROM dbo.travel_insurance_analytics
GROUP BY CLV_Band;