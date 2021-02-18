-- Insert at least 15 new employees:
-- With salaries that are between a range of 5,000 and 50,000 of different gender, 5 employees must have at least two salaries in different ranges of dates and different amounts
INSERT INTO salaries VALUES (2,5000,'2000-01-01', '2021-05-25'),
(3,50000,'2000-01-01', '2021-05-25'),
(4,20000,'2000-01-01', '2021-05-25'),
(5,19000,'2000-01-01', '2021-05-25'),
(6,45000,'2000-01-01', '2021-05-25'),
(7,47000,'2015-01-01', '2021-05-25'),
(8,26000,'2012-01-01', '2023-05-25'),
(9,36000,'2021-01-01', '2021-05-25'),
(10,15000,'2008-05-05', '2021-12-25'),
(11,39000,'2000-01-01', '2021-05-25'),
(12,29000,'2000-01-01', '2021-05-25'),
(13,49000,'2000-01-01', '2021-05-25'),
(14,9000,'2000-01-01', '2021-05-25'),
(15,19000,'2000-01-01', '2021-05-25');

-- 10 employees belong to more than one department
INSERT INTO dept_emp VALUES (1,'RRHH', '1998-12-21','2000-12-21'),
    -> (2,'FB', '2000-12-21',now()),
    -> (3,'CL', '2015-12-21',now()),
    -> (4,'KRK', '2018-01-01',now()),
    -> (5,'NT', '2019-11-01',now()),
    -> (6,'RRHH', '2010-10-05',now());

-- 5 employees are managers
INSERT INTO dept_manager VALUES
(1, "DST", "2010-08-15", now()),
(2, "BY", "2008-10-15", now()),
(3, "SLS", "2007-08-23", now()),
(4, "MNG", "2006-05-18", now()),
(5, "CNS", "2009-03-30", now());

-- All employees have a degree and at least 5 titles are from 2020
INSERT INTO titles VALUES (1,'sing', '1998-12-21','2000-12-21'),
(2,'sing', '2000-12-21',now()),
(3,'pon', '2020-12-21',now()),
(4,'pon', '2018-01-01',now()),
(5,'pon', '2019-11-01',now()),
(6,'pp', '2020-12-21','2000-12-21'),
(7,'pp', '2000-12-21',now()),
(8,'rita', '2020-12-21',now()),
(9,'rita', '2020-01-01',now()),
(10,'cop', '2019-11-01',now()),
(11,'pp', '2020-12-21','2000-12-21'),
(12,'pp', '2000-12-21',now()),
(13,'rita', '2010-12-21',now()),
(14,'rita', '2010-01-01',now()),
(15,'cop', '2019-11-01',now());

-- At least 3 employees have the same name
INSERT INTO employees VALUES (2,'1993-12-29','Roberto', 'Marin', 'M', '2018-05-05'),
(3,'1995-11-23','Pepa', 'Opa', 'F', '2003-05-05'),
(4,'1950-01-15','', 'Marin', 'M', '1970-01-01'),
(5,'1995-05-25','Miguel', 'Garcia', 'M', '2000-01-01'),
(6,'1989-12-23','Raul', 'Catedra', 'M', '2004-05-01'),
(7,'1990-10-29','Irati', 'Arrieta', 'F', '2005-10-29'),
(8,'1990-10-29','Irati', 'Arrieta', 'F', '2005-10-29'),
(9,'1994-01-25','Veronica', 'Velazquez', 'F', '2005-10-29'),
(10,'1993-12-29','Jose', 'Serralvo', 'M', '1995-12-29'),
(11,'1994-03-18','Pepa', 'Velazquez', 'F', '2005-10-29'),
(12,'1992-01-20','Pepa', 'Martin', 'F', '2005-10-29'),
(13,'1998-07-09','Pepa', 'Gomez', 'F', '2009-01-01'),
(14,'1992-03-20','Juana', 'Floricienta', 'F', '2012-04-04'),
(15,'1981-11-13','Manuel', 'Portu', 'M', '2006-07-05');

-- Update employees:
-- Change the name of an employee. To do this, generate a query that affects only a certain employee based on their name, surname and date of birth.
UPDATE employees SET first_name='erika' WHERE first_name='Juana' AND last_name='Floricienta' AND birth_date='1992-03-20';

-- Update departments:
-- Change the name of all departments.
UPDATE departments SET dept_name='CLEANING DEPT'WHERE dept_no='CL';
UPDATE departments SET dept_name='FABRICATION DEPT'WHERE dept_no='FB';
UPDATE departments SET dept_name='HUMAN RESOURCES DEPT'WHERE dept_no='RRHH';
UPDATE departments SET dept_name='NOTHINGS DEPT'WHERE dept_no='NT';
UPDATE departments SET dept_name='KARAOKE DEPT'WHERE dept_no='KRK';

-- Select all employees with a salary greater than 20,000
SELECT employees.first_name, salaries.salary FROM salaries INNER JOIN employees ON employees.emp_no = salaries.emp_no  WHERE salaries.salary > 20000;

-- Select all employees with a salary below 10,000
SELECT employees.first_name, salaries.salary, employees.emp_no FROM salaries INNER JOIN employees ON employees.emp_no = salaries.emp_no  WHERE salaries.salary > 10000;

-- Select all employees who have a salary between 14.00 and 50,000
SELECT CONCAT(employees.first_name, ' ',  employees.last_name) AS 'Name', salaries.* FROM salaries INNER JOIN employees ON employees.emp_no=salaries.emp_no WHERE salaries.salary BETWEEN  14000 AND 50000;

-- Select the total number of employees
SELECT COUNT(*) FROM employees;

-- Select the total number of employees who have worked in more than one department
SELECT COUNT(*) FROM (SELECT COUNT(emp_no) FROM dept_emp GROUP BY emp_no HAVING COUNT(*)>1) dept_emp;

-- Select the titles of the year 2019
SELECT title FROM titles WHERE YEAR(to_date) = 2019;

-- Select only the name of the employees in capital letters
SELECT UPPER(first_name) FROM employees;

-- Select the name, surname and name of the current department of each employee
SELECT employees.first_name, employees.last_name,  departments.dept_name  FROM employees LEFT JOIN current_dept_emp ON employees.emp_no = current_dept_emp.emp_no  LEFT JOIN departments ON current_dept_emp.dept_no = departments.dept_no;

-- Select the name, surname and number of times the employee has worked as a manager
SELECT employees.first_name, employees.last_name, COUNT(dept_manager.emp_no) FROM employees LEFT JOIN dept_manager ON  employees.emp_no = dept_manager.emp_no GROUP BY employees.emp_no;

-- Select the name of employees without any being repeated
SELECT employees.first_name FROM employees GROUP BY employees.first_name HAVING COUNT(employees.first_name)<2;

-- Eliminate all employees with a salary greater than 20,000
DELETE employees.* FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no WHERE salaries.salary > 20000;

-- Remove the department that has more employees
DELETE departments.* FROM departments INNER JOIN (SELECT MAX(counter), dept_no FROM (SELECT COUNT(*) counter, dept_no FROM current_dept_emp GROUP BY dept_no) current_dep_emp) max_dept ON departments.dept_no = max_dept.dept_no;