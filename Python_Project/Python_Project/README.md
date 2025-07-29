# 📊 Customer Segmentation Analysis: Driving Targeted Marketing Strategies

## 📌 Project Description

This project analyzes customer demographics and spending behaviors using Python. The goal is to identify valuable customer segments to guide data-driven marketing strategies and expansion decisions. It addresses the challenge of prioritizing target groups based on size, profitability, and demographic stability.

## 🛠️ Tools Used

* **Python 3.x**
* **Pandas:** For data manipulation and analysis.
* **Matplotlib:** For static, high-quality data visualizations.
* **Seaborn:** For enhanced statistical data visualizations.
* **Jupyter Notebook / Google Colaboratory:** For interactive analysis and documentation.

## 🔍 Key Findings & Insights

* **Segment Distribution:** Customers are relatively evenly distributed across segments A, B, C, and D, with **Segment D being the largest**.
* **Professional Focus:** "Artist" is the most popular profession in Segments A, B, and C, while "Healthcare" dominates **Segment D**.
* **Demographic Differences:**
    * **Age:** Segment D is the youngest (Avg. ~32 years), and Segment C is the oldest (Avg. ~48 years).
    * **Education:** Segments A, B, C are predominantly educated/graduated, contrasting sharply with **Segment D (majority non-graduates)**.
* **High-Value Segments (B & C):** These segments exhibit the **highest spending scores**. They are characterized by:
    * Older average age (~48 years).
    * Moderate work experience (~2.7 years).
    * Moderate family size (~2 members).
    * A high proportion of married customers (~75% in high-spending segments).
* **Work Experience Correlation:** An **inverse relationship** is observed: segments with higher average spending scores tend to have lower average work experience.
* **Optimal Expansion:** **Segment B** offers the most promising growth potential due to its combination of high spending capacity, mature and educated professionals (primarily artists), and a solid demographic base. Segment C is also high-value but may be a niche.

## How to Use This Project

To run this analysis:

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/GennadiyGolubev/GG_project_prtfolio_PRTD.git](https://github.com/GennadiyGolubev/GG_project_prtfolio_PRTD.git)
    cd GG_project_prtfolio_PRTD
    ```
2.  **Access the Notebook:**
    * Navigate to the `10_questions_ipunb` folder.
    * Open `customer_segmentation_analysis.ipynb` in Google Colab (via `File` > `Upload notebook` or `File` > `Open notebook` > `GitHub`).
3.  **Ensure Data Availability:** The `train.csv` dataset is located in the `data` folder within the repository.
4.  **Run Cells:** Execute each cell sequentially to reproduce the analysis and visualizations.

## 📁 Repository Structure
.
├── 10_questions_ipunb/           # Contains the Jupyter Notebook (.ipynb)
│   └── customer_segmentation_analysis.ipynb
├── data/                         # Contains the dataset
│   └── train.csv
└── README.md                     # Project overview and documentation (this file)

**Dataset Source:** [Kaggle: Customer Segmentation](https://www.kaggle.com/datasets/abisheksudarshan/customer-segmentation/data?select=train.csv)

## 📊 Link to Live Dashboard

*Coming soon – This section will be updated once the Power BI dashboard is published.*

## Author

* **Gennadiy Golubev**
* [LinkedIn Profile](https://www.linkedin.com/in/gennadiy-golubev-a34938a3/)