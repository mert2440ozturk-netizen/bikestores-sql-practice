USE BikeStores;

/*
Question 4: Returning customers
List customers who placed orders in both 2016 and 2018.
Include the customer ID, first name, last name, first order date, and last order date.
Hint: There are two approaches. One uses a single JOIN with MIN and MAX.
*/

SELECT
    sc.customer_id,
    sc.first_name,
    sc.last_name,
    MIN(so.order_date) AS [First Order Date],
    MAX(so.order_date) AS [Last Order Date]
FROM sales.customers AS sc
INNER JOIN sales.orders AS so
    ON sc.customer_id = so.customer_id
WHERE (so.order_date >= '20160101' AND so.order_date < '20170101')
   OR (so.order_date >= '20180101' AND so.order_date < '20190101')
GROUP BY sc.customer_id, sc.first_name, sc.last_name
HAVING MIN(so.order_date) < '20170101'
   AND MAX(so.order_date) >= '20180101';