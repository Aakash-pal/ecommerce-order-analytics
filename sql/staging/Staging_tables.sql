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
DROP TABLE IF EXISTS stg_profit_loss_march_2021;

CREATE TABLE stg_profit_loss_march_2021 AS
SELECT
    row_index,
    trim(sku)                                  AS sku,
    trim(style_id)                             AS style_id,
    nullif(trim(catalog), '')                  AS catalog,
    nullif(trim(category), '')                 AS category,
    regexp_replace(weight, '[^0-9.\-]', '', 'g')::numeric AS weight,
    regexp_replace(tp_1, '[^0-9.\-]', '', 'g')::numeric AS tp_1,
    regexp_replace(tp_2, '[^0-9.\-]', '', 'g')::numeric AS tp_2,
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
FROM profit_loss_march_2021_raw;

