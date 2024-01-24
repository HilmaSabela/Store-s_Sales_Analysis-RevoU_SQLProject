# Store's Sales Analysis - RevoU SQL Project

## Table of Content 
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Result](#result)
- [Obstacles](#obstacles)
- [Tableau Analysis](#tableau-analysis)

## Project Overview
This project is derived from a mini-course by RevoU that discusses the SQL programming language. There are datasets and business questions as tasks that will be answered using SQL programming language. The dataset contains detailed information about a store consisting of transaction data, customers, stores, and product types. The purpose of this project is not only to answer business questions from people who need to gain insights but also to analyze the store. Analyzing using Tableau analysis tool software as an addition that I performed in this project.  

## Data Sources
The sources of this project consist of the Business Questions task file, product.csv, transactions.csv, store.csv, and customer.csv. These can be downloaded here :
- [Store's Sales Dataset](https://docs.google.com/document/d/1gGfwgjqfvXAEfvjddAw1UZEdPWClLWHkT0sRRI3xht0/edit).
 
## Tool 
1. SQL --> Select Data from the tables that are needed and combine the required data from several tables then save the results in Excel
2. Tableau --> Analyze and Visualize

## Result
Writing Query Using SQL Server Management Studio to answer business questions:
1. How many female customers in Depok should we give promotions via email to for each type of email?
```sql
SELECT email, count(ID) AS total_customers
FROM customer
WHERE city = 'Depok' and gender = 'Female'
GROUP BY email
```
Result:
![alt text](Result1.jpg)

2. Provide 10 customer IDs with the largest total overall purchases.
- Here is the SQL code for the answer
```sql
SELECT TOP(10) 
customer_id, SUM(total) as total
FROM transactions
GROUP by customer_id
ORDER by total DESC
```
3. How many products are there in the database that cost less than 1000?
- Here is the SQL code for the answer
```sql
SELECT id, price
FROM product
WHERE price < 1000
```
4. Provide a list of the 5 most purchased product_ids
- Here is the SQL code for the answer
```sql
SELECT TOP 5
product_id, 
SUM(quantity) as total_quantity
FROM transactions
GROUP BY product_id
ORDER BY total_quantity DESC
```
5. What are the number of transactions, revenue, and number of products sold on the platform monthly? Are the results increasing or not?
- Here is the SQL code for the answer
```sql
SELECT DATEPART(Month, created_at) Month,
COUNT(DISTINCT id) AS total_transactions, 
SUM(quantity) AS total_quantity, 
SUM(total) AS total_revenue
FROM transactions
GROUP BY DATEPART(Month, created_at)
ORDER BY DATEPART(Month, created_at) ASC
```
6. Provide information on total spending and average spending from customers per city?
- Here is the SQL code for the answer
```sql
SELECT cus.city,
SUM(tra.total) as sum_total,
AVG(tra.total) as avg_total
FROM transactions AS tra
LEFT JOIN customer as cus
	ON cus.id = tra.customer_id
GROUP BY cus.city
```
7. How many customers have a total expenditure of more than > 200,000? Please group them by store type
- Here is the SQL code for the answer
```sql
SELECT sto.type,
COUNT(DISTINCT tra.customer_id) AS total_customers
FROM transactions AS tra
LEFT JOIN dbo.store AS sto
	ON tra.store_id = sto.id
GROUP BY sto.type
HAVING SUM(tra.total) >= 200000
```

### Obstacles
The problem encountered was some errors when running the following program in questions 5, 6, and 7:
```sql
SUM(total)
```
errors : 
"Arithmetic overflow error for data type tinyint, value = 74251"
"Arithmetic overflow error converting expression to data type int"

After finding out by looking at the data type
```sql
SELECT
TABLE_NAME,
COLUMN_NAME,
DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
```
In the "total" column in the transactions table, the data type is "int", so to eliminate errors this is done by changing the data type to "bigint"

```sql
ALTER TABLE transactions
ALTER COLUMN total bigint
```

## Tableau Analysis
The analysis can be seen in the link below:
- [Store's Sales Analysis Dashboar](https://www.example.com)

