USE BikeStores;

/*
Question 5: Most expensive products in each category
List the most expensive product (or products) in each category.
Include the category name, product name, and list price.
If multiple products share the highest price in a category, include all of them.
Hint: If you use GROUP BY category_name with MAX, you cannot include
the product name in SELECT without grouping or aggregating it.
*/

SELECT
    pc.category_name AS [Category],
    pp.product_name AS [Product],
    pp.list_price AS [List Price]
FROM production.products AS pp
INNER JOIN production.categories AS pc
    ON pp.category_id = pc.category_id
WHERE pp.list_price = (
    SELECT MAX(p2.list_price)
    FROM production.products AS p2
    WHERE p2.category_id = pp.category_id
)
ORDER BY pc.category_name;