DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  floor INTEGER
) STRICT;
 
CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  position TEXT NOT NULL,
  salary INTEGER,
  hired TEXT,
  department_id INTEGER REFERENCES departments(id)
) STRICT;

INSERT INTO departments (name, floor) VALUES
('Юридический отдел', 2),
('Бухгалтерия', 3),
('IT отдел', 1);

INSERT INTO employees (name, position, salary, hired, department_id) VALUES
('Алибек Сатыбалдиев', 'Юрист', 350000, '2023-01-15', 1),
('Динара Каримова', 'Старший юрист', 500000, '2022-05-10', 1),
('Арман Сериков', 'Бухгалтер', 300000, '2023-03-20', 2),
('Асель Оспанова', 'Главный бухгалтер', 550000, '2021-11-01', 2),
('Тимур Бейсенов', 'Системный администратор', 400000, '2023-07-10', 3),
('Мадина Нурланова', 'Разработчик', 600000, '2023-09-01', 3),
('Ерлан Жумабаев', 'Менеджер по продажам', 280000, '2024-01-10', 1),
('Томирис Абишева', 'Помощник бухгалтера', 220000, '2024-02-15', 2);

UPDATE employees SET salary = salary + 50000 WHERE id = 1;

DELETE FROM employees WHERE id = 8;

SELECT * FROM employees;

SELECT AVG(salary) AS average_salary FROM employees;

