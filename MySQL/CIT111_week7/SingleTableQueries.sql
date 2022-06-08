USE art_gallery;

-- 1.
INSERT INTO artist
(artist_id, fname, mname, lname, dob, dod, country, local_artist)
VALUES
(NULL, "Johannes", "", "Vermeer", 1632, 1674, "Netherlands", 'n');

-- 2.
SELECT artist_id, fname, mname, lname, dob, dod, country, local_artist
FROM artist
ORDER BY lname;

-- 3
UPDATE artist SET dod = 1675
WHERE artist_id = 9;

-- 4
DELETE FROM artist
WHERE artist_id = 9;


USE bike;

-- 5
SELECT first_name, last_name, phone
FROM customer
WHERE city = "Houston";

-- 6
SELECT product_name, list_price, list_price - 500 AS "Discount Price"
FROM product
WHERE list_price >= 5000
ORDER BY list_price DESC;

-- 7
SELECT first_name, last_name, email
FROM staff
WHERE NOT store_id = 1;

-- 8
SELECT product_name, model_year, list_price
FROM product
WHERE product_name LIKE "%spider%";

-- 9
SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 500 AND 550
ORDER BY list_price;

-- 10
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE (phone IS NOT NULL AND city REGEXP '[ao]ch') OR last_name = "William"
LIMIT 5;