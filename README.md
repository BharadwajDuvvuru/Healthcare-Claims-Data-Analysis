# Healthcare-Claims-Data-Analysis
This project analyzes Medicare claims data to identify high-risk patients based on age, treatment cost, and readmission history. The goal is to recommend strategies for reducing readmissions, improving care, and identifying cost-saving opportunities.

## 🎯 Objective

- Predict high-risk patients using a custom **Risk Score**
- Analyze readmission patterns and cost drivers
- Support hospital planning and preventive care strategies

---

## 📁 Data Summary

| Column             | Description                                 |
|--------------------|---------------------------------------------|
| `Patient_ID`       | Unique identifier                           |
| `Age`              | Age of patient                              |
| `Gender`           | Gender (M/F)                                |
| `Diagnosis_Code`   | Illness or condition                        |
| `Admission_Date`   | Hospital admission date                     |
| `Discharge_Date`   | Hospital discharge date                     |
| `Readmission_Date` | If applicable, readmission date             |
| `Treatment_Cost`   | Cost incurred for treatment                 |
| `Medication`       | Prescribed medicine                         |
| `Formulary_Change` | Whether medication cost was revised         |

---

## 🛠 SQL Analysis Highlights (`medicare_claims_data.sql`)

- Readmission rates by age, gender, and diagnosis
- Average treatment cost by medication and diagnosis
- Estimated cost savings from **formulary changes**
- Identification of **high-risk patients** with multiple readmissions
- Custom **Risk Score** combining age, cost, and readmissions

---

## 🧮 Risk Score Formula

Weighted model:
Risk Score = (0.3 × Age Group) + (0.4 × Normalized Cost) + (0.3 × Readmission Flag)


- Age Groups: `20-40`, `41-60`, `61-80`, `80+`
- Cost: Normalized to 0–1
- Readmission: Binary (0 or 1)

---

## 📊 Power BI Dashboard

- **KPI**: Count of high-risk patients (Score > 0.8)
- **Bar Chart**: Risk Score by Age Group
- **Scatter Plot**: Risk Score vs. Treatment Cost
- **Pie Chart**: Readmission Distribution
- **Filters**: Diagnosis, Gender, Age Group

---

## 💡 Insights

- Majority of **high-risk patients** are aged 60+  
- **Treatment cost** strongly correlates with readmission probability  
- **Formulary changes** show potential for 12%+ cost savings  
- High readmission = High risk, especially when paired with older age  

---

## 📌 Recommendations

1. **Target Preventive Care**: Focus on patients aged 60+ with past readmissions  
2. **Cost Optimization**: Evaluate effectiveness of formulary changes  
3. **Follow-up Programs**: Implement for patients with multiple admissions  
4. **Monitor KPI**: Regularly review risk scores and outcomes  

---

## 📚 Tools Used

- **SQL (MySQL)**: Data cleaning, queries, grouping
- **Excel**: Pre-cleaning & missing value handling
- **Power BI**: Data modeling, DAX formulas, visuals
- **DAX**: Custom measures for Risk Score & thresholds

---

## 👨‍💻 Author

**Bharadwaj Duvvuru**  
*Data Analyst | Healthcare BI | SQL + Power BI Developer*  
📫 Duvvurubharadwaj@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/bharadwaj-0934442b5/)

---

## 🗓 Project Timeline

- 📅 Duration: April 2025  
- 🏥 Domain: Healthcare Analytics  
- 📦 Type: Freelance BI Project  

