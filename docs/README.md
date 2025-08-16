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

## 🔜 Next Steps (Week 2)

- Perform data profiling (nulls, duplicates, invalid values)
- Create staging tables in PostgreSQL for raw sales data
- Document findings and cleaning rules