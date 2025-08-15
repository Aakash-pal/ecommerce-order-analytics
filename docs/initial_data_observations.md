# Initial Data Observations — Week 1

Observations derived from uploaded CSV exports:

- `Amazon Sale Report.csv` (128,975 rows) is the richest sales file and will be primary for order-level analytics.
- High null% observed in columns: `fulfilled-by` (~69%), `promotion-ids` (~38%), and several free-text columns. Plan to treat these as optional.
- Multiple files contain `Unnamed: X` CSV artifacts — these should be dropped during ingestion.
- Date columns exist with inconsistent formats across files (e.g., 'Date', 'DATE', 'Months') — unify parsing rules during ETL.
- Some SKU/Item columns are missing or mismatched between files (6-7% missing in International file). We'll use SKU mapping and fallback matching logic.
- Small finance files (`P  L March 2021.csv`, `May-2022.csv`, `Expense IIGF.csv`) will be joined later for profit/margin calculations; ensure currency/amount parsing is robust (remove symbols, thousands separators).
- Recommendation: store raw row JSON in normalized tables (raw_payload JSONB) for traceability and debugging.
