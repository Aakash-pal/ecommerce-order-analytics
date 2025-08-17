### 🛒 E-Commerce Order Analytics

A structured learning project to build an end-to-end data pipeline and analytics solution using real-world e-commerce sales data.
The project will evolve week by week, showcasing skills in SQL, ETL, Data Warehousing, and Visualization.

---

## 📂 Current Progress – Week 1

✅ Defined project scope and learning roadmap
✅ Gathered multiple raw datasets (sales, expenses, P&L, international sales, etc.)
✅ Organized repository structure for modular growth

---

## 📂 Repository Structure

```plaintext
ecommerce-order-analytics/
│
├── data/                 # Raw datasets (CSV files from Kaggle)
├── docs/                 # Documentation, notes, design references
├── scripts/              # Python / SQL scripts (ETL, transformations)
├── reports/              # Generated outputs (summaries, exports)
└── README.md             # Project root documentation
```
---

## 🎯 Learning Goals

- Build modular ETL workflows (raw → cleaned → warehouse-ready)
- Practice SQL transformations & analytics
- Explore data modeling and warehouse design
- Create portfolio-ready documentation and visualizations

---

## Initial Data Observations — Week 1

Observations derived from uploaded CSV exports:

- `Amazon Sale Report.csv` (128,975 rows) is the richest sales file and will be primary for order-level analytics.
- High null% observed in columns: `fulfilled-by` (~69%), `promotion-ids` (~38%), and several free-text columns. Plan to treat these as optional.
- Multiple files contain `Unnamed: X` CSV artifacts — these should be dropped during ingestion.
- Date columns exist with inconsistent formats across files (e.g., 'Date', 'DATE', 'Months') — unify parsing rules during ETL.
- Some SKU/Item columns are missing or mismatched between files (6-7% missing in International file). We'll use SKU mapping and fallback matching logic.
- Small finance files (`P  L March 2021.csv`, `May-2022.csv`, `Expense IIGF.csv`) will be joined later for profit/margin calculations; ensure currency/amount parsing is robust (remove symbols, thousands separators).
- Recommendation: store raw row JSON in normalized tables (raw_payload JSONB) for traceability and debugging.

## 📥 Week 1 – Raw Data Ingestion

- Goal: Create raw PostgreSQL tables for all source CSV files and import data.
- ✅ Completed:
- Set up 7 raw tables (one per input file).
- Preserved original structure,
- Imported all rows successfully.
- Ensured no transformations were applied yet (raw layer mirrors source files).

---

## 📥 Week 2 - Inspecting the data


# 📌 Why Staging Tables Instead of Views?

In this project, we are using staging tables rather than views to handle data cleaning and transformation. Here’s why:

# 🔄 Staging Tables

Purpose: Hold intermediate, cleaned versions of the raw data.
Advantages:
Data is materialized (physically stored), making repeated queries faster.
Easy to debug step-by-step cleaning logic.
Acts as a "checkpoint" — if something goes wrong downstream, we don’t have to reload raw data again.
Can be indexed for performance improvements.
Closer to how production ETL pipelines work (raw → staging → production/analytics tables).

# 👀 Views

Purpose: Provide a virtual cleaned dataset without physically storing it.
Advantages:
No extra storage required.
Always reflects the latest data in the underlying tables.
Limitations:
Each query against a view re-runs the cleaning logic → may be slow on large datasets.
Harder to debug since data is not stored at each stage.
More useful when data size is small or when transformations are lightweight.

# 🏭 Industry Practice

In real-world ETL pipelines, most data engineers use:
Raw layer: unmodified ingested data.
Staging layer: cleaned and standardized data.
Analytics layer (or marts): aggregated, business-ready datasets.
Views are often used on top of staging or analytics tables for quick reporting or business logic, but staging is almost always backed by physical tables for reliability and performance.

# 🔗 Data Flow in This Project
          ┌───────────┐
          │   Raw     │   ← imported directly from CSV
          │  (raw_cafe_sales) 
          └─────┬─────┘
                │
                ▼
          ┌───────────┐
          │  Staging  │   ← cleaned & standardized
          │ (staging_cafe_sales) 
          └─────┬─────┘
                │
                ▼
          ┌───────────┐
          │ Analytics │   ← final reporting / transformations
          │ (future)  │
          └───────────┘


# 👉 For our project:
We’ll stick to staging tables to simulate a realistic ETL workflow, while also experimenting with views later to understand when they might be more efficient.