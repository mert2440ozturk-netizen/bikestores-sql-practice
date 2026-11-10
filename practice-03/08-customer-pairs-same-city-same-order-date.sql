USE BikeStores;

/*
Find pairs of different customers who live in the same city
and placed orders on the same day.
Include the city, order date, and full names of both customers.
Include only one of each A–B and B–A pair.
*/

SELECT DISTINCT
    c1.city AS [City],
    o1.order_date AS [Order Date],
    c1.first_name + ' ' + c1.last_name AS [Customer 1],
    c2.first_name + ' ' + c2.last_name AS [Customer 2]
FROM sales.orders AS o1
INNER JOIN sales.orders AS o2
    ON o1.order_date = o2.order_date
    AND o1.customer_id < o2.customer_id
INNER JOIN sales.customers AS c1
    ON o1.customer_id = c1.customer_id
INNER JOIN sales.customers AS c2
    ON o2.customer_id = c2.customer_id
WHERE c1.city = c2.city
    AND c1.state = c2.state
ORDER BY [Order Date], [City];