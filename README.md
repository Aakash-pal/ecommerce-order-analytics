### 📦 E-Commerce Order Analytics (SQL-Only ETL)

A portfolio project that demonstrates end-to-end SQL-based ETL (Extract, Transform, Load) skills using synthetic e-commerce order data.

This project avoids Python/ETL tools at the start, focusing purely on SQL transformations inside PostgreSQL. The aim is to showcase data modeling, cleaning, normalization, and analytics — the building blocks of any professional data engineering pipeline.

---

## 🎯 Project Goals

- Practice SQL-only ETL pipelines using raw CSV data.
- Create staging & normalized schemas in PostgreSQL.
- Implement data cleaning, deduplication, and integrity checks with SQL.
- Document a production-style repo structure for portfolio use.
- Prepare the project for future orchestration with Airflow and integration with BI tools.

---

## 📂 Repository Structure
```plaintext
ecommerce-order-analytics/
│
├── docs/
│   └── initial_data_observations.md   # Notes from exploring raw CSV
│
├── sql/
│   ├── staging/
│   │   └── generated_staging_ddl.sql  # Auto-generated DDL for staging table
│   ├── normalized_schema_ddl.sql      # Handcrafted normalized schema
│   └── transforms/                    # (To be added in Week 2+)
│
├── .gitignore
├── README.md                          # This file
└── create_repo.sh                     # Helper script for GitHub repo setup
```
---
## Tech stack

- PostgreSQL (primary analytical store)
- Docker (containerize ETL steps)
- Python (small utilities: CSV loader, FX fetcher)
- SQL (transformations & tests)
- Windows Task Scheduler (for scheduled runs) — optional alternative: GitHub Actions
- Power BI (reporting)
---


## 🗂️ Data Source

- Synthetic dataset (ecommerce_orders.csv) generated for training purposes.
- It mimics a real-world multi-category e-commerce order table with:
- Order metadata (IDs, timestamps, statuses)
- Customer information (IDs, names, emails)
- Product details (IDs, categories, prices)
- Shipping & payment info

---

## Inventory & Warehouse Cost Optimization (project focus)

Business goal: Use cloud_warehouse_comparison_chart_raw together with sales & shipping data to recommend cheaper fulfillment methods or shipping partners per SKU/region.
Analysis approach:
Normalize warehouse / shipping pricing into a table warehouse_prices with columns (vendor, service_level, warehouse_price_per_kg, effective_date).
For each shipment in fact_sales, estimate shipping cost by weight: estimated_shipping = product_weight_kg * vendor_rate_per_kg (match by region/zone when possible).
Compare vendor shipping estimates to actual shipping cost recorded in orders (if available), and aggregate by SKU/category to find cheapest provider per region.
Output recommendations: recommended_vendor_by_sku_region with uplift/cost savings.

---

## 🚀 Current Progress

# Week 1:

✅ Project skeleton created

✅ Repo initialized with docs + SQL DDLs

✅ Staging schema auto-generated from raw CSV headers

✅ Normalized schema drafted

# 📌 Roadmap

Week 2: Transformations → staging → normalized

Week 3: Data cleaning (deduplication, integrity rules)

Week 4: Analytics-ready marts (sales trends, customer insights)

Future: Orchestration with Apache Airflow

---

🛠️ Tech Stack

PostgreSQL 15+ (main database & SQL engine)

Git + GitHub (version control & collaboration)

Optional later: Airflow, Docker, Power BI

---

👩‍💻 Author

Aakash Pal — aspiring Data Engineer building hands-on ETL & SQL portfolio projects.