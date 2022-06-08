USE magazine;

-- 1
SELECT magazineName, ROUND(magazinePrice * .97, 2) AS '3% off'
FROM magazine;

-- 2
SELECT subscriberKey, ROUND(DATEDIFF(NOW(), subscriptionStartDate) / 365) AS 'Years Since Subscription'
FROM subscription;

-- 3
SELECT subscriptionStartDate, subscriptionLength, 
		DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH), '%M %E, %Y')
FROM subscription;

USE bike;

-- 4
SELECT LEFT(product_name, LOCATE('-', product_name) - 2) AS 'Product Name without Year'
FROM product
ORDER BY product_id;

-- 5
SELECT product_name, ROUND(list_price / 3, 2) AS 'One of 3 payments'
FROM product
WHERE model_year = 2019;