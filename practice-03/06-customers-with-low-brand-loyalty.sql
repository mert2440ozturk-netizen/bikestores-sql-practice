USE BikeStores;

/*
Question 6: Customers with low brand loyalty
List customers who have purchased products from at least 3 different brands.
Include the customer's first name, last name, distinct brand count, and total spending.
Sort by distinct brand count in descending order, then by total spending
in descending order to break ties.

Hint: Draw the chain from customers to brands on paper: how many tables are involved?
*/

SELECT
    c.first_name AS [First Name],
    c.last_name AS [Last Name],
    COUNT(DISTINCT p.brand_id) AS [Distinct Brand Count],
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS [Total Spending]
FROM sales.customers AS c
INNER JOIN sales.orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id
INNER JOIN production.products AS p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT p.brand_id) >= 3
ORDER BY [Distinct Brand Count] DESC, [Total Spending] DESC;
