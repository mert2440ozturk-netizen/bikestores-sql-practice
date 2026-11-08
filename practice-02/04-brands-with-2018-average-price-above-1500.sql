USE BikeStores;

-- Considering only 2018 model products, list the brands whose average product price is above 1,500.

SELECT
    pb.brand_id,
    pb.brand_name,
    COUNT(pp.product_id) AS [Product Count],
    AVG(pp.list_price) AS [Average Price]
FROM production.products AS pp
INNER JOIN production.brands AS pb
    ON pp.brand_id = pb.brand_id
WHERE pp.model_year = 2018
GROUP BY pb.brand_id, pb.brand_name
HAVING AVG(pp.list_price) > 1500
ORDER BY [Average Price] DESC;