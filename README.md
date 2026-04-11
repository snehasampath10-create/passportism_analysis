# 🌍 Passportism: When Your Birthplace Determines Your Freedom

> *"Whether you want to work or simply visit — your passport determines your access to the world."*

An end-to-end data analytics project exploring how passport inequality creates systemic barriers to both global labour mobility and basic freedom of movement — regardless of education, skills, or background.

---

## 📌 The Argument

Two equally qualified professionals. Same degree. Same skills. Same clean record. Same desire to travel.

One holds a top-ranked passport. The other holds a mid-ranked passport.

The top-ranked passport holder can visit or work in most of the world with little to no prior visa process. The mid-ranked passport holder faces work visa requirements, tourist visa applications, financial proof, interview appointments, and frequent rejections — for the same destinations.

**This project quantifies that inequality using data.**

---

## ❓ Core Questions

1. How wide is the gap in visa-free access between the strongest and weakest passports globally?
2. Does passport strength correlate with a country's education level and GDP — or is it simply an accident of birth?
3. Which countries require work visas from Indian passport holders that stronger passport holders don't need for the same job?
4. How many potential job markets are effectively closed to a highly educated Indian professional purely due to passport strength?
5. How does passport strength affect tourism access — and is the burden of tourist visa applications distributed unequally across regions?

---

## 📸 Dashboard Preview

![Dashboard Overview](screenshots/dashboard_overview.png)

---

## 🗂️ Repository Structure

```
passportism/
├── ingestion/
│   └── fetch_data.py           # Python ETL scripts to fetch and load raw data
├── dbt/
│   ├── models/
│   │   ├── staging/            # Raw → cleaned models
│   │   └── marts/              # Final analytical tables
│   └── dbt_project.yml
├── analysis/
│   ├── explore.sql             # Exploratory SQL queries
│   └── correlations.py        # Python correlation analysis
├── powerbi/
│   └── passportism.pbix        # Power BI dashboard
├── screenshots/
│   └── dashboard_overview.png  # Dashboard preview
└── README.md
```

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Python | Data ingestion and ETL pipeline |
| PostgreSQL | Data storage and staging |
| dbt | Data transformation and modelling |
| SQL | Exploration and analysis |
| Power BI | Interactive dashboard |
| Git/GitHub | Version control |

---

## 📊 Data Sources

| Source | Data | URL |
|--------|------|-----|
| Henley Passport Index | Visa-free access count and passport rank by country | [henleypassportindex.com](https://www.henleypassportindex.com) |
| World Bank | GDP per capita and education index by country | [data.worldbank.org](https://data.worldbank.org) |
| Visa Requirements Dataset | Tourist and work visa requirements by origin-destination pair | Kaggle |
| OECD | Skilled worker migration flows | [oecd.org](https://www.oecd.org) |

---

## 🔄 Project Workflow

### 1. Ingestion (`ingestion/fetch_data.py`)
- Python scripts fetch data from each source
- Raw data loaded into PostgreSQL staging tables

### 2. Transformation (dbt)
- Staging models clean and standardise raw data
- Mart models build the final analytical tables:
  - `dim_country` — country reference with ISO codes, region, continent
  - `dim_passport` — passport rank and visa-free access count per country
  - `dim_economy` — GDP per capita, education index, HDI per country
  - `fact_visa_requirements` — visa type (tourist/work/none) required for each origin-destination pair

### 3. Analysis
- SQL queries answer the 5 core questions
- Python correlation analysis between passport rank and education/GDP

### 4. Visualisation (Power BI)
- Page 1: Global passport inequality overview
- Page 2: Education vs passport rank correlation
- Page 3: India spotlight — work visa barriers by destination country
- Page 4: Tourism access — visa burden by passport rank and region

---

## 💡 Key Findings

> *To be updated upon project completion.*

---

## 🇮🇳 The India Angle

India ranks 57th on the Henley Passport Index with visa-free access to 57 destinations. Yet India produces some of the world's highest volumes of STEM graduates and skilled professionals. This project uses India as a case study to explore the disconnect between human capital and passport mobility — a gap that affects millions of skilled workers and travellers worldwide, not just Indians.

---

## 🚀 How to Run

1. Clone this repository
2. Install dependencies: `pip install -r requirements.txt`
3. Set up a PostgreSQL database named `passportism`
4. Run ingestion: `python ingestion/fetch_data.py`
5. Run dbt models: `cd dbt && dbt run`
6. Open `powerbi/passportism.pbix` in Power BI Desktop

---

## 👩‍💻 Author

**Sneha** — Data Analyst | MSc Business Analytics, University College Cork  
[LinkedIn](https://linkedin.com/in/sneha-sampath-/)
