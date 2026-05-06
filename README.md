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

### Page 1 — Global Overview
![Global Overview](screenshots/Global%20overview.png)

### Page 2 — India Spotlight
![India Spotlight](screenshots/India%20spotlight.png)

### Page 3 — Tourism Access
![Tourism Access](screenshots/Tourism%20access.png)

### Page 4 — Passport vs Wealth
![Passport vs Wealth](screenshots/passport%20vs%20wealth.png)

---

## 🗂️ Repository Structure

```
passportism/
├── ingestion/
│   └── unpivot_visa_matrix.py      # Python script to unpivot visa matrix
├── dbt/
│   ├── models/
│   │   ├── staging/
│   │   │   ├── stg_henley_passport_index.sql
│   │   │   ├── stg_gdp_per_capita.sql
│   │   │   └── stg_visa_requirements.sql
│   │   └── marts/
│   │       ├── dim_passport.sql
│   │       ├── dim_economy.sql
│   │       └── fact_visa_requirements.sql
│   └── dbt_project.yml
├── powerbi/
│   └── passportism.pbix             # Power BI report file
├── screenshots/
│   ├── Global overview.png
│   ├── India spotlight.png
│   ├── Tourism access.png
│   └── passport vs wealth.png
└── README.md
```

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Python | Data reshaping — unpivoting visa matrix from wide to long format |
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
| Passport Index Dataset | Visa requirements matrix by origin-destination country pair | [GitHub — ilyankou](https://github.com/ilyankou/passport-index-dataset) |
| World Bank | GDP per capita by country (2023) | [data.worldbank.org](https://data.worldbank.org) |

---

## 🔄 Project Workflow

### 1. Data Ingestion
- Raw CSVs downloaded from Kaggle, GitHub and World Bank
- Loaded into PostgreSQL using `dbt seed`
- Python script (`unpivot_visa_matrix.py`) reshapes the 199x199 visa matrix into long format (39,402 rows)

### 2. Transformation (dbt)
- **Staging models** clean and rename raw columns
- **Mart models** build the final analytical tables:
  - `dim_passport` — passport rank, visa-free count, visa-free %, and region per country
  - `dim_economy` — GDP per capita and income group per country
  - `fact_visa_requirements` — visa type required for every origin-destination country pair

### 3. Visualisation (Power BI)
- **Page 1 — Global Overview:** 168-country access gap, global rankings table, passport strength vs GDP scatter plot
- **Page 2 — India Spotlight:** India rank 147, 170 countries requiring visa, comparison against 7 major world passports
- **Page 3 — Tourism Access:** Average visa-free access by region, passport inequality within and between regions
- **Page 4 — Passport vs Wealth:** Scatter plot and bar chart showing correlation between GDP and passport strength by income group

---

## 💡 Key Findings

- **Global access gap:** The strongest passport (192 visa-free countries) and weakest (24) differ by 168 destinations — purely based on birthplace
- **India spotlight:** India ranks 147th with only 56 visa-free destinations and 24.78% world access, compared to Ireland and Germany at rank 6 with 81.86% access
- **Regional inequality:** Europe averages 185 visa-free countries vs Africa's 64 — a gap of 121 destinations
- **Internal regional inequality:** Asia has the widest internal gap — Singapore at 192 and Bangladesh at 31, a 161-destination difference within the same continent
- **Wealth correlation:** High income countries average 165 visa-free destinations vs Low income countries at 55 — but the correlation is not perfect, showing passport strength is not purely about wealth
- **Tourism burden:** African passport holders can access less than a third of the world visa-free compared to European passport holders

---

## 🇮🇳 The India Angle

This project is personal. As an Indian professional who has navigated visa applications, sponsorship requirements, and mobility barriers firsthand while building a career across Ireland and India, I wanted to quantify what millions of skilled workers experience daily — the invisible ceiling that a passport creates, regardless of your qualifications or character. India ranks 147th on the passport index with visa-free access to only 56 destinations, yet it produces some of the world's highest volumes of STEM graduates and skilled professionals. This project uses India as a case study to explore that disconnect — a gap that affects millions of people worldwide, not just Indians.

---

## 🚀 How to Run

1. Clone this repository
2. Install Python dependencies: `pip install pandas`
3. Install dbt: `pip install dbt-postgres`
4. Set up a PostgreSQL database named `passportism`
5. Configure your dbt profile to connect to PostgreSQL — the profile is stored at `~/.dbt/profiles.yml`. Update the host, port, username and password to match your local PostgreSQL setup
6. Download raw CSVs from the data sources above and place them in `dbt/seeds/`
7. Run the Python script: `python ingestion/unpivot_visa_matrix.py`
8. Run dbt: `cd dbt && dbt seed && dbt run`
9. Open `powerbi/passportism.pbix` in Power BI Desktop and update the PostgreSQL connection string to match your local setup

---

## 👩‍💻 Author

**Sneha** — Data Analyst | MSc Business Analytics, University College Cork  
[LinkedIn](https://linkedin.com/in/sneha-sampath-/) 
