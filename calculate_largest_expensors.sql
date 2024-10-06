WITH AMOUNT AS 
	(SELECT employee_id, SUM(expensed_amount) AS total_expensed_amount
		FROM (SELECT  employee_id, unit_price, quantity, EXPENSE.unit_price * EXPENSE.quantity AS expensed_amount FROM EXPENSE)
		GROUP BY employee_id) 

SELECT 
	EMPLOYEE.employee_id, 
	CONCAT(EMPLOYEE.first_name, ' ', EMPLOYEE.last_name) as employee_name, 
	EMPLOYEE.manager_id, 
	CONCAT(MANAGER.first_name, ' ', MANAGER.last_name) as manager_name, 
	AMOUNT.total_expensed_amount
FROM AMOUNT
LEFT JOIN EMPLOYEE
	on AMOUNT.employee_id = EMPLOYEE.employee_id
LEFT JOIN EMPLOYEE as MANAGER
	on EMPLOYEE.manager_id = MANAGER.employee_id
WHERE 
	AMOUNT.total_expensed_amount > 1000 ;
