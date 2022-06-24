USE bike;

-- SELECT LEFT(product_name, 13)
SELECT product_name, LOCATE(" - 2", product_name) - 1,
	LEFT(product_name, LOCATE(" - 2", product_name) - 1)
FROM product;

SELECT first_name, last_name, state, cust_order_id, order_date
FROM customer AS c INNER JOIN cust_order AS r ON c.customer_id = r.customer_id
ORDER BY last_name, first_name, order_date;


USE art_gallery;

-- JOIN은 테이블 두개를 콤바인하는것
-- INNER
SELECT fname, lname, dob, title, artyear
FROM artist AS t INNER JOIN artwork AS k ON t.artist_id = k.artist_id;

-- left join = ALL OF THE OUTER IS PAINTING(따로 알아보기)
SELECT fname, lname, dob, title, artyear
FROM artist AS t LEFT OUTER JOIN artwork AS k ON t.artist_id = k.artist_id;

-- RIGHT
SELECT fname, lname, dob, title, artyear
FROM artist AS t RIGHT OUTER JOIN artwork AS k ON t.artist_id = k.artist_id;

SELECT fname, lname, dob, title, artyear, keyword
FROM artist AS t 
	INNER JOIN artwork AS k ON t.artist_id = k.artist_id
    INNER JOIN artwork_has_keyword AS ak ON k.artwork_id = ak.artwork_id
    INNER JOIN keyword AS w ON ak.keyword_id = w.keyword_id
WHERE keyword = 'Christ' OR keyword = 'blue' -- another way : WHERE keyword = IN ('christ', 'blue')
ORDER BY lname, title, keyword;

-- JOIN이라는 단어가 있는 곳 기준으로 왼쪽에 있는 테이블이 LEFT고 오론쪽에 있는 것이 RIGHT이다.
SELECT fname, lname, title
FROM artist LEFT OUTER JOIN artwork ON  artist.artist_id = artwork.artist_id
ORDER BY lname, title;


-- m.magazineKey = s.magazineKey를 선언했기 때문에 mysql에서는 정확하게 어디 테이블이 필요한지 모르기 때문에  select파트에 m.magazineKey라고 쓴다.
USE magazine;
SELECT magazineName, m.magazineKey, subscriptionKey
FROM magazine as m INNER JOIN subscription as s ON m.magazineKey = s.magazineKey
ORDER BY magazineName, subscriptionKey;

SELECT magazineName, m.magazineKey, subscriptionKey, subscriberLastName, subscriberFirstName
FROM magazine as m 
	LEFT OUTER JOIN subscription as s ON m.magazineKey = s.magazineKey
	RIGHT OUTER JOIN subscriber as r ON r.subscriberKey = s.subscriberKey
ORDER BY magazineName, subscriptionKey;
