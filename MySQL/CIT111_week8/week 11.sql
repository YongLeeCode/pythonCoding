USE employees;

SELECT emp_no, from_date, to_date, salary
FROM salaries
WHERE salary >
 -- this is subquery
	(SELECT AVG(salary)
	FROM salaries
	WHERE to_date >= '2002-01-01')
    AND from_date BETWEEN '1992-01-01' AND '1992-12-31'
ORDER BY from_date, salary;



SELECT * FROM employees.employees;

CREATE VIEW department_through_salaries AS
SELECT *
FROM departments AS d
	INNER JOIN dept_emp AS de ON d.dept_no = de.dept_no
    INNER JOIN employees AS e ON e.emp_no = de.emp_no
    INNER JOIN salaries AS s ON e.emp_no = s.emp_no;


-- create view (view라는 테이블을 만듬)
CREATE VIEW understricted_employee_data AS
SELECT emp_no, first_name, last_name, gender
FROM employees
ORDER BY last_name, first_name;

SELECT *
FROM understricted_employee_data
WHERE Last_name >= 'M';