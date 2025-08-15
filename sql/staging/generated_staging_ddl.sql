-- CREATE TABLE for Amazon Sale Report.csv
CREATE TABLE IF NOT EXISTS staging_amazon_sale_report (
  id SERIAL PRIMARY KEY,
  source_file TEXT,
  ingested_at TIMESTAMPTZ DEFAULT now(),
  "index" TEXT,
  "Order ID" TEXT,
  "Date" TEXT,
  "Status" TEXT,
  "Fulfilment" TEXT,
  "Sales Channel" TEXT,
  "ship-service-level" TEXT,
  "Style" TEXT,
  "SKU" TEXT,
  "Category" TEXT,
  "Size" TEXT,
  "ASIN" TEXT,
  "Courier Status" TEXT,
  "Qty" TEXT,
  "currency" TEXT,
  "Amount" TEXT,
  "ship-city" TEXT,
  "ship-state" TEXT,
  "ship-postal-code" TEXT,
  "ship-country" TEXT,
  "promotion-ids" TEXT,
  "B2B" TEXT,
  "fulfilled-by" TEXT,
  "Unnamed: 22" TEXT
);

-- COPY (run this from server psql or adjust path for COPY)
-- COPY staging_amazon_sale_report("index", "Order ID", "Date", "Status", "Fulfilment", "Sales Channel", "ship-service-level", "Style", "SKU", "Category", "Size", "ASIN", "Courier Status", "Qty", "currency", "Amount", "ship-city", "ship-state", "ship-postal-code", "ship-country", "promotion-ids", "B2B", "fulfilled-by", "Unnamed: 22") FROM '/path/to/Amazon Sale Report.csv' CSV HEADER;


-- CREATE TABLE for International sale Report.csv
CREATE TABLE IF NOT EXISTS staging_international_sale_report (
  id SERIAL PRIMARY KEY,
  source_file TEXT,
  ingested_at TIMESTAMPTZ DEFAULT now(),
  "index" TEXT,
  "DATE" TEXT,
  "Months" TEXT,
  "CUSTOMER" TEXT,
  "Style" TEXT,
  "SKU" TEXT,
  "Size" TEXT,
  "PCS" TEXT,
  "RATE" TEXT,
  "GROSS AMT" TEXT
);

-- COPY (run this from server psql or adjust path for COPY)
-- COPY staging_international_sale_report("index", "DATE", "Months", "CUSTOMER", "Style", "SKU", "Size", "PCS", "RATE", "GROSS AMT") FROM '/path/to/International sale Report.csv' CSV HEADER;


-- CREATE TABLE for Sale Report.csv
CREATE TABLE IF NOT EXISTS staging_sale_report (
  id SERIAL PRIMARY KEY,
  source_file TEXT,
  ingested_at TIMESTAMPTZ DEFAULT now(),
  "index" TEXT,
  "SKU Code" TEXT,
  "Design No." TEXT,
  "Stock" TEXT,
  "Category" TEXT,
  "Size" TEXT,
  "Color" TEXT
);

-- COPY (run this from server psql or adjust path for COPY)
-- COPY staging_sale_report("index", "SKU Code", "Design No.", "Stock", "Category", "Size", "Color") FROM '/path/to/Sale Report.csv' CSV HEADER;


-- CREATE TABLE for May-2022.csv
CREATE TABLE IF NOT EXISTS staging_may_2022 (
  id SERIAL PRIMARY KEY,
  source_file TEXT,
  ingested_at TIMESTAMPTZ DEFAULT now(),
  "index" TEXT,
  "Sku" TEXT,
  "Style Id" TEXT,
  "Catalog" TEXT,
  "Category" TEXT,
  "Weight" TEXT,
  "TP" TEXT,
  "MRP Old" TEXT,
  "Final MRP Old" TEXT,
  "Ajio MRP" TEXT,
  "Amazon MRP" TEXT,
  "Amazon FBA MRP" TEXT,
  "Flipkart MRP" TEXT,
  "Limeroad MRP" TEXT,
  "Myntra MRP" TEXT,
  "Paytm MRP" TEXT,
  "Snapdeal MRP" TEXT
);

-- COPY (run this from server psql or adjust path for COPY)
-- COPY staging_may_2022("index", "Sku", "Style Id", "Catalog", "Category", "Weight", "TP", "MRP Old", "Final MRP Old", "Ajio MRP", "Amazon MRP", "Amazon FBA MRP", "Flipkart MRP", "Limeroad MRP", "Myntra MRP", "Paytm MRP", "Snapdeal MRP") FROM '/path/to/May-2022.csv' CSV HEADER;


-- CREATE TABLE for P  L March 2021.csv
CREATE TABLE IF NOT EXISTS staging_p_l_march_2021 (
  id SERIAL PRIMARY KEY,
  source_file TEXT,
  ingested_at TIMESTAMPTZ DEFAULT now(),
  "index" TEXT,
  "Sku" TEXT,
  "Style Id" TEXT,
  "Catalog" TEXT,
  "Category" TEXT,
  "Weight" TEXT,
  "TP 1" TEXT,
  "TP 2" TEXT,
  "MRP Old" TEXT,
  "Final MRP Old" TEXT,
  "Ajio MRP" TEXT,
  "Amazon MRP" TEXT,
  "Amazon FBA MRP" TEXT,
  "Flipkart MRP" TEXT,
  "Limeroad MRP" TEXT,
  "Myntra MRP" TEXT,
  "Paytm MRP" TEXT,
  "Snapdeal MRP" TEXT
);

-- COPY (run this from server psql or adjust path for COPY)
-- COPY staging_p_l_march_2021("index", "Sku", "Style Id", "Catalog", "Category", "Weight", "TP 1", "TP 2", "MRP Old", "Final MRP Old", "Ajio MRP", "Amazon MRP", "Amazon FBA MRP", "Flipkart MRP", "Limeroad MRP", "Myntra MRP", "Paytm MRP", "Snapdeal MRP") FROM '/path/to/P  L March 2021.csv' CSV HEADER;


-- CREATE TABLE for Expense IIGF.csv
CREATE TABLE IF NOT EXISTS staging_expense_iigf (
  id SERIAL PRIMARY KEY,
  source_file TEXT,
  ingested_at TIMESTAMPTZ DEFAULT now(),
  "index" TEXT,
  "Recived Amount" TEXT,
  "Unnamed: 1" TEXT,
  "Expance" TEXT,
  "Unnamed: 3" TEXT
);

-- COPY (run this from server psql or adjust path for COPY)
-- COPY staging_expense_iigf("index", "Recived Amount", "Unnamed: 1", "Expance", "Unnamed: 3") FROM '/path/to/Expense IIGF.csv' CSV HEADER;

