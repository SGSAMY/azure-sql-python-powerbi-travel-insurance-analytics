-- Product Performance View

CREATE OR ALTER VIEW dbo.vw_product_performance AS
SELECT
    Product,
    COUNT(*) AS Total_Policies,
    SUM(Premium_GBP) AS Total_Premium,
    SUM(Claim_Amount_GBP) AS Total_Claims,
    AVG(Customer_Lifetime_Value_GBP) AS Avg_CLV,
    AVG(Renewal_Probability) AS Avg_Renewal_Probability,
    AVG(Churn_Risk_Score) AS Avg_Churn_Risk
FROM dbo.travel_insurance_enriched
GROUP BY Product;

-- Customer Segmentation View 

CREATE OR ALTER VIEW dbo.vw_customer_segmentation AS
SELECT
    Customer_Segment,
    COUNT(*) AS Total_Customers,
    SUM(Premium_GBP) AS Total_Premium,
    AVG(Customer_Lifetime_Value_GBP) AS Avg_CLV,
    AVG(Renewal_Probability) AS Avg_Renewal_Probability,
    AVG(Churn_Risk_Score) AS Avg_Churn_Risk
FROM dbo.travel_insurance_enriched
GROUP BY Customer_Segment;

-- Channel Performance View

CREATE OR ALTER VIEW dbo.vw_channel_performance AS
SELECT
    Sales_Channel,
    COUNT(*) AS Total_Customers,
    SUM(Premium_GBP) AS Total_Premium,
    AVG(Email_Open_Rate) AS Avg_Email_Open_Rate,
    AVG(Renewal_Probability) AS Avg_Renewal_Probability
FROM dbo.travel_insurance_enriched
GROUP BY Sales_Channel;

-- Retention View

CREATE OR ALTER VIEW dbo.vw_retention_dashboard AS
SELECT
    Churn_Risk_Band,
    Renewal_Band,
    Next_Best_Action,
    COUNT(*) AS Total_Customers,
    AVG(Customer_Lifetime_Value_GBP) AS Avg_CLV,
    AVG(Premium_GBP) AS Avg_Premium
FROM dbo.travel_insurance_enriched
GROUP BY
    Churn_Risk_Band,
    Renewal_Band,
    Next_Best_Action;

    -- Test

SELECT * FROM dbo.vw_product_performance;
SELECT * FROM dbo.vw_customer_segmentation;
SELECT * FROM dbo.vw_channel_performance;
SELECT * FROM dbo.vw_retention_dashboard;