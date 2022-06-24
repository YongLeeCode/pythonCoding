USE bike;

-- AVG, MAX, MIN, COUNT, SUM FUNCTION 모두 하나의 row만 보여준다
SELECT product_name, AVG(list_price)
FROM product
ORDER BY AVG(list_price) DESC;

-- group by를 했을 때 하나의 row가 아닌 그룹으로 나눠진대로 row 수가 들어나고 평균을 나눈다.
-- ROLL UP은 NULL까지 보여주는 것이다.
SELECT product_name,  model_year, ROUND(AVG(list_price), 2), COUNT(list_price)
FROM product
GROUP BY model_year WITH ROLLUP
ORDER BY AVG(list_price) DESC;

-- having을 쓰면 그것의 위만을 사용함
SELECT model_year, ROUND(AVG(list_price), 2)
FROM product
WHERE list_price > 800
GROUP BY model_year
HAVING AVG(list_price) > 1600
ORDER BY AVG(list_price) DESC;

-- 
SELECT b.brand_id, ROUND(AVG(list_price), 2), MIN(list_price), MAX(list_price)
FROM product INNER JOIN brand AS b ON product.brand_id = b.brand_id
GROUP BY b.brand_id
ORDER BY b.brand_id;

--
SELECT store_name, quantity, discount, list_price, 
	CONCAT( "$", FORMAT(SUM(quantity * ROUND(list_price * (1 - discount), 2)), 2, "en.US")) AS "total amount spent"
FROM store AS s 
	INNER JOIN cust_order AS co ON s.store_id = co.store_id
    INNER JOIN cust_order_item AS coi ON co.cust_order_id = coi.cust_order_id
    INNER JOIN product AS p ON coi.product_id = p.product_id
GROUP BY store_name;

SELECT first_name, last_name, SUM(quantity * ROUND(list_price * (1- discount), 2)) AS amount_spent
FROM customer AS c 
	INNER JOIN cust_order AS co ON c.customer_id = co.customer_id
    INNER JOIN cust_order_item AS coi ON co.cust_order_id = coi.cust_order_id
    INNER JOIN product AS p ON coi.product_id = p.product_id
GROUP BY c.customer_id
ORDER BY last_name, first_name;

-- 
USE bike;

SELECT first_name, last_name, COUNT(co.customer_id), AVG(order_date), SUM(order_date), cust_order_id, MIN(shipped_date), MAX(shipped_date)
FROM cust_order AS co
	INNER JOIN customer AS c ON co.customer_id = c.customer_id
GROUP BY co.customer_id;

USE bike;
-- 
SELECT s.staff_id, first_name, last_name, COUNT(s.staff_id), i.quantity, discount, p.list_price, ROUND(quantity * (1 - discount) * list_price, 2) AS total
FROM staff AS s 
	INNER JOIN cust_order AS co ON s.staff_id = co.staff_id
    INNER JOIN cust_order_item AS i ON co.cust_order_id = i.cust_order_id
    INNER JOIN product AS p ON p.product_id = i.product_id
GROUP BY s.staff_id;