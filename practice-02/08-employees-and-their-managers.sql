USE BikeStores;

/*
 List each employee's first and last name together with their manager's first and last name.
 Employees without a manager should also appear in the result.
 Output columns:
 - Employee ID
 - Employee first and last name
 - Manager first and last name
 Use only the sales.staffs table.
*/

SELECT
    employee.staff_id AS [Employee ID],
    employee.first_name AS [Employee First Name],
    employee.last_name AS [Employee Last Name],
    manager.staff_id AS [Manager ID],
    manager.first_name AS [Manager First Name],
    manager.last_name AS [Manager Last Name]
FROM sales.staffs AS employee
LEFT JOIN sales.staffs AS manager
    ON employee.manager_id = manager.staff_id
ORDER BY employee.staff_id;