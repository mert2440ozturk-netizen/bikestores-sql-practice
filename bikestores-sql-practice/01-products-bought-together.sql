USE BikeStores

/*
Find pairs of products that appear together in the same order and show how many different orders they appear in together. 
The result should include the first product's name, the second product's name and the number of orders they appear in together. 
The pair ordered together most often should appear first.
Rules: A product must not be paired with itself; of the pairs A–B and B–A, only one should be shown.
*/

SELECT
    pp1.product_name AS [Birinci Ürün],
    pp2.product_name AS [İkinci Ürün],
    COUNT(DISTINCT soi1.order_id) AS [Birlikte Sipariş Sayısı]
FROM sales.order_items AS soi1
INNER JOIN sales.order_items AS soi2
    ON soi1.order_id = soi2.order_id
    AND soi1.product_id < soi2.product_id
INNER JOIN production.products AS pp1
    ON soi1.product_id = pp1.product_id
INNER JOIN production.products AS pp2
    ON soi2.product_id = pp2.product_id
GROUP BY
    pp1.product_id, pp1.product_name,
    pp2.product_id, pp2.product_name
ORDER BY [Birlikte Sipariş Sayısı] DESC;
