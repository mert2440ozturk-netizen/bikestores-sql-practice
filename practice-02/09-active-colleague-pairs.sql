USE BikeStores;

/*
 Find pairs of coworkers who work in the same store.
 The two employees must meet the following conditions:
 - They work in the same store.
 - They report to the same manager, and the manager is not NULL.
 - Both are active (active = 1).
 The result should include the store name and the first and last names of both employees.
 An employee must not be paired with themselves. Also, since A–B and B–A are the same pair,
 only one of them should be shown.
*/

SELECT
    s.store_name AS [Store Name],
    [first employee].first_name AS [Employee 1 First Name],
    [first employee].last_name AS [Employee 1 Last Name],
    [second employee].first_name AS [Employee 2 First Name],
    [second employee].last_name AS [Employee 2 Last Name]
FROM sales.stores AS s
INNER JOIN sales.staffs AS [first employee]
    ON s.store_id = [first employee].store_id
INNER JOIN sales.staffs AS [second employee]
    ON s.store_id = [second employee].store_id
WHERE [first employee].store_id = [second employee].store_id
    AND [first employee].manager_id IS NOT NULL
    AND [second employee].manager_id IS NOT NULL
    AND [first employee].manager_id = [second employee].manager_id
    AND [first employee].active = 1
    AND [second employee].active = 1
    AND [first employee].staff_id < [second employee].staff_id;