📘 Data Dictionary – Cleaned staging_profit_loss_march_2021 Table
| Column Name      | Data Type       | Description                                                         | Transformation / Notes                            |
| ---------------- | --------------- | ------------------------------------------------------------------- | ------------------------------------------------- |
| `row_index`      | `INT`           | Unique row index from source data                                   | Cast from text → INT                              |
| `sku`            | `TEXT` (UPPER)  | Stock Keeping Unit (unique product identifier)                      | Trimmed + converted to uppercase                  |
| `style_id`       | `TEXT` (UPPER)  | Product style identifier                                            | Trimmed + converted to uppercase                  |
| `catalog`        | `TEXT`          | Catalog name                                                        | `'Nill'` replaced with `NULL`                     |
| `category`       | `TEXT`          | Product category                                                    | `'Nill'` replaced with `NULL`                     |
| `weight`         | `NUMERIC(8,3)`  | Product weight in grams or kilograms (depending on dataset context) | Regex keeps only numeric values; invalid → `NULL` |
| `tp_1`           | `NUMERIC(10,2)` | Transfer price (version 1)                                          | Non-numeric → `NULL`                              |
| `tp_2`           | `NUMERIC(10,2)` | Transfer price (version 2)                                          | Non-numeric → `NULL`                              |
| `mrp_old`        | `NUMERIC(10,2)` | Previous MRP (Maximum Retail Price)                                 | Non-numeric → `NULL`                              |
| `ajio_mrp`       | `NUMERIC(10,2)` | MRP listed on Ajio marketplace                                      | Non-numeric → `NULL`                              |
| `amazon_mrp`     | `NUMERIC(10,2)` | MRP listed on Amazon                                                | Non-numeric → `NULL`                              |
| `amazon_fba_mrp` | `NUMERIC(10,2)` | MRP listed on Amazon (Fulfilled by Amazon)                          | Non-numeric → `NULL`                              |
| `flipkart_mrp`   | `NUMERIC(10,2)` | MRP listed on Flipkart                                              | Non-numeric → `NULL`                              |
| `limeroad_mrp`   | `NUMERIC(10,2)` | MRP listed on Limeroad                                              | Non-numeric → `NULL`                              |
| `myntra_mrp`     | `NUMERIC(10,2)` | MRP listed on Myntra                                                | Non-numeric → `NULL`                              |
| `paytm_mrp`      | `NUMERIC(10,2)` | MRP listed on Paytm Mall                                            | Non-numeric → `NULL`                              |
| `snapdeal_mrp`   | `NUMERIC(10,2)` | MRP listed on Snapdeal                                              | Non-numeric → `NULL`                              |
| `created_at`     | `TIMESTAMP`     | Record creation timestamp                                           | Populated with `CURRENT_TIMESTAMP`                |

---

📘 Data Dictionary – Cleaned staging_may_2022 Table
| Column Name      | Data Type       | Description                                                         | Transformation / Notes                            |
| ---------------- | --------------- | ------------------------------------------------------------------- | ------------------------------------------------- |
| `row_index`      | `INT`           | Unique row index from source data                                   | Cast from text → INT                              |
| `sku`            | `TEXT` (UPPER)  | Stock Keeping Unit (unique product identifier)                      | Trimmed + converted to uppercase                  |
| `style_id`       | `TEXT` (UPPER)  | Product style identifier                                            | Trimmed + converted to uppercase                  |
| `catalog`        | `TEXT`          | Catalog name                                                        | `'Nill'` replaced with `NULL`                     |
| `category`       | `TEXT`          | Product category                                                    | `'Nill'` replaced with `NULL`                     |
| `weight`         | `NUMERIC(8,3)`  | Product weight in grams or kilograms (depending on dataset context) | Regex keeps only numeric values; invalid → `NULL` |
| `tp  `           | `NUMERIC(10,2)` | Transfer price                                                      | Non-numeric → `NULL`                              |
| `mrp_old`        | `NUMERIC(10,2)` | Old MRP(Maximum Retail Price)                                       | Non-numeric → `NULL`                              |
| `final_mrp_old`  | `NUMERIC(10,2)` | Final MRP (Maximum Retail Price)                                    | Non-numeric → `NULL`                              |
| `ajio_mrp`       | `NUMERIC(10,2)` | MRP listed on Ajio marketplace                                      | Non-numeric → `NULL`                              |
| `amazon_mrp`     | `NUMERIC(10,2)` | MRP listed on Amazon                                                | Non-numeric → `NULL`                              |
| `amazon_fba_mrp` | `NUMERIC(10,2)` | MRP listed on Amazon (Fulfilled by Amazon)                          | Non-numeric → `NULL`                              |
| `flipkart_mrp`   | `NUMERIC(10,2)` | MRP listed on Flipkart                                              | Non-numeric → `NULL`                              |
| `limeroad_mrp`   | `NUMERIC(10,2)` | MRP listed on Limeroad                                              | Non-numeric → `NULL`                              |
| `myntra_mrp`     | `NUMERIC(10,2)` | MRP listed on Myntra                                                | Non-numeric → `NULL`                              |
| `paytm_mrp`      | `NUMERIC(10,2)` | MRP listed on Paytm Mall                                            | Non-numeric → `NULL`                              |
| `snapdeal_mrp`   | `NUMERIC(10,2)` | MRP listed on Snapdeal                                              | Non-numeric → `NULL`                              |
| `created_at`     | `TIMESTAMP`     | Record creation timestamp                                           | Populated with `CURRENT_TIMESTAMP`                |

---
## 📌 Change Log 2025-08-21

### v1.0 – Initial Table Creation
- Imported raw dataset with all columns as `TEXT`.

### v1.1 – Data Cleaning & Casting for staging_profit_loss_march_2021 Table
- Converted `row_index` to `INT`.
- Normalized text columns (`sku`, `style_id`) by trimming whitespace and converting to uppercase.
- Replaced `'Nill'` with `NULL` in `catalog` and `category`.
- Applied regex-based validation on numeric columns (`weight`, `tp_1`, `tp_2`, `mrp_old`, and all marketplace MRPs). Invalid entries replaced with `NULL`.
- Cast numeric fields to appropriate precision (`NUMERIC(8,3)` for weight, `NUMERIC(10,2)` for prices).
- Added `created_at` column with default `CURRENT_TIMESTAMP`.

### v1.2 – Data Cleaning & Casting for staging_may_2022 Table
- Converted `row_index` to `INT`.
- Normalized text columns (`sku`, `style_id`) by trimming whitespace and converting to uppercase.
- Replaced `'Nill'` with `NULL` in `catalog` and `category`.
- Applied regex-based validation on numeric columns (`weight`, `tp`, `final_mrp_old`,`mrp_old`, and all marketplace MRPs). Invalid entries replaced with `NULL`.
- Cast numeric fields to appropriate precision (`NUMERIC(8,3)` for weight, `NUMERIC(10,2)` for prices).
- Added `created_at` column with default `CURRENT_TIMESTAMP`.
