USE BikeStores;

-- Considering only products with a list price above 500, list the categories that have at least 10 products.

SELECT
    pc.category_id,
    pc.category_name,
    COUNT(pp.product_id) AS [Product Count],
    AVG(pp.list_price) AS [Average Price]
FROM production.products AS pp
INNER JOIN production.categories AS pc
    ON pp.category_id = pc.category_id
WHERE pp.list_price > 500
GROUP BY pc.category_id, pc.category_name
HAVING COUNT(pp.product_id) >= 10
ORDER BY [Product Count] ASC;