----1. Purpose : Looking for female customers in Depok to give the promostions through emial
----Task : Give the datas of customers that we should give the promotions per each emails.

--SELECT email
--FROM customer
--WHERE city = 'Depok' and gender = 'Female'
--ORDER by id ASC

---- 2. Task : Looking for 10 customers who buy the most to give discount in 9.9 campaign

--SELECT TOP(10) 
--customer_id, SUM(total) as total
--FROM transactions
--GROUP by customer_id
--ORDER by total DESC

----3. Task : Looking for price of products that under Rp 1000

--SELECT id, price
--FROM product
--WHERE price < 1000

----4. Task : Looking for top 5 product that sell the most

--SELECT TOP 5
--product_id, 
--SUM(quantity) as total_quantity
--FROM transactions
--GROUP BY product_id
--ORDER BY total_quantity DESC

----5. Task : Looking for how many transaction, revenue, and total sell of the product per month. Find the trend.

--SELECT DATEPART(Month, created_at) Month,
--COUNT(DISTINCT id) AS total_transactions, 
--SUM(quantity) AS total_quantity, 
--SUM(total) AS total_revenue
--FROM transactions
--GROUP BY DATEPART(Month, created_at)
--ORDER BY DATEPART(Month, created_at) ASC


----6. Task : Looking for information on customers' total expenditure and average expenditure(shopping) per city. 

--SELECT cus.city,
--SUM(tra.total) as sum_total,
--AVG(tra.total) as avg_total
--FROM transactions AS tra
--LEFT JOIN customer as cus
--	ON cus.id = tra.customer_id
--GROUP BY cus.city

----7. Task : Looking for how many the customers who spend money more than Rp 200000, group by the store type. 

SELECT sto.type,
COUNT(DISTINCT tra.customer_id) AS total_customers
FROM transactions AS tra
LEFT JOIN dbo.store AS sto
	ON tra.store_id = sto.id
GROUP BY sto.type
HAVING SUM(tra.total) >= 200000



--ALTER TABLE transactions
--ALTER COLUMN total bigint

--SELECT 
--TABLE_NAME,
--COLUMN_NAME, 
--DATA_TYPE 
--FROM INFORMATION_SCHEMA.COLUMNS 
