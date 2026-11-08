USE BikeStores;

/*
List the employees who received at least one order in 2017 but no orders in 2018. 
The result should include the employee ID, first name, last name and number of orders in 2017. 
Sort by order count in descending order.
*/

/*
SELECT
    ss.staff_id AS [identity],
    ss.first_name AS [name],
    ss.last_name AS [last name],
    COUNT(so.order_id) AS [total order 2017],
    COUNT(so2.order_id) AS [total order 2018]
FROM sales.orders AS so
INNER JOIN sales.staffs AS ss
    ON so.staff_id = ss.staff_id
    AND so.order_date >= '20170101'
    AND so.order_date < '20180101'
LEFT JOIN sales.orders AS so2
    ON so.staff_id = so2.staff_id
    AND so2.order_date >= '20180101'
    AND so2.order_date < '20190101'
GROUP BY ss.staff_id, ss.first_name, ss.last_name
HAVING COUNT(so.order_id) >= 1 AND COUNT(so2.order_id) = 0
ORDER BY [total order 2017] DESC;
*/

SELECT
    ss.staff_id AS [identity],
    ss.first_name AS [name],
    ss.last_name AS [last name],
    COUNT(so.order_id) AS [total order 2017]
FROM sales.staffs AS ss
INNER JOIN sales.orders AS so
    ON ss.staff_id = so.staff_id
    AND so.order_date >= '20170101'
    AND so.order_date < '20180101'
LEFT JOIN sales.orders AS so2
    ON ss.staff_id = so2.staff_id
    AND so2.order_date >= '20180101'
    AND so2.order_date < '20190101'
WHERE so2.order_id IS NULL
GROUP BY ss.staff_id, ss.first_name, ss.last_name
ORDER BY [total order 2017] DESC;
