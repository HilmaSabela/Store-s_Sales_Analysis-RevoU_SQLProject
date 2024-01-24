-- Full Transactions Data of Stores
SELECT tra.id,
tra.store_id,
tra.customer_id,
tra.product_id,
tra.created_at,
DATEPART(Month, created_at) AS number_month,
cus.city,
cus.email,
cus.gender,
sto.type,
tra.quantity,
pro.price,
tra.total
FROM transactions AS tra
LEFT JOIN customer AS cus
	ON tra.customer_id = cus.id
LEFT JOIN product AS pro
	ON tra.product_id = pro.id
LEFT JOIN store AS sto
	ON tra.store_id = sto.id
ORDER BY tra.id