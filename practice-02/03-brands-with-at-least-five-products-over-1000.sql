USE BikeStores;
-- Considering only products priced above 1,000, list the brands that have at least 5 products.

SELECT
    pb.brand_id,
    pb.brand_name,
    COUNT(pp.product_id) AS ProductCount
FROM production.products AS pp
INNER JOIN production.brands AS pb
    ON pp.brand_id = pb.brand_id
WHERE pp.list_price > 1000
GROUP BY pb.brand_id, pb.brand_name
HAVING COUNT(pp.product_id) >= 5
ORDER BY ProductCount ASC;