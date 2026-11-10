USE BikeStores;

/*
Question 3: Orders shipped late
For each store, list the number of orders shipped after their required delivery date (required_date).
Include stores with no late orders, showing a count of 0.
Include the store name and late order count.
Hint: Should the condition go in WHERE or ON? Recall the 2018 employee question.
*/

SELECT
    ss.store_name AS [Store],
    COUNT(so.order_id) AS [Late Order Count]
FROM sales.stores AS ss
LEFT JOIN sales.orders AS so
    ON ss.store_id = so.store_id
    AND so.shipped_date > so.required_date
GROUP BY ss.store_id, ss.store_name
ORDER BY [Late Order Count] DESC;