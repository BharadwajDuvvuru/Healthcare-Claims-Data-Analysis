SELECT *
 FROM medicare_claims_data.medicare_claims;
 
-- Step 1: Checking the first few rows of the table
SELECT * FROM medicare_claims_data.medicare_claims LIMIT 10;

-- Step 2: Summary Statistics
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Patient_ID) AS total_patients,
    AVG(Age) AS average_age,
    AVG(Treatment_Cost) AS average_treatment_cost
FROM medicare_claims_data.medicare_claims;

-- Step 3: Checking Missing Data
SELECT
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN Diagnosis_Code IS NULL THEN 1 ELSE 0 END) AS missing_diagnosis,
    SUM(CASE WHEN Treatment_Cost IS NULL THEN 1 ELSE 0 END) AS missing_cost
FROM medicare_claims_data.medicare_claims;

-- Step 4: Calculate Overall Readmission Rate
SELECT
    COUNT(*) AS total_patients,
    COUNT(DISTINCT Readmission_Date) AS readmitted_patients,
    (COUNT(DISTINCT Readmission_Date) / COUNT(*) * 100) AS readmission_rate
FROM medicare_claims_data.medicare_claims;

-- Step 5: Readmission Rate by Gender
SELECT
    Gender,
    COUNT(*) AS total_patients,
    COUNT(DISTINCT Readmission_Date) AS readmitted_patients,
    (COUNT(DISTINCT Readmission_Date) / COUNT(*) * 100) AS readmission_rate
FROM medicare_claims_data.medicare_claims
GROUP BY Gender;

-- Step 6: Readmission Rate by Age Group
SELECT
    CASE 
        WHEN Age BETWEEN 20 AND 40 THEN '20-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        WHEN Age BETWEEN 61 AND 80 THEN '61-80'
        ELSE '80+' 
    END AS Age_Group,
    COUNT(*) AS total_patients,
    COUNT(DISTINCT Readmission_Date) AS readmitted_patients,
    (COUNT(DISTINCT Readmission_Date) / COUNT(*) * 100) AS readmission_rate
FROM medicare_claims_data.medicare_claims
GROUP BY Age_Group;

-- Step 7: Average Treatment Cost by Diagnosis
SELECT
    Diagnosis_Code,
    AVG(Treatment_Cost) AS avg_treatment_cost
FROM medicare_claims_data.medicare_claims
GROUP BY Diagnosis_Code;

-- Step 8: Average Treatment Cost by Medication
SELECT
    Medication,
    AVG(Treatment_Cost) AS avg_treatment_cost
FROM medicare_claims_data.medicare_claims
GROUP BY Medication;

-- Step 9: Treatment Cost Based on Formulary Change
SELECT
    Formulary_Change,
    AVG(Treatment_Cost) AS avg_treatment_cost
FROM medicare_claims_data.medicare_claims
GROUP BY Formulary_Change;

-- Step 10: Impact of Formulary Change on Cost Savings (12% Savings Example)
SELECT
    Patient_ID,
    Medication,
    Treatment_Cost,
    Formulary_Change,
    CASE
        WHEN Formulary_Change = 'Yes' THEN Treatment_Cost * 0.12  -- Assuming 12% potential savings from formulary change
        ELSE 0
    END AS Potential_Savings
FROM
    medicare_claims_data.medicare_claims;

-- Step 11: Readmission Rate by Formulary Change
SELECT
    Formulary_Change,
    COUNT(DISTINCT Readmission_Date) AS num_readmissions,
    COUNT(*) AS total_patients,
    (COUNT(DISTINCT Readmission_Date) / COUNT(*) * 100) AS readmission_rate
FROM
    medicare_claims_data.medicare_claims
GROUP BY
    Formulary_Change;

-- Step 12: High-Risk Patients (Multiple Readmissions)
SELECT
    Patient_ID,
    Age,
    Gender,
    Diagnosis_Code,
    COUNT(Readmission_Date) AS num_readmissions
FROM
    medicare_claims_data.medicare_claims
GROUP BY
    Patient_ID, Age, Gender, Diagnosis_Code
HAVING
    COUNT(Readmission_Date) > 1;

-- Step 13: Treatment Costs for High-Risk Groups (Multiple Readmissions)
SELECT
    Age,
    Diagnosis_Code,
    AVG(Treatment_Cost) AS avg_treatment_cost
FROM
    medicare_claims_data.medicare_claims
WHERE
    Patient_ID IN (
        SELECT Patient_ID FROM medicare_claims_data.medicare_claims
        GROUP BY Patient_ID
        HAVING COUNT(Readmission_Date) > 1
    )
GROUP BY
    Age, Diagnosis_Code;
