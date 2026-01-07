 
---

# 📘📊 E-Learning Platform Purchase Analysis & Business Insights (MySQL)

A **MySQL-based Data Analysis Project** designed to evaluate **learner behaviour, course performance, revenue trends, and category-level insights** to support decision-making for **ed-tech platforms, course creators, and business teams**.

---

## 🎯 1. Project Overview & Objective

🔍 This project focuses on analysing **e-learning platform purchase data** using **MySQL relational databases** to uncover meaningful business insights.

📌 The objective is to help **platform owners and decision-makers** take **data-driven actions** based on:

* Revenue contribution
* Learner engagement
* Course and category performance

### 🎯 Key Goals:

* 💰 Identify **top-performing courses & categories**
* 👥 Analyse **learner purchasing behaviour**
* 🌍 Understand **country-wise revenue trends**
* 📉 Detect **underperforming or unpurchased courses**
* 📈 Support **marketing, pricing & content strategy**

---

## 🗂️ 2. Data Sources

| 📊 Source    | Details                                  |
| ------------ | ---------------------------------------- |
| 🗄️ Database | MySQL Relational Database                |
| 📚 Tables    | Learners, Courses, Purchases             |
| 📆 Domain    | E-Learning & Digital Education Analytics |
| 🎯 Scope     | Revenue, Engagement & Performance        |

---

## ❓ 3. Problem Statement

💡 To derive **actionable business intelligence** that helps:

* 💰 Measure **revenue performance across courses**
* 👥 Identify **high-value learners**
* 🗂️ Evaluate **category-wise demand**
* 🌍 Analyse **geographical spending behaviour**
* 🚨 Detect **courses with zero or low engagement**

---

## 📄 4. Attributes (Columns / Features)

| 🔤 Field      | 🧾 Type | 📌 Description              |
| ------------- | ------- | --------------------------- |
| Learner ID    | Numeric | Unique learner identifier   |
| Learner Name  | Text    | Name of the learner         |
| Country       | Text    | Learner’s country           |
| Course ID     | Numeric | Unique course identifier    |
| Course Name   | Text    | Course title                |
| Category      | Text    | Course category             |
| Price         | Numeric | Unit price of course        |
| Quantity      | Numeric | Number of courses purchased |
| Purchase Date | Date    | Date of transaction         |

---

## 🛠️ 5. Tools & Technologies

* 🐬 **MySQL** → Data querying & analysis
* 🧮 **SQL Functions** → SUM, COUNT, DISTINCT
* 🔗 **Joins** → INNER, LEFT, RIGHT
* 📊 **Aggregations** → Revenue & behaviour analysis

---

## 🧹 6. Data Preparation Summary

✔ Created structured relational tables
✔ Ensured proper primary & foreign key relationships
✔ Cleaned and validated numeric & date fields
✔ Applied joins to combine learner, course & purchase data
✔ Standardised categories and pricing formats

---

## 🔗 7. Data Modelling & Query Logic

### 🧩 Relational Schema

Purchases Table (Fact)

        ↕

* Learners Table 👥
* Courses Table 📚

### 📌 Key SQL Logic Used

* 💰 Revenue Calculation → `Quantity × Price`
* 🔢 Total Sales → `SUM()`
* 👥 Learner Count → `COUNT(DISTINCT Learner_ID)`
* 🗂️ Category Performance → `GROUP BY Category`
* 🚨 Zero Sales Detection → `LEFT JOIN + NULL check`

---

## 📊 8. Analysis & Key Insights

### 📘 Course Performance Insights

* 🏆 **Top-Selling Courses**

  * SQL for Beginners
  * Power BI Dashboard Design
* 📈 High sales volume reflects **strong learner demand**

---

### 🗂️ Category-Level Insights

* 🚀 **Top Revenue Categories**

  * Business Intelligence
  * Data Science
  * Artificial Intelligence
* 💡 Advanced, job-oriented courses outperform introductory ones

---

### 👥 Learner Behaviour Insights

* 🔄 Learners frequently purchase across **multiple categories**
* 💎 Indicates high engagement and multi-skill learning interest

---

### 🌍 Geographical Insights

* 🌐 Revenue contribution varies by country
* 📊 Enables **region-based marketing & pricing strategies**

---

### 🚨 Course Gap Analysis

* ❌ At least one course recorded **zero purchases**
* ⚠ Highlights issues in visibility, relevance, or pricing

---

## 💡 9. Insights (Business Perspective)

### 📊 Descriptive

✔ Strong revenue driven by repeat purchases
✔ BI, Data Science & AI dominate demand

### 🔍 Diagnostic

⚠ Some courses lack visibility or alignment with learner needs

### 🔮 Predictive

📈 Demand for career-focused and advanced skills likely to grow

### 📝 Prescriptive

* 🎯 Promote high-performing categories
* 📦 Introduce bundled course offerings
* 🔧 Revamp or reposition unpurchased courses
* 🤖 Implement personalised recommendations

---

## 🔚 10. Conclusion

✔ Delivered a complete **MySQL-based analytical solution**
✔ Identified **revenue drivers & learner engagement patterns**
✔ Highlighted **content gaps and growth opportunities**
✔ Enabled **data-backed decision-making for e-learning platforms**

---

## 🤝 Contribution & Feedback

Contributions and suggestions are welcome!
📌 Feel free to fork the repository or share feedback.

---

## 📬 Author

👤 **M. Punitha**

💼 *Aspiring Data Analyst*

📧 **Email:**   *[punithagvgvc@gmail.com](mailto:punithagvgvc@gmail.com)*

🔗 **LinkedIn:** [www.linkedin.com/in/punitha-muthusamy-6b46b2244](http://www.linkedin.com/in/punitha-muthusamy-6b46b2244)

🐙 **GitHub:**  [github.com/punithamuthusamy-ux
](https://github.com/punithamuthusamy-ux)

---

⭐ *If you found this project useful, consider starring the repository!*
📢 *Let’s build smarter learning platforms through data analytics* 📘📊🚀

---

 
