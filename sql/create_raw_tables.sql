-- created the amazon_sales_report_raw table
CREATE TABLE amazon_sales_report_raw (
raw_id SERIAL PRIMARY KEY,
row_index TEXT,
order_id TEXT,
date TEXT,
status TEXT,
fulfilment TEXT,
sales_channel TEXT,
ship_service_level TEXT,
style TEXT,
sku TEXT,
category TEXT,
size TEXT,
asin TEXT,
courier_status TEXT,
qty TEXT,
currency TEXT,
amount TEXT,
ship_city TEXT,
ship_state TEXT,
ship_postal_code TEXT,
ship_country TEXT,
promotion_ids TEXT,
b2b TEXT,
fulfilled_by TEXT,
misc_column TEXT,
raw_ingested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

-- created cloud_warehouse_comparison_chart_raw table

CREATE TABLE cloud_warehouse_comparison_chart_raw (
    row_index TEXT,
    shiprocket TEXT,
    shiprocket_price TEXT,
    increff_price TEXT,
    raw_ingested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--- created expense_iigf_raw table

CREATE TABLE expense_iigf_raw (
    row_index TEXT,
    received_particular TEXT,
    received_amount TEXT,
    expense_particular TEXT,
    expense_amount TEXT,
	raw_ingested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--- created international_sale_report_raw table

CREATE TABLE international_sale_report_raw (
row_index TEXT,
date TEXT,
months TEXT,
customer TEXT,
style TEXT,
sku TEXT,
size TEXT,
pcs TEXT,
rate TEXT,
gross_amt TEXT,
raw_ingested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

--- created may_2022_raw table

CREATE TABLE may_2022_raw (
row_index TEXT,
sku TEXT,
style_id TEXT,
catalog TEXT,
category TEXT,
weight TEXT,
tp TEXT,
mrp_old TEXT,
final_mrp_old TEXT,
ajio_mrp TEXT,
amazon_mrp TEXT,
amazon_fba_mrp TEXT,
flipkart_mrp TEXT,
limeroad_mrp TEXT,
myntra_mrp TEXT,
paytm_mrp TEXT,
snapdeal_mrp TEXT,
raw_ingested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

--- created sale_report_raw table

CREATE TABLE sale_report_raw (
index TEXT,
sku_code TEXT,
design_no TEXT,
stock TEXT,
category TEXT,
size TEXT,
color TEXT,
raw_ingested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

--- created profit_loss_march_2021_raw table

CREATE TABLE profit_loss_march_2021_raw (
row_index TEXT,
sku TEXT,
style_id TEXT,
catalog TEXT,
category TEXT,
weight TEXT,
tp_1 TEXT,
tp_2 TEXT,
mrp_old TEXT,
final_mrp_old TEXT,
ajio_mrp TEXT,
amazon_mrp TEXT,
amazon_fba_mrp TEXT,
flipkart_mrp TEXT,
limeroad_mrp TEXT,
myntra_mrp TEXT,
paytm_mrp TEXT,
snapdeal_mrp TEXT,
raw_ingested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)