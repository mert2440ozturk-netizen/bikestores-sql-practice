USE BikeStores;

/*
Question 2: Average revenue per order
List each store's total revenue (after discounts) and average revenue per order for 2018.
Include the store name, order count, total revenue, and average revenue per order.
Hint: Using AVG here would produce an incorrect result. Why?
*/

SELECT
    ss.store_name AS [Store],
    COUNT(DISTINCT so.order_id) AS [Order Count],
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS [Total Revenue],
    SUM(oi.quantity * oi.list_price * (1 - oi.discount))
        / COUNT(DISTINCT so.order_id) AS [Average Revenue per Order]
FROM sales.stores AS ss
INNER JOIN sales.orders AS so
    ON ss.store_id = so.store_id
INNER JOIN sales.order_items AS oi
    ON so.order_id = oi.order_id
WHERE so.order_date >= '20180101' AND so.order_date < '20190101'
GROUP BY ss.store_id, ss.store_name
ORDER BY [Total Revenue] DESC;


