<div align="center">

🍕 PizzaHut Sales Analysis Using SQL

Turning transactional pizza sales data into business insights

<p>
  <img src="https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="SQL and MySQL">
  <img src="https://img.shields.io/badge/Domain-Sales%20Analytics-E85D04?style=for-the-badge" alt="Sales Analytics">
  <img src="https://img.shields.io/badge/Project-Portfolio-6C63FF?style=for-the-badge" alt="Portfolio Project">
</p>

<p>
  <a href="#-project-overview"><img src="https://img.shields.io/badge/📌_Overview-333333?style=for-the-badge" alt="Project Overview"></a>
  <a href="#-analysis-questions"><img src="https://img.shields.io/badge/📊_Analysis-333333?style=for-the-badge" alt="Analysis Questions"></a>
  <a href="#-sql-skills-demonstrated"><img src="https://img.shields.io/badge/💻_SQL_Skills-333333?style=for-the-badge" alt="SQL Skills"></a>
  <a href="#-project-files"><img src="https://img.shields.io/badge/📂_Project_Files-333333?style=for-the-badge" alt="Project Files"></a>
</p>

<p>
  <a href="pizzahut_sales_analysis.sql"><strong>⬇️ View SQL Queries</strong></a>
  &nbsp; • &nbsp;
  <a href="PizzaHut_Sales_Analysis_SQL.pdf"><strong>📄 View Project PDF</strong></a>
</p>

</div>

**📌 Project Overview:**

The PizzaHut Sales Analysis project uses SQL to explore pizza order and product data. It answers business questions about order volume, revenue, popular pizza sizes and types, category performance, hourly ordering patterns, and cumulative sales.

The goal is to demonstrate practical SQL skills and show how relational data can be queried to support sales analysis and business decision-making.

Project scope: The SQL script contains basic, intermediate, and advanced analysis queries. This repository documents the questions and methods; numerical findings should be added after running the queries against the dataset.

**🎯 Objectives:**

Calculate total orders and revenue from pizza sales.

Identify the highest-priced pizza and most frequently ordered sizes.

Find the most ordered pizza types by quantity and revenue.

Compare sales quantities across pizza categories.

Examine the hourly distribution of orders.

Calculate the average number of pizzas ordered per day.

Analyze category revenue contribution and cumulative revenue over time.

Rank the top revenue-generating pizza types within each category.

**🧰 Tools & Technologies:**

**1) MySQL**

SQL dialect and database functions used in the script

**2) Relational tables**

Connecting orders, order details, pizzas, and pizza types

**3) GitHub**

Version control and project portfolio documentation

**📊 Analysis Questions:**

**🟢 Basic Analysis:**

How many orders were placed?

What is the total revenue generated from pizza sales?

Which pizza has the highest price?

Which pizza size is ordered most frequently?

What are the five most ordered pizza types by quantity?

**🟡 Intermediate Analysis:**

What is the total quantity ordered for each pizza category?

How are orders distributed by hour of the day?

How many pizza types are listed in each category?

What is the average number of pizzas ordered per day?

Which three pizza types generate the most revenue?

**🔴 Advanced Analysis:**

What percentage of total revenue comes from each pizza category?

How does cumulative revenue change over time?

Which three pizza types generate the most revenue within each category?

**💻 SQL Skills Demonstrated:**

**1) SQL concept**

How it is used

**2) SELECT and aliases**

Selecting fields and naming calculated outputs

**3) Aggregate functions**

COUNT(), SUM(), and AVG() for sales summaries

**4) JOIN**

Combining related tables for product and order analysis

**5) GROUP BY**

Summarising data by date, pizza type, size, and category

**6) ORDER BY and LIMIT**

Sorting results and returning top-performing products

**7) ROUND()**

Rounding revenue and average calculations

**8) Subqueries**

Comparing category revenue with total revenue

**9) Window functions**

Calculating cumulative revenue and category rankings

**10) RANK()**

Ranking pizza types within each category

**11) HOUR()**

Grouping orders by hour

**🗄️ Database Structure:**

The SQL analysis references these four tables:

**Tables:**

**1) orders**

Order identifiers, dates, and times

**2) order_details**

Order line identifiers, pizza identifiers, and quantities

**3) pizzas**

Pizza identifiers, sizes, prices, and pizza type identifiers

**4) pizza_types**

Pizza names and categories

**Table relationships:**

orders.order_id → order_details.order_id

pizzas.pizza_id → order_details.pizza_id

pizza_types.pizza_type_id → pizzas.pizza_type_id

These joins connect order activity with product details so the queries can calculate quantities and revenue.

**🔍 Example SQL Query:**

The following query calculates total sales revenue by multiplying pizza prices by quantities sold:

SELECT ROUND(SUM(p.price * od.quantity), 2) AS Total_Revenue
FROM pizzahut.pizzas AS p
JOIN pizzahut.order_details AS od
    ON p.pizza_id = od.pizza_id;

**What it does:** joins pizza pricing with order quantities, multiplies price by quantity, and sums the result to estimate total revenue.

**📈 Potential Business Applications:**

The analysis can help a business investigate:

Which products and sizes customers order most often.

Which pizza categories contribute most to sales revenue.

Which products are strong revenue performers.

How order activity varies by hour and date.

How revenue accumulates over the analysis period.

## 🙏 Acknowledgements

I would like to express my sincere gratitude to **Ayushi Jain and the WsCube Tech** for providing valuable learning resources and guidance throughout my SQL learning journey.

Their tutorials and practical explanations helped me strengthen my understanding of SQL concepts and apply them to real-world business problems through this PizzaHut Sales Analysis project.

This project has been a valuable learning experience, allowing me to practise SQL queries, table joins, aggregate functions, subqueries, and window functions while exploring meaningful insights from sales data.

I am thankful to **Ayushi Jain and the WsCube Tech team** for sharing their knowledge and making technical concepts accessible to aspiring data analysts.

**Thank you for inspiring learners like me to keep learning, practising, and growing in the field of data analytics!** 💙


**🔗 Connect With Me:**

**LinkedIn:**
www.linkedin.com/in/aishwarya-jayant-dixit-399b56211

**GitHub:**
https://github.com/Aishwarya-JD/Aishwarya-JD.git

**👩‍💻 About:**

**Aspiring Data Analyst | Excel | SQL | Power BI | Python**

I am building practical analytics projects to strengthen my skills in querying data, analysing business questions, and communicating findings. This project showcases my use of SQL joins, aggregation, subqueries, and window functions in a sales-analysis scenario.

⭐ Support If you found this project helpful, please consider:

⭐ Starring the repository

🍴 Forking the project

💬 Sharing your feedback
