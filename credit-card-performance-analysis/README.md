# 💳 Credit Card Transaction Evaluation & Risk-Value Identification

![Dashboard Preview](03_dashboard_preview.png)

## 📌 1. Business Strategy
**Target Industry:** Finance / Banking
**Core Problem:** The bank needs to increase credit card usage (revenue) without escalating the risk of default (debt).

**Business Questions:**
1. **Descriptive:** Which card category generates the highest transaction volume?
2. **Diagnostic:** Why do certain card categories have higher transaction error rates than others?
3. **Prescriptive:** What are the utilization patterns among active customers with credit scores >700 and low DTI?

## 📊 2. Key Performance Indicators (KPI)
* **Avg. Credit Utilization:** Measures the effectiveness of credit limit usage within the low-risk customer segment.
* **Total Spending Volume:** Total accumulated transaction value to monitor cash flow within the system.
* **Total Failed Transactions:** Frequency of transaction declines as a metric for operational system health.

## 🛠️ 3. Analysis Execution (5-Step Analysis)

### 🔍 Explore & Profile
Analysis was conducted on three primary datasets totaling **144,907 rows**:
* **Transactions Data:** Detailed amounts, timestamps, and error statuses.
* **Users Data:** Customer risk profiles including credit scores and debt levels.
* **Cards Data:** Information regarding credit limits and card brands.

### 🧹 Clean & Shape (SQL)
The ETL process was performed using SQL to ensure data integrity and prepare a structured fact table for analysis:
* **Advanced Logic**: Utilized **Common Table Expressions (CTEs)** to create a clean, modular, and readable data pipeline.
* **Currency Standardization**: Used `REPLACE` and `CAST` functions to convert string-based currency values into `Decimal(18,2)` for accurate numerical calculation.
* **Risk Exclusion**: Implemented a security filter to exclude cards exposed on the **Dark Web**, focusing the analysis on safe and active accounts.
* **Data Integration**: Successfully joined disparate tables using optimized `LEFT JOIN` operations.

### 📈 Analyze & Feature Engineering
* **Segmentation:** Classified "Low Risk" customers (Credit Score >= 700 & DTI < 0.4).
* **Credit Focus:** Calculated utilization exclusively for credit cards to eliminate data bias from debit transactions.

## 📈 4. Storytelling & Insights

### 💡 Key Findings (Aha! Moments)
* **Idle Capacity:** High-quality (low-risk) customers utilize only **0.58%** of their credit limits. However, Debit card spending is dominant ($16,227.72), indicating a massive opportunity to convert these transactions into Credit instruments.
* **Operational Failure:** A drastic **60% drop** in spending volume occurred on Jan 16th, which strongly correlates with **55 recorded technical glitches** in the system.

### 🚀 Business Recommendations
1. **Revenue Growth:** Launch credit-focused loyalty programs (e.g., cashback or 0% installments) to incentivize low-risk customers to shift from Debit to Credit usage.
2. **System Efficiency:** Audit the authorization system to address **Insufficient Balance** issues (298 cases) by implementing real-time balance notifications for customers.

---

## 🔗 Project Links
* **Interactive Dashboard:** [View on Excel Web](https://1drv.ms/x/c/8479bc108aa6c48e/IQB8o09ceiddQKpcUI4LPf5UAVj2Rl3_AI-0f-c8I91ThSs?e=xXstJ5)
* **Full Documentation:** [GitHub Repository](https://github.com/MohRohmanAbdilah/banking-finance-analysis)

## 📁 Repository Structure
* 📄 `01_extraction_query.sql` : SQL script for data cleaning and integration.
* 📊 `02_Banking_Performance_Dashboard.xlsx` : Master interactive dashboard file.
* 🖼 `03_dashboard_preview.png` : Visual preview of the final dashboard.

> **Technical Note:** The dataset in this repository has been sampled (10,000 rows) for upload purposes. The comprehensive analysis was performed on the original 1GB+ dataset.
