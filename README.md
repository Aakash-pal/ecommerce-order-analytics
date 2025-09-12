# 🛒 Ecommerce Order Analytics

## 📌 Objective

The objective of this project is to design and implement an **end-to-end data engineering pipeline** for e-commerce sales data. The project focuses on extracting raw sales and expense data from multiple sources, cleaning and transforming it into structured formats, and loading it into a database or data warehouse for analysis. The final goal is to generate **meaningful business insights** such as profit/loss trends, regional sales performance, product category analysis, and operational cost breakdowns.

This project demonstrates practical ETL skills, SQL transformation logic, and the integration of multiple datasets into a unified analytics pipeline. It is also structured to be portfolio-ready, showcasing production-style practices.

---

## 📂 Repository Structure

```
Ecommerce-Order-Analytics/
│-- data/                     # Raw CSVs (Amazon, International Sales, Expenses, etc.)
│-- sql_etl/                  # SQL scripts for cleaning and transformations
│-- scripts/                  # Python scripts for automation and integration
│-- airflow/                  # Orchestration workflows (future scope)
│-- reports/                  # Power BI / Tableau dashboards (future scope)
│-- README.md                 # Project overview
```

---

## ⚙️ Data Sources

The following raw datasets were used in this project:

* `Amazon Sale Report.csv` → Sales report from Amazon channel
* `International sale Report.csv` → Updated Global e-commerce sales data
* `Sale Report.csv` → Consolidated domestic sales
* `Expense IIGF.csv` → Expense details
* `P L March 2021.csv` → Profit & Loss statements
* `May-2022.csv` → Monthly transaction snapshot
* `Cloud Warehouse Comparison Chart.csv` → Reference chart for cloud cost comparisons

📌 **Data Source Credit:** The dataset was originally published on Kaggle: [Unlock Profits with E-commerce Sales Data](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data/data).

---

## 🚀 Features

* SQL-based ETL pipeline (raw → staging → transformed)
* Data quality checks and cleaning logic
* Exploratory Data Analysis (EDA) for insights
* Integration of **sales + expenses** for profitability analysis
* Ready-to-use structure for Power BI / Tableau dashboards

---

## 🔧 Tech Stack

* **Database:** PostgreSQL
* **ETL Logic:** SQL, Python
* **Orchestration:** Apache Airflow (future scope)
* **Visualization:** Power BI / Tableau (future scope)
* **Version Control:** Git & GitHub

---

## 📊 Example Insights

* Regional sales performance and growth trends
* Contribution of Amazon vs. International channels
* Profitability after expense allocation
* Seasonal patterns in sales
* Cloud warehouse cost-effectiveness (reference)

---

## 📘 How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/Aakash-pal/ecommerce-order-analytics.git
   ```
2. Load raw CSV files into PostgreSQL.
3. Run SQL scripts in the `sql_etl/` folder to clean and transform data.
4. (Optional) Automate with Python / Airflow.
5. Build dashboards in Power BI / Tableau using the transformed tables.

---

## ✨ Future Enhancements

* Automate pipeline with Apache Airflow
* Deploy dashboards with scheduled refresh
* Machine learning forecasts for future sales

---

## 🙌 Credits

* Dataset Source: [Unlock Profits with E-commerce Sales Data – Kaggle](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data/data)
* Developed as part of a **portfolio project** to demonstrate data engineering and analytics skills.
