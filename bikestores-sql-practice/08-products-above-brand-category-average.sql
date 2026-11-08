USE BikeStores;
/*
List the products that are more expensive than the average price of the products that belong to both their own brand and their own category.
The result should include the product ID, product name and list price. Sort by price in descending order.
Only the production.products table is needed.
*/

SELECT 
    pp.product_id,
    pp.product_name,
    pp.list_price
FROM production.products AS pp
WHERE pp.list_price > (
    SELECT AVG(p2.list_price)
    FROM production.products AS p2
    WHERE(
        pp.brand_id = p2.brand_id
        AND pp.category_id = p2.category_id
    )
)
ORDER BY pp.list_price DESC;
