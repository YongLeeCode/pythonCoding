USE bike;

-- ROUND IS FOR DECIMAL / CONCAT IS FOR INSERTING WORDS
SELECT product_name, list_price, CONCAT('$', ROUND(list_price * 0.9, 2)) AS sales_price
FROM product;

-- SHOWING WORDS THAT I JUST WANT TO APPEAR
SELECT product_name, LEFT(product_name, 5) AS left5, right(product_name, 10) AS right10, MID(product_name, 7, 5)
FROM product;

-- DELETE POINT BETWEEN NUMBERS
SELECT product_name, FORMAT(list_price* 0.90, 2, 'PT_BR') 
FROM product
ORDER BY list_price DESC;

-- FIND AN APHABET
SELECT product_name, LOCATE(' ', product_name) + 1, 
		LOCATE(' ', product_name, LOCATE(' ', product_name) + 1) AS short_name
FROM product
ORDER BY product_name;

-- HOW MANY DAYS DIFFERENT BETWEEN TWO COLUMN
SELECT order_date, shipped_date, DATEDIFF(shipped_date, order_date) AS days
FROM cust_order
ORDER BY cust_order_id;

-- add date 이 셋 중 하나를 interval 뒤에 넣을 수 있다(day, month, year)
SELECT order_date, shipped_date, DATE_ADD(order_date, INTERVAL 5 year) AS shipping_limit
FROM cust_order
order by cust_order_id;

-- SHOWING EXACT CURRENT TIME
SELECT NOW();