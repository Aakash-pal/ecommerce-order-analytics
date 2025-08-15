
-- Normalized schema recommendations for E-Commerce Order Analytics
-- Adjust column names/types after inspecting staging data.

CREATE TABLE IF NOT EXISTS customers (
  customer_id TEXT PRIMARY KEY,
  customer_name TEXT,
  email TEXT,
  phone TEXT,
  signup_date TIMESTAMPTZ,
  country TEXT,
  city TEXT,
  raw_payload JSONB
);

CREATE TABLE IF NOT EXISTS products (
  sku TEXT PRIMARY KEY,
  product_name TEXT,
  category TEXT,
  brand TEXT,
  unit_price NUMERIC,
  raw_payload JSONB
);

CREATE TABLE IF NOT EXISTS orders (
  order_id TEXT PRIMARY KEY,
  order_date TIMESTAMPTZ,
  customer_id TEXT REFERENCES customers(customer_id),
  status TEXT,
  fulfillment TEXT,
  sales_channel TEXT,
  shipping_city TEXT,
  shipping_state TEXT,
  shipping_country TEXT,
  order_total NUMERIC,
  currency TEXT,
  promotion_ids TEXT,
  fulfilled_by TEXT,
  raw_payload JSONB
);

CREATE TABLE IF NOT EXISTS order_items (
  id SERIAL PRIMARY KEY,
  order_id TEXT REFERENCES orders(order_id),
  sku TEXT REFERENCES products(sku),
  quantity INTEGER,
  unit_price NUMERIC,
  item_total NUMERIC,
  raw_payload JSONB
);

CREATE TABLE IF NOT EXISTS expenses (
  expense_id SERIAL PRIMARY KEY,
  expense_date TIMESTAMPTZ,
  description TEXT,
  amount NUMERIC,
  category TEXT,
  vendor TEXT,
  raw_payload JSONB
);

-- Tips:
-- 1) Initially load raw CSVs into staging_* tables (all columns as text). Then use SQL CTE transforms to populate these normalized tables.
-- 2) Use regexp_replace(column, '[^0-9.\-]', '', 'g')::numeric to clean numeric fields before casting.
-- 3) Use to_timestamp() or to_date() with the appropriate format string to parse date columns.
-- 4) Store original row as JSONB in raw_payload for traceability.
