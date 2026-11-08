USE BikeStores;
/*
List the customers who have placed orders from at least two different stores.

The result should include:
- Customer ID, first name and last name
- Number of different stores ordered from
- Total number of orders

Sort by the number of different stores in descending order; in case of a tie, the customer with more total orders should come first.
*/

SELECT
    sc.customer_id,
    sc.first_name,
    sc.last_name,
    COUNT(so.order_id) AS [Toplam Sipariş Sayısı],
    COUNT(DISTINCT so.store_id) AS [Farklı Mağaza Sayısı]
FROM sales.orders AS so
INNER JOIN sales.customers AS sc
    ON so.customer_id = sc.customer_id
GROUP BY sc.customer_id, sc.first_name, sc.last_name
HAVING COUNT(DISTINCT so.store_id) >= 2
ORDER BY
    [Farklı Mağaza Sayısı] DESC,
    [Toplam Sipariş Sayısı] DESC;
