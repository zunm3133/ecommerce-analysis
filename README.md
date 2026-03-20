# Olist E-Commerce Sales & Customer Behaviour Analysis

End-to-end data analytics project analysing 100,000+ real Brazilian
e-commerce orders from the Olist marketplace (2016–2018).

---

## Live Dashboard

[View Interactive Tableau Dashboard →](https://prod-apsoutheast-b.online.tableau.com/t/moemoegyi1234567890-100e5852c6/authoring/OlistEcommerceAnalysis/OlistEcommerceAnalysis#2)

![Dashboard Screenshot](![alt text](image.png))

---

## Key Findings

- **97% of customers never return** after their first purchase —
  Olist has a critical retention problem that a loyalty programme
  could address
- **Champions (top 5% of customers) drive 25% of total revenue** —
  protecting this segment should be the #1 business priority
- **November 2017 saw a 3x revenue spike** consistent with Black
  Friday — seasonal campaigns should be scaled up significantly

---

## Project Structure
```
olist-ecommerce-analysis/
├── data/
│   └── processed/          # master.csv, rfm_segments.csv
├── notebooks/
│   ├── 01_data_loading_cleaning.ipynb
│   ├── 02_eda.ipynb
│   ├── 03_rfm_segmentation.ipynb
│   ├── 04_cohort_analysis.ipynb
│   └── 05_sql_analysis.ipynb
├── sql/
│   └── queries.sql         # all SQL queries with named tags
├── reports/
│   └── figures/            # all saved chart images
├── dashboard/
│   └── dashboard_screenshot.png
├── requirements.txt
└── README.md
```

---

## Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python (Pandas, NumPy) | Data loading, cleaning, analysis |
| Matplotlib / Seaborn | Data visualisation |
| SQL (SQLite) | Window functions, CTEs, aggregations |
| Tableau Public | Interactive dashboard |

---

## Analysis Performed

### 1. Data Loading & Cleaning
- Loaded and joined 9 relational CSV tables into one master table
- Parsed timestamps, handled nulls, engineered delivery day metrics
- Saved clean master dataset to `data/processed/master.csv`

### 2. Exploratory Data Analysis
- Monthly revenue trend (identified Black Friday spike Nov 2017)
- Top 15 product categories by revenue
- Delivery time distribution and on-time rate analysis
- Review score analysis by product category

### 3. SQL Analysis
- Month-over-month revenue growth using `LAG()` window function
- Top sellers ranked using `RANK() OVER()`
- Customer purchase frequency using CTEs

### 4. RFM Customer Segmentation
- Scored 93,000+ customers on Recency, Frequency, Monetary
- Identified 8 segments: Champions, Loyal, At Risk, Lost, etc.
- Champions average $450 lifetime value vs $35 for Lost customers

### 5. Cohort Retention Analysis
- Built retention heatmap for all monthly cohorts
- Found <5% month-1 retention — key business insight

---

## How to Run
```bash
# 1. Clone the repo
git clone hhttps://github.com/zunm3133/ecommerce-analysis.git
cd olist-ecommerce-analysis

# 2. Install dependencies
pip install -r requirements.txt

# 3. Download dataset
# Go to: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
# Place all CSV files in data/raw/

# 4. Run notebooks in order
# 01 → 02 → 03 → 04 → 05
```

---

## Dataset

**Brazilian E-Commerce Public Dataset by Olist**
- Source: [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- 100,000+ orders from 2016–2018
- 9 relational tables covering orders, customers, products, sellers,
  payments, and reviews

---

## Author

**Zun Myat Hsu** — Data Analyst & Developer

[LinkedIn](www.linkedin.com/in/zun-myat-hsu-16365b212) · [Tableau Public](https://prod-apsoutheast-b.online.tableau.com/#/site/moemoegyi1234567890-100e5852c6/home)