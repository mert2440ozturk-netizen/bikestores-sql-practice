-- BikeStores SQL Practice: Unsold Products in Stock

USE BikeStores;

/*
Question 1: Products in stock that have never been sold
List products that have stock in at least one store (quantity > 0)
but have never appeared in any order.
Include the product name, brand name, and total stock quantity across all stores.
Sort by total stock in descending order.
Hint: Four tables are involved. Which one should use a LEFT JOIN?
*/

SELECT
    pp.product_name,
    pb.brand_name,
    SUM(ps.quantity) AS [Total Stock]
FROM production.products AS pp
INNER JOIN production.brands AS pb
    ON pp.brand_id = pb.brand_id
INNER JOIN production.stocks AS ps
    ON pp.product_id = ps.product_id
LEFT JOIN sales.order_items AS oi
    ON pp.product_id = oi.product_id
WHERE oi.order_id IS NULL
GROUP BY pp.product_id, pp.product_name, pb.brand_name
HAVING SUM(ps.quantity) > 0
ORDER BY [Total Stock] DESC;