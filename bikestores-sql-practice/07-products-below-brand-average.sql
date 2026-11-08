USE BikeStores;

/*
List the products that are cheaper than the average product price of their own brand. 
The result should include the product name and list price; sort by price in ascending order. 
Use only the production.products table.
*/

SELECT
    pp.product_name,
    pp.list_price
FROM production.products AS pp
WHERE pp.list_price < (
    SELECT AVG(p2.list_price)
    FROM production.products AS p2
    WHERE p2.brand_id = pp.brand_id
)
ORDER BY pp.list_price ASC;
