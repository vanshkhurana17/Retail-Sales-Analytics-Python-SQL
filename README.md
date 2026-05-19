# Retail Sales & Customer Insights Analysis
### • Python • SQL • Power BI

---

## 📌 Project Overview

An end-to-end retail analytics project that follows a complete multi-tool workflow — from raw data cleaning in Python, to business insights extraction in MySQL, to an interactive Power BI dashboard. The goal is to analyze customer purchasing behaviour, category performance, payment patterns, and sales trends across 10,000+ transactions to support data-driven business decisions.

---

## 📊 Dataset Information

| Field | Details |
|---|---|
| Size | 10,000+ records |
| Key Columns | Branch, City, Category, Unit Price, Quantity, Date, Time, Payment Method, Rating, Profit Margin, Total Sales |

---

## 🛠 Tools & Technologies

| Layer | Tools |
|---|---|
| Data Cleaning & EDA | Python (Pandas, Matplotlib, Seaborn) |
| Business Analysis | SQL (MySQL) |
| Dashboard | Power BI (DAX) |
| Environment | Jupyter Notebook / Google Colab |

---

## 🔄 Workflow

1. **ETL** — Extracted raw data, handled nulls, duplicates, and formatting issues using Python (Pandas)
2. **Feature Engineering** — Calculated Total Sales column
3. **EDA** — Explored data distributions, outliers, and patterns using Matplotlib
4. **SQL Analysis** — Loaded clean DataFrame into MySQL and executed 13+ advanced queries
5. **Dashboard** — Built an interactive Power BI dashboard with DAX measures and dynamic slicers

---

## 📈 Key Insights

### Sales Distribution
- 50%+ of total transactions fall below $100, indicating most customers make low to mid-value purchases
- Significant outliers exist above $900, representing bulk or high-value transactions

### Category Performance
- **Fashion Accessories** and **Home & Lifestyle** are the top revenue-generating categories
- **Health** and **Sports** categories contribute comparatively lower revenue

### Time-Based Trends
- Peak customer activity occurs around **3 PM** based on transaction volume
- Sales drop significantly after hour 15, indicating low evening and night traffic

### Branch & City Performance
- **Weslaco** and **Waxahachie** are the top revenue-generating cities
- **WALM009** is the highest profit-generating branch

### Business Health
- Total Revenue: **$1.2M** | Total Profit: **$476K** | Profit Margin: **39.4%**
- Revenue and profit show a **declining YoY trend** — a key area for business attention

---

## 🗄 SQL Analysis Highlights

13+ queries written covering 5 business dimensions:

- **Sales Distribution** — transaction value buckets and frequency analysis
- **Category Performance** — revenue and volume ranking by product category
- **Customer Behaviour** — purchase patterns and spending trends
- **Payment Patterns** — method-wise transaction breakdown across branches
- **Time-Based Trends** — hourly and daily sales activity analysis

Key SQL concepts used: `CTEs`, `Window Functions`, `CASE WHEN`, `GROUP BY`, `Aggregate Functions`

---

## 📊 Power BI Dashboard

An interactive dashboard built to monitor retail performance at a glance:

- **KPI Cards** — Total Revenue, Total Profit, Profit Margin %, Transaction Count
- **YoY Trend Chart** — Revenue and profit across 2019–2023
- **Time of Day Chart** — Hourly transaction volume to identify peak hours
- **City & Branch Performance** — Revenue and profit by location
- **Category Analysis** — Revenue and average customer rating by product category
- **Dynamic Slicers** — Filter entire dashboard by Branch and Category

---

## 📌 Key Learnings

- Building an end-to-end analytics workflow from raw CSV to business dashboard
- ETL and data preprocessing using Python
- Advanced SQL query writing for multi-dimensional business analysis
- DAX measure creation and dashboard design in Power BI
- Translating raw data into actionable business insights

---

## 🚀 Conclusion

This project demonstrates a complete analyst workflow across three tools — Python for data preparation, SQL for business analysis, and Power BI for reporting. The insights surfaced around declining revenue trends, peak shopping hours, and top-performing branches can directly support management decisions around inventory planning, staffing, and targeted marketing.
