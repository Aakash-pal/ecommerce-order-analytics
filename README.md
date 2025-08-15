# E‑Commerce Order Analytics — Week 1 (Repo Starter)

This repository contains the **Week 1** project skeleton for the E‑Commerce Order Analytics pipeline.
It includes staging DDL, a recommended normalized schema, basic docs, and a `.gitignore` so you can
initialize a Git repo and push to GitHub quickly.

## What this commit contains
- `sql/staging/generated_staging_ddl.sql` — auto-generated staging CREATE TABLE statements (all columns TEXT).
- `sql/normalized_schema_ddl.sql` — recommended normalized schema (customers, products, orders, order_items, expenses).
- `docs/initial_data_observations.md` — short observations about the uploaded CSVs.
- `.gitignore` — common ignores for Postgres, Python, and OS files.
- `create_repo.sh` — helper script to initialize git and create a GitHub repo using `gh` (optional fallback instructions included).

## Quick local setup (recommended)
1. Download and extract the ZIP attached to this message (or clone if you push this repo to GitHub).
2. Move the folder to your desired projects directory, e.g. `C:\Users\<you>\Projects\` or `~/projects/`.
3. Optional: Place the full CSV exports in a local folder outside the repo (e.g. `~/data/ecommerce/`) and do **not** commit them to GitHub.
4. Run the helper script to initialize git and create the remote (see below).

## How to create the GitHub repo and push (one-line summary)
- If you have GitHub CLI (`gh`) installed and authenticated, run:
  ```bash
  ./create_repo.sh my-github-repo-name "E-Commerce Order Analytics - Week 1" 
  ```
- If you don't have `gh`, the script prints the fallback git commands and a short checklist to create a repo via the GitHub website and push your local branch.

## Acceptance criteria for this commit
- Repo contains the staging DDL and normalized schema SQL.
- README explains what to run next (staging table creation + CSV import).
- A branch `feature/initial-ingestion` is created locally and pushed to GitHub.

---
Next session we will draft the first SQL ETL transform (staging → normalized) and the initial Airflow DAG skeleton.
