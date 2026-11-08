USE BikeStores;

-- List the customers who have never placed an order.

SELECT sc.customer_id, sc.first_name, sc.last_name, sc.city
FROM sales.customers AS sc
LEFT JOIN sales.orders AS so ON sc.customer_id = so.customer_id
WHERE so.order_id IS NULL
ORDER BY sc.last_name ASC, sc.first_name ASC;