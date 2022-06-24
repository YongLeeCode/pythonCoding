USE v_art;
-- 1
SELECT artfile
FROM artwork
WHERE period = "Impressionism";

-- 2
SELECT artfile
FROM artwork AS a 
	INNER JOIN artwork_keyword AS ak ON a.artwork_id = ak.artwork_id
    INNER JOIN keyword AS k ON k.keyword_id = ak.keyword_id
Where keyword = "flowers";

-- 3
SELECT fname, lname, title
FROM artwork AS ast RIGHT OUTER JOIN artist AS aw ON ast.artist_id = aw.artist_id;

USE magazine;
-- 4
SELECT magazineName, subscriberLastName, subscriberFirstName
FROM subscription AS p 
	INNER JOIN magazine AS m ON p.magazineKey = m.magazineKey
    INNER JOIN subscriber AS r ON p.subscriberKey = r.subscriberKey
ORDER BY magazineName;

-- 5
SELECT magazineName
FROM subscription AS p 
	INNER JOIN magazine AS m ON p.magazineKey = m.magazineKey
    INNER JOIN subscriber AS r ON p.subscriberKey = r.subscriberKey
WHERE subscriberLastName = "Sanders" AND subscriberFirstName = "Samantha";

USE employees;
-- 6
SELECT first_name, last_name
FROM employees AS e 
	INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
    INNER JOIN departments AS d ON d.dept_no = de.dept_no
WHERE dept_name = 'Customer Service'
ORDER BY last_name
LIMIT 5;

-- 7
SELECT first_name, last_name, dept_name, salary, s.from_date
FROM employees AS e
	INNER JOIN salaries AS s ON e.emp_no = s.emp_no
    INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
    INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE last_name = "Genin" AND first_name = "Berni"
ORDER BY salary DESC
LIMIT 1;
    