DROP TABLE IF EXISTS stg_amazon_sales_report;

CREATE TABLE stg_amazon_sales_report AS
SELECT
    row_index,
    order_id,
    to_date(date, 'DD-MM-YYYY')                AS order_date,
    nullif(trim(status), '')                   AS status,
    nullif(trim(fulfilment), '')               AS fulfilment,
    nullif(trim(sales_channel), '')            AS sales_channel,
    nullif(trim(ship_service_level), '')       AS ship_service_level,
    nullif(trim(style), '')                    AS style,
    nullif(trim(sku), '')                      AS sku,
    nullif(trim(category), '')                 AS category,
    nullif(trim(size), '')                     AS size,
    nullif(trim(asin), '')                     AS asin,
    nullif(trim(courier_status), '')           AS courier_status,
    regexp_replace(qty, '[^0-9]', '', 'g')::int     AS qty,
    nullif(trim(currency), '')                 AS currency,
    regexp_replace(amount, '[^0-9.\-]', '', 'g')::numeric AS amount,
    nullif(trim(ship_city), '')                AS ship_city,
    nullif(trim(ship_state), '')               AS ship_state,
    nullif(trim(ship_postal_code), '')         AS ship_postal_code,
    nullif(trim(ship_country), '')             AS ship_country,
    nullif(trim(promotion_ids), '')            AS promotion_ids,
    nullif(trim(b2b), '')                      AS b2b_flag,
    nullif(trim(fulfilled_by), '')             AS fulfilled_by,
    nullif(trim(misc_column), '')              AS misc,
    raw_ingested_at
FROM amazon_sales_report_raw;


--------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stg_cloud_warehouse_comparison_chart;

CREATE TABLE stg_cloud_warehouse_comparison_chart AS
SELECT
    row_index,
    nullif(trim(shiprocket), '')        AS shiprocket_metric,
    regexp_replace(shiprocket_price, '[^0-9.\-]', '', 'g')::numeric AS shiprocket_price,
    regexp_replace(increff_price, '[^0-9.\-]', '', 'g')::numeric    AS increff_price,
    raw_ingested_at
FROM cloud_warehouse_comparison_chart_raw;

-----------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stg_expense_iigf;

CREATE TABLE stg_expense_iigf AS
-- Income rows
SELECT
    to_date(received_particular, 'DD-MM-YY')   AS txn_date,
    'income'                                   AS txn_type,
    NULL                                       AS description,
    regexp_replace(received_amount, '[^0-9.\-]', '', 'g')::numeric AS amount,
    raw_ingested_at
FROM expense_iigf_raw
WHERE received_particular IS NOT NULL
  AND received_amount IS NOT NULL

UNION ALL

-- Expense rows
SELECT
    NULL                                       AS txn_date,
    'expense'                                  AS txn_type,
    nullif(trim(expense_particular), '')       AS description,
    regexp_replace(expense_amount, '[^0-9.\-]', '', 'g')::numeric AS amount,
    raw_ingested_at
FROM expense_iigf_raw
WHERE expense_particular IS NOT NULL
  AND expense_amount IS NOT NULL;

-----------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stg_international_sale_report;

CREATE TABLE stg_international_sale_report AS
SELECT
    row_index,
    to_date(date, 'DD-MM-YYYY')                AS sale_date,
    nullif(trim(months), '')                   AS months,
    nullif(trim(customer), '')                 AS customer,
    nullif(trim(style), '')                    AS style,
    nullif(trim(sku), '')                      AS sku,
    nullif(trim(size), '')                     AS size,
    regexp_replace(pcs, '[^0-9]', '', 'g')::int     AS pcs,
    regexp_replace(rate, '[^0-9.\-]', '', 'g')::numeric AS rate,
    regexp_replace(gross_amt, '[^0-9.\-]', '', 'g')::numeric AS gross_amt,
    raw_ingested_at
FROM international_sale_report_raw;
---------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stg_may_2022;

CREATE TABLE stg_may_2022 AS
SELECT
    row_index,
    trim(sku)                                  AS sku,
    trim(style_id)                             AS style_id,
    nullif(trim(catalog), '')                  AS catalog,
    nullif(trim(category), '')                 AS category,
    regexp_replace(weight, '[^0-9.\-]', '', 'g')::numeric AS weight,
    regexp_replace(tp, '[^0-9.\-]', '', 'g')::numeric AS tp,
    regexp_replace(mrp_old, '[^0-9.\-]', '', 'g')::numeric AS mrp_old,
    regexp_replace(final_mrp_old, '[^0-9.\-]', '', 'g')::numeric AS final_mrp_old,
    regexp_replace(ajio_mrp, '[^0-9.\-]', '', 'g')::numeric AS ajio_mrp,
    regexp_replace(amazon_mrp, '[^0-9.\-]', '', 'g')::numeric AS amazon_mrp,
    regexp_replace(amazon_fba_mrp, '[^0-9.\-]', '', 'g')::numeric AS amazon_fba_mrp,
    regexp_replace(flipkart_mrp, '[^0-9.\-]', '', 'g')::numeric AS flipkart_mrp,
    regexp_replace(limeroad_mrp, '[^0-9.\-]', '', 'g')::numeric AS limeroad_mrp,
    regexp_replace(myntra_mrp, '[^0-9.\-]', '', 'g')::numeric AS myntra_mrp,
    regexp_replace(paytm_mrp, '[^0-9.\-]', '', 'g')::numeric AS paytm_mrp,
    regexp_replace(snapdeal_mrp, '[^0-9.\-]', '', 'g')::numeric AS snapdeal_mrp,
    raw_ingested_at
FROM may_2022_raw;
----------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stg_sale_report;

CREATE TABLE stg_sale_report AS
SELECT
    index,
    trim(sku_code)                             AS sku_code,
    trim(design_no)                            AS design_no,
    regexp_replace(stock, '[^0-9]', '', 'g')::int AS stock,
    nullif(trim(category), '')                 AS category,
    nullif(trim(size), '')                     AS size,
    nullif(trim(color), '')                    AS color,
    raw_ingested_at
FROM sale_report_raw;
------------------------------------------------------------------------------------------------------------
-- Logic for staging table (staging_profit_loss_march_2021)
--Step 1: Drop staging table if exists (safety)
DROP TABLE IF EXISTS staging_profit_loss_march_2021;

-- Step 2: Create staging table with correct datatypes
CREATE TABLE staging_profit_loss_march_2021 (
    staging_id      SERIAL PRIMARY KEY,
	row_index       INT,
    sku             VARCHAR(50),
    style_id        VARCHAR(50),
    catalog         VARCHAR(50),
    category        VARCHAR(50),
    weight          NUMERIC(8,3),
    tp_1            NUMERIC(10,2),
    tp_2            NUMERIC(10,2),
    mrp_old         NUMERIC(10,2),
    ajio_mrp        NUMERIC(10,2),
    amazon_mrp      NUMERIC(10,2),
    amazon_fba_mrp  NUMERIC(10,2),
    flipkart_mrp    NUMERIC(10,2),
    limeroad_mrp    NUMERIC(10,2),
    myntra_mrp      NUMERIC(10,2),
    paytm_mrp       NUMERIC(10,2),
	snapdeal_mrp    NUMERIC(10,2),
	staging_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Insert data from raw table, applying cleaning/transformation
INSERT INTO staging_profit_loss_march_2021 (
    row_index,sku,style_id,catalog,category,weight,tp_1,tp_2,
    mrp_old,ajio_mrp,amazon_mrp,amazon_fba_mrp,flipkart_mrp,
    limeroad_mrp,myntra_mrp,paytm_mrp,snapdeal_mrp,staging_created
)
SELECT
    CAST(row_index as INT),
    TRIM(UPPER(sku)),
    TRIM(UPPER(style_id)),
    NULLIF(TRIM(catalog), 'Nill'),
    NULLIF(TRIM(category), 'Nill'),
    -- Use regex to keep only numeric values
    CAST(CASE WHEN weight ~ '^[0-9.]+$' THEN weight ELSE NULL END AS NUMERIC(8,3)),
    CAST(CASE WHEN tp_1 ~ '^[0-9.]+$' THEN tp_1 ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN tp_2 ~ '^[0-9.]+$' THEN tp_2 ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN mrp_old ~ '^[0-9.]+$' THEN mrp_old ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN ajio_mrp ~ '^[0-9.]+$' THEN ajio_mrp ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN amazon_mrp ~ '^[0-9.]+$' THEN amazon_mrp ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN amazon_fba_mrp ~ '^[0-9.]+$' THEN amazon_fba_mrp ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN flipkart_mrp ~ '^[0-9.]+$' THEN flipkart_mrp ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN limeroad_mrp ~ '^[0-9.]+$' THEN limeroad_mrp ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN myntra_mrp ~ '^[0-9.]+$' THEN myntra_mrp ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN paytm_mrp ~ '^[0-9.]+$' THEN paytm_mrp ELSE NULL END AS NUMERIC(10,2)),
    CAST(CASE WHEN snapdeal_mrp ~ '^[0-9.]+$' THEN snapdeal_mrp ELSE NULL END AS NUMERIC(10,2)),

    CURRENT_TIMESTAMP
FROM profit_loss_march_2021_raw 
WHERE style_id IS NOT NULL;

