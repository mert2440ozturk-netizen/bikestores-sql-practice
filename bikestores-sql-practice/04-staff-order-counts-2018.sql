USE BikeStores
/*
List the number of orders each employee received in 2018. Employees who received no orders in 2018 should also appear with 0.
The result should include the employee ID, first name, last name and order count. Sort by order count in descending order.
*/

SELECT
    ss.staff_id AS [identity],
    ss.first_name AS [name],
    ss.last_name AS [last name],
    COUNT(so.order_id) AS [number of orders]
FROM sales.staffs AS ss
LEFT JOIN sales.orders AS so
    ON ss.staff_id = so.staff_id
    AND so.order_date >= '20180101'
    AND so.order_date < '20190101'
GROUP BY ss.staff_id, ss.first_name, ss.last_name
ORDER BY [number of orders] DESC;

