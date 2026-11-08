USE BikeStores;
/*
List the products whose list price is higher than the average list price of the products in their own category. 
The result should include the product name, category name and list price. Sort by price in descending order.
*/

SELECT
    pp.product_name AS [product name],
    pc.category_name AS [category name],
    pp.list_price AS [list price]
FROM production.products AS pp
INNER JOIN production.categories AS pc
    ON pp.category_id = pc.category_id
WHERE pp.list_price > (
    SELECT AVG(p2.list_price)
    FROM production.products AS p2
    WHERE p2.category_id = pp.category_id
)
ORDER BY pp.list_price DESC;
