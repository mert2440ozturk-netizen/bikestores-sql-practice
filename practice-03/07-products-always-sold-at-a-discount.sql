USE BikeStores;

/*
List products that received a discount (discount > 0) on every order line
in which they were sold.
Include the product name, number of times sold (order line count),
and minimum discount rate.
*/

SELECT
    p.product_name AS [Product],
    COUNT(*) AS [Order Line Count],
    MIN(oi.discount) AS [Minimum Discount]
FROM production.products AS p
INNER JOIN sales.order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(oi.discount) > 0
ORDER BY [Order Line Count] DESC;
