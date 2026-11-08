USE BikeStores;

-- Considering only orders placed in 2018, list the customers who have at least 3 different orders
-- and whose total spending after discounts is above 10,000.
-- The result should include the customer ID, first name, last name, order count and total spending.
-- Sort by total spending in descending order.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT o.order_id) AS [Order Count],
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS [Total Spending]
FROM sales.order_items AS oi
INNER JOIN sales.orders AS o
    ON oi.order_id = o.order_id
INNER JOIN sales.customers AS c
    ON o.customer_id = c.customer_id
WHERE o.order_date >= '20180101' AND o.order_date < '20190101'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT o.order_id) >= 3
    AND SUM(oi.quantity * oi.list_price * (1 - oi.discount)) > 10000
ORDER BY [Total Spending] DESC;