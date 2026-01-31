/* ============================================================
   DATA PREPARATION – CREDIT CARD TRANSACTION FACT TABLE
   ------------------------------------------------------------
   Purpose:
   - Clean raw transaction, user, and card data
   - Create transaction-level fact table for KPI analysis
   - Prepare data for downstream analysis (BI / Excel / Python)

   Notes:
   - Currency fields contain '$' only (no thousand separators)
   - KPI calculations are performed outside SQL
   - Dark web cards are excluded to focus on active, safe cards

   ============================================================ */

-- Data quality check at source level
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT id) AS unique_tx_id
FROM transactions_data;
-- Main Transformation Query
WITH clean_transactions AS (
    SELECT
        id AS tx_id,
        client_id,
        card_id,
        -- Clean transaction amount for numerical analysis
        CAST(REPLACE(amount, '$', '') AS DECIMAL(18,2)) AS clean_amount,
        use_chip,
        -- Normalize error information
        CASE
            WHEN errors IS NULL OR errors = '' THEN 'No Error'
            ELSE errors
        END AS error_detail,
        -- Binary flag for error rate calculation
        CASE
            WHEN errors IS NULL OR errors = '' THEN 0
            ELSE 1
        END AS is_error,
        -- Standardize transaction date
        DATE(date) AS tx_date
    FROM transactions_data
),

clean_users AS (
    SELECT
        id AS user_id,
        -- Clean user income and debt for DTI calculation
        CAST(REPLACE(yearly_income, '$', '') AS DECIMAL(18,2)) AS income,
        CAST(REPLACE(total_debt, '$', '') AS DECIMAL(18,2)) AS debt,
        credit_score
    FROM users_data
),

fact_card_transactions AS (
    SELECT
        ct.tx_id,
        ct.client_id,
        ct.card_id,
        ct.tx_date,
        ct.clean_amount,
        ct.use_chip,
        ct.error_detail,
        ct.is_error,
        c.card_brand,
        c.card_type,
        -- Clean credit limit for utilization analysis
        CAST(REPLACE(c.credit_limit, '$', '') AS DECIMAL(18,2)) AS clean_limit,
        u.income,
        u.debt,
        u.credit_score,
        -- Debt-to-Income ratio
        u.debt / NULLIF(u.income, 0) AS dti_ratio,
        -- Strategic label: low-risk customer segment
        CASE
            WHEN u.credit_score >= 700
                 AND u.debt / NULLIF(u.income, 0) < 0.4
            THEN 1
            ELSE 0
        END AS is_low_risk
    FROM clean_transactions ct
    LEFT JOIN clean_users u
        ON u.user_id = ct.client_id
    LEFT JOIN cards_data c
        ON c.id = ct.card_id
    -- Focus analysis on cards not exposed on the dark web
    WHERE c.card_on_dark_web = 'No'
)

SELECT *
FROM fact_card_transactions;
