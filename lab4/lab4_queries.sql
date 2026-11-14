SELECT * FROM employees WHERE salary > 300000 ORDER BY salary DESC LIMIT 3;

SELECT name, position, salary FROM employees WHERE department_id = 1 ORDER BY name ASC LIMIT 5;

SELECT * FROM employees WHERE hired >= '2023-01-01' ORDER BY hired DESC LIMIT 4;

SELECT COUNT(*) AS total_employees FROM employees;

SELECT AVG(salary) AS average_salary FROM employees;

SELECT department_id, COUNT(*) AS count_emp FROM employees GROUP BY department_id;

SELECT employees.name, employees.position, departments.name AS department_name FROM employees JOIN departments ON employees.department_id = departments.id;

SELECT departments.name AS department_name, COUNT(employees.id) AS employee_count FROM departments JOIN employees ON departments.id = employees.department_id GROUP BY departments.id, departments.name;