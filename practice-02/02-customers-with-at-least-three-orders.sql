USE BikeStores;

-- List only the customers who have placed at least 3 orders, along with their order counts.

SELECT
    sc.customer_id,
    sc.first_name,
    COUNT(so.order_id) AS [Order Count]
FROM sales.customers AS sc
LEFT JOIN sales.orders AS so ON sc.customer_id = so.customer_id
GROUP BY sc.customer_id, sc.first_name
HAVING COUNT(so.order_id) >= 3
ORDER BY [Order Count] DESC;