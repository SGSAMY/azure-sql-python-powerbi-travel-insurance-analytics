USE TravelInsuranceDB;
GO

CREATE TABLE dbo.travel_insurance_raw
(
    Policy_ID VARCHAR(50),
    Customer_ID VARCHAR(50),
    Policy_Start_Date DATE,
    Customer_Age INT,
    Product VARCHAR(100),
    Destination VARCHAR(100),
    Region VARCHAR(100),
    Trip_Duration_Days INT,
    Premium_GBP DECIMAL(12,2),
    Cover_Level VARCHAR(50),
    Medical_Cover_GBP DECIMAL(18,2),
    Baggage_Cover_GBP DECIMAL(18,2),
    Cancellation_Cover_GBP DECIMAL(18,2),
    Previous_Claims INT,
    Claim_Flag INT,
    Claim_Amount_GBP DECIMAL(18,2),
    Sales_Channel VARCHAR(100),
    Email_Open_Rate DECIMAL(5,2),
    Campaign_Response VARCHAR(10),
    Customer_Segment VARCHAR(50),
    Renewal_Status VARCHAR(50),
    Renewal_Probability DECIMAL(5,2),
    Churn_Risk_Score DECIMAL(5,2),
    Customer_Lifetime_Value_GBP DECIMAL(18,2),
    Next_Best_Action VARCHAR(50)
);

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME='travel_insurance_raw';