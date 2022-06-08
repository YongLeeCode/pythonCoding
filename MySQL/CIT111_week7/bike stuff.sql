USE bike;

SELECT first_name, last_name, email, state, zip_code
FROM customer
WHERE state IN('NY','TX')
ORDER BY  zip_code DESC, last_name;

SELECT store_name, phone, street, city, state, zip_code
FROM store
WHERE street LIKE "a%"
ORDER BY store_name;
/* !fjdf*/

SELECT product_name, model_year, list_price, list_price * 0.8 AS sale_price
FROM product
WHERE list_price < 5000
ORDER by list_price
LIMIT 5, 50;