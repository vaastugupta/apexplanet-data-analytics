-- ============================================
-- TASK 2: SQL FOR DATA EXTRACTION
-- Dataset: Telco Customer Churn
-- ============================================


-- 1. Display all customers
SELECT *
FROM customers;


-- 2. Select specific columns
SELECT customerID, gender, tenure, MonthlyCharges, Churn
FROM customers;


-- 3. Filter customers
SELECT *
FROM customers
WHERE Churn = 'Yes';


-- 4. Sort customers by Monthly Charges
SELECT *
FROM customers
ORDER BY MonthlyCharges DESC;


-- 5. Limit results
SELECT *
FROM customers
LIMIT 10;


-- 6. Count customers by contract
SELECT Contract, COUNT(*) AS customer_count
FROM customers
GROUP BY Contract;


-- 7. HAVING
SELECT Contract, COUNT(*) AS customer_count
FROM customers
GROUP BY Contract
HAVING COUNT(*) > 1000;


-- 8. Average monthly charge
SELECT AVG(MonthlyCharges) AS average_monthly_charge
FROM customers;


-- 9. Churn by contract
SELECT Contract, COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes'
GROUP BY Contract;


-- 10. Customers paying above average
SELECT *
FROM customers
WHERE MonthlyCharges >
(
    SELECT AVG(MonthlyCharges)
    FROM customers
);


-- 11. Rank customers by monthly charges
SELECT
    customerID,
    MonthlyCharges,
    RANK() OVER (ORDER BY MonthlyCharges DESC) AS charge_rank
FROM customers;


-- 12. CTE
WITH AverageCharges AS
(
    SELECT AVG(MonthlyCharges) AS avg_charge
    FROM customers
)
SELECT *
FROM customers, AverageCharges
WHERE MonthlyCharges > avg_charge;

-- 13. ROW_NUMBER
SELECT
    customerID,
    MonthlyCharges,
    ROW_NUMBER() OVER (
        ORDER BY MonthlyCharges DESC
    ) AS row_num
FROM customers;

-- 14. Lag
SELECT
    customerID,
    tenure,
    LAG(tenure) OVER (
        ORDER BY tenure
    ) AS previous_tenure
FROM customers;

-- 15. Lead
SELECT
    customerID,
    tenure,
    LEAD(tenure) OVER (
        ORDER BY tenure
    ) AS next_tenure
FROM customers;

-- 16. View 
CREATE VIEW high_value_customers AS
SELECT *
FROM customers
WHERE MonthlyCharges > 80;
