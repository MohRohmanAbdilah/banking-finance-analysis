# 💳 Credit Card Transaction Evaluation & Risk-Value Identification

## 📖 Project Background
**Bank Nexus** (Fictional Entity) is a global financial services provider specializing in card products. As a Data Analyst in the Risk & Growth department, I was tasked with analyzing daily transaction performance and identifying revenue growth opportunities.

Currently, the bank faces a challenge where high-quality, low-risk customers have extremely low credit utilization (**0.58%**), preferring to use debit cards for the majority of their spending. This project aims to dissect technical barriers and customer behavior to provide data-driven strategies for converting debit volume into credit instruments, thereby increasing the bank's profit margins.

**The insights and recommendations focus on the following key areas:**
* **Operational Health:** Identifying the root causes of transaction failures and system stability.
* **Customer Spending Behavior:** Comparative analysis of spending volume between Debit vs. Credit.
* **Revenue Opportunities:** Identifying conversion potential for low-risk debit users to switch to credit.
* **System Reliability:** Analyzing the impact of technical glitches on the bank's daily cash flow.

### 🛠️ Quick Links
* **SQL Cleaning & Queries:** [View SQL Script](01_extraction_query.sql)
* **Interactive Excel Dashboard:** [View on Excel Web](https://1drv.ms/x/c/8479bc108aa6c48e/IQDozt9mrlaiRbmw09UghvMnAVjxEFDrtiWzXOfo8vrEQO4?e=nY6FvI)

---

## 📊 Data Structure & Initial Checks
The dataset used in this analysis underwent a rigorous ETL (Extract, Transform, Load) process using SQL to ensure data integrity. The final database consists of **144,907 records** organized into three primary tables:

* **Transactions Table:** Records every financial activity, transaction amount, timestamps, and error status codes.
* **Users Table:** Contains customer risk profiles, credit scores (FICO), and Debt-to-Income (DTI) ratios.
* **Cards Table:** Details regarding card specifications, instrument type (Debit/Credit), credit limits, and card brands.

---

## 📑 Executive Summary

### Overview of Findings
The analysis reveals that while the bank maintains a large "safe" customer base (Credit Score >700), the credit limit utilization is at a critically low **0.58%**, indicating significant **"Idle Capacity."** Operational issues are a major bottleneck; on January 16th, transaction volume plummeted by **60%** due to 55 recorded technical glitches. Furthermore, the majority of transaction failures (**67%**) are driven by "Insufficient Balance," suggesting a need for better liquidity management tools for customers.

![Dashboard Preview](03_dashboard_preview.png)

---

## 🔍 Insights Deep Dive

### Category 1: Operational Efficiency & Root Cause Analysis
* **Primary Failure Driver:** "Insufficient Balance" is the number one cause of transaction declines, accounting for **298 cases**. This suggests customers are often unaware of their available balance before attempting a purchase.
* **Technical Glitches:** There were **55 pure system failures** recorded. While lower in volume than balance issues, these glitches directly impact customer trust and reliability during the checkout process.

### Category 2: Daily Spending Activity & Volume Patterns
* **System Anomaly:** Daily spending volume dropped from its peak of $2,628 to just **$759.91** on January 16th.
* **Downtime Correlation:** This sharp decline occurred exactly when the system recorded its highest frequency of technical glitches. This proves that system stability is a crucial factor in maintaining consistent daily transaction flow.

### Category 3: Total Spending by Card Type (Debit vs. Credit)
* **Debit Dominance:** Spending through Debit cards reached **$16,227.72**, significantly outpacing Credit cards which totaled only **$9,611.76**.
* **Conversion Opportunity:** Since these customers hold high credit scores (>700), the bank has a massive opportunity to shift this debit volume toward credit instruments to increase profit margins without significantly increasing credit risk.

---

## 🚀 Recommendations
Based on the findings above, I recommend the following strategic actions to the management team:
* **Real-time Balance Notifications:** Implement automated low-balance alerts to customer apps to reduce transaction failures caused by "Insufficient Balance."
* **Credit Activation Incentives:** Launch promotional programs (such as 1-2% cashback or reward points) specifically for credit card transactions to encourage low-risk customers to shift away from debit usage.
* **Infrastructure Audit & Upgrade:** Conduct an immediate audit of the transaction authorization system to eliminate the technical glitches that caused a 60% loss in transaction volume in a single business day.

---

## ⚠️ Assumptions and Caveats
* **Data Selection:** The analysis exclusively covers customers with a Credit Score >= 700 and a Debt-to-Income (DTI) ratio < 0.4.
* **Security Exclusion:** Cards identified as compromised on the *Dark Web* during security audits were fully removed from the dataset to ensure the validity of active customer data.
* **Currency:** All monetary values are expressed in USD.
