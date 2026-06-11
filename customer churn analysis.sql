USE churn_data;
SELECT COUNT(*) AS total_customers
FROM `customer churn project`;
SELECT COUNT(*) AS churned_customers
FROM `customer churn project`
WHERE Churn = 'Yes';
SELECT 
ROUND(
    (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
) AS churn_rate
FROM `customer churn project`;
SELECT 
ROUND(SUM(MonthlyCharges), 2) AS estimated_revenue_loss
FROM `customer churn project`
WHERE Churn = 'Yes';
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM `customer churn project`
GROUP BY Contract
ORDER BY churned_customers DESC;
SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM `customer churn project`
GROUP BY PaymentMethod
ORDER BY churned_customers DESC;
SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM `customer churn project`
GROUP BY InternetService
ORDER BY churned_customers DESC;
SELECT 
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM `customer churn project`
GROUP BY SeniorCitizen;
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM `customer churn project`
GROUP BY Churn;