USE BikeStores;

-- Considering only orders placed in 2017, list the customers who ordered a total of 20 or more product units.
-- The result should include the customer ID, first name, last name, number of distinct orders
-- and total quantity of products ordered.
-- Sort by total quantity in descending order.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT o.order_id) AS [Order Count],
    SUM(oi.quantity) AS TotalQuantity
FROM sales.order_items AS oi
INNER JOIN sales.orders AS o
    ON oi.order_id = o.order_id
INNER JOIN sales.customers AS c
    ON o.customer_id = c.customer_id
WHERE o.order_date >= '20170101' AND o.order_date < '20180101'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(oi.quantity) >= 20
ORDER BY TotalQuantity DESC;