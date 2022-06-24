USE bike;

-- 1
SELECT ROUND(AVG(quantity)) AS "Stock Average"
FROM stock;


-- distinct 알아보기
-- 2
SELECT DISTINCT product_name
FROM product AS p 
	INNER JOIN stock AS s ON p.product_id = s.product_id
where quantity = 0
ORDER BY product_name;

-- 3
SELECT category_name, COUNT(category_name) AS instock
FROM category AS c 
	INNER JOIN product AS p ON c.category_id = p.category_id
	INNER JOIN stock AS sk ON p.product_id = sk.product_id
    INNER JOIN store AS st ON st.store_id = sk.store_id
WHERE st.store_id = 2
GROUP BY category_name
ORDER BY instock;

USE employees;

-- 4
SELECT COUNT(emp_no)
FROM employees;

-- 5
SELECT dept_name, FORMAT(AVG(salary), 2, "en_US") AS average_salary
FROM salaries
	JOIN employees ON salaries.emp_no = employees.emp_no
    JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
    JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY dept_name
HAVING AVG(salary) < 60000;    
    

-- 6
SELECT dept_name, COUNT(gender)
FROM departments AS d
	INNER JOIN dept_emp AS de ON de.dept_no = d.dept_no
    INNER JOIN employees AS e ON e.emp_no = de.emp_no
WHERE gender = "F"
GROUP BY d.dept_no
ORDER BY d.dept_name;