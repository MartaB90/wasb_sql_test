CREATE TABLE EXPENSE (
employee_id TINYINT,
unit_price DECIMAL(8, 2),
quantity TINYINT
);

INSERT INTO EXPENSE (employee_id, unit_price, quantity)
SELECT employee.employee_id, 6.50, 14
FROM employee
WHERE employee.first_name = 'Alex'  AND employee.last_name = 'Jacobson';

INSERT INTO EXPENSE (employee_id, unit_price, quantity)
SELECT employee.employee_id, 11, 20
FROM employee
WHERE employee.first_name = 'Alex'  AND employee.last_name = 'Jacobson';

INSERT INTO EXPENSE (employee_id, unit_price, quantity)
SELECT employee.employee_id, 22, 18
FROM employee
WHERE employee.first_name = 'Alex'  AND employee.last_name = 'Jacobson';

INSERT INTO EXPENSE (employee_id, unit_price, quantity)
SELECT employee.employee_id, 13, 75
FROM employee
WHERE employee.first_name = 'Alex'  AND employee.last_name = 'Jacobson';

INSERT INTO EXPENSE (employee_id, unit_price, quantity)
SELECT employee.employee_id, 300, 1
FROM employee
WHERE employee.first_name = 'Andrea'  AND employee.last_name = 'Ghibaudi';

INSERT INTO EXPENSE (employee_id, unit_price, quantity)
SELECT employee.employee_id, 40, 9
FROM employee
WHERE employee.first_name = 'Darren'  AND employee.last_name = 'Poynton';

INSERT INTO EXPENSE (employee_id, unit_price, quantity)
SELECT employee.employee_id, 17.5, 4
FROM employee
WHERE employee.first_name = 'Umberto'  AND employee.last_name = 'Torrielli';



-- SELECT for testing inserted data

SELECT employee.employee_id, employee.first_name, employee.last_name, expense.unit_price, expense.quantity
FROM expense 
JOIN employee on expense.employee_id = employee.employee_id;
