# 💳 Credit Card Transaction Evaluation & Risk-Value Identification

![Dashboard Preview](credit-card-performance-analysis/03_dashboard_preview.png)

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
The ETL process was performed using SQL to clean currency symbols, apply binary transformations to errors, and join the three core tables. The full script is available in `01_extraction_query.sql`.

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

## 📁 Repository Structure
* 📄 `01_extraction_query.sql` : SQL script for data cleaning and integration.
* 📊 `02_banking_performance_dashboard.xlsx` : Master interactive dashboard file.
* 🖼️ `03_dashboard_preview.png` : Visual preview of the final dashboard.

> **Technical Note:** The dataset in this repository has been sampled (10,000 rows) for upload purposes. The comprehensive analysis was performed on the original 1GB+ dataset.
