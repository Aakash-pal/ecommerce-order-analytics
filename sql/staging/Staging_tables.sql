DROP TABLE IF EXISTS stg_amazon_sales;
CREATE TABLE stg_amazon_sales AS
WITH src AS (
  SELECT *
  FROM amazon_sales_report_raw
)
SELECT
  order_id,
  to_date(date, 'MM-DD-YY')                          AS order_date,
  trim(status)                                        AS status,
  trim(fulfilment)                                    AS fulfilment,
  trim(sales_channel)                                 AS sales_channel,
  trim(ship_service_level)                            AS ship_service_level,
  nullif(trim(style), '')                             AS style,
  upper(trim(sku))                                    AS sku,
  initcap(trim(category))                             AS category,
  upper(trim(size))                                   AS size,
  upper(trim(asin))                                   AS asin,
  nullif(trim(courier_status), '')                    AS courier_status,
  NULLIF(qty, '')::int                                AS quantity,
  upper(trim(currency))                               AS currency,
  regexp_replace(amount, '[^0-9.\-]', '', 'g')::numeric(12,2) AS amount,
  initcap(trim(ship_city))                            AS ship_city,
  upper(trim(ship_state))                             AS ship_state,
  regexp_replace(trim(ship_postal_code), '\.0$', '', 'g') AS ship_postal_code,
  upper(trim(ship_country))                           AS ship_country,
  nullif(trim(promotion_ids), '')                     AS promotion_ids,
  CASE WHEN lower(trim(b2b)) IN ('true','t','yes','y','1') THEN true ELSE false END AS is_b2b,
  nullif(trim(fulfilled_by), '')                      AS fulfilled_by,
  -- keep raw load time for audit
  raw_ingested_at
FROM src
WHERE order_id IS NOT NULL AND order_id <> '';
-- Optional indexes for performance:
-- CREATE INDEX ON stg_amazon_sales(order_id);
-- CREATE INDEX ON stg_amazon_sales(sku);

--------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stg_warehouse_fees;
CREATE TABLE stg_warehouse_fees AS
WITH src AS (
  SELECT *
  FROM cloud_warehouse_comparison_chart_raw
  WHERE lower(coalesce(shiprocket,'')) <> 'heads'   -- drop header row
)
SELECT
  trim(shiprocket) AS fee_type,                      -- e.g., 'Inbound (Fresh Stock and RTO)'
  CASE WHEN shiprocket_price ~ '[0-9]'
       THEN regexp_replace(shiprocket_price, '[^0-9.\-]', '', 'g')::numeric
       ELSE NULL END AS shiprocket_price_num,
  CASE WHEN increff_price ~ '[0-9]'
       THEN regexp_replace(increff_price, '[^0-9.\-]', '', 'g')::numeric
       ELSE NULL END AS increff_price_num,
  shiprocket_price,
  increff_price,
  raw_ingested_at
FROM cloud_warehouse_comparison_chart_raw
WHERE lower(coalesce(shiprocket,'')) <> 'heads';
-- CREATE UNIQUE INDEX ON stg_warehouse_fees(fee_type);
-----------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stg_cashbook;
CREATE TABLE stg_cashbook AS
WITH src AS (
  SELECT *
  FROM expense_iigf_raw
)
-- Income rows
SELECT
  to_date(received_particular, 'MM-DD-YY') AS txn_date,
  'income'                                 AS txn_type,
  NULL                                     AS description,
  regexp_replace(received_amount, '[^0-9.\-]', '', 'g')::numeric AS amount,
  raw_ingested_at
FROM src
WHERE received_particular IS NOT NULL AND received_particular <> '' AND received_amount IS NOT NULL AND received_amount <> ''

UNION ALL

-- Expense rows
SELECT
  NULL                                     AS txn_date,        -- often no date in expense_particular; fill if present in your file
  'expense'                                AS txn_type,
  nullif(trim(expense_particular), '')     AS description,
  regexp_replace(expense_amount, '[^0-9.\-]', '', 'g')::numeric AS amount,
  raw_ingested_at
FROM src
WHERE expense_particular IS NOT NULL AND expense_particular <> '' AND expense_amount IS NOT NULL AND expense_amount <> '';
-- Helpful indexes:
-- CREATE INDEX ON stg_cashbook(txn_type);
-- CREATE INDEX ON stg_cashbook(txn_date);
