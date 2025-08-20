-- dvdrental OUTER JOIN örnekleri

-- 1) city ve country: LEFT JOIN ile tüm şehirleri ve varsa ülkelerini listele
SELECT c.city AS city_name, co.country AS country_name
FROM city AS c
LEFT JOIN country AS co ON c.country_id = co.country_id
ORDER BY co.country, c.city;

-- 2) customer ve payment: RIGHT JOIN ile tüm ödemeleri ve varsa müşteri ad/soyadlarını listele
SELECT p.payment_id, cu.first_name, cu.last_name
FROM payment AS p
RIGHT JOIN customer AS cu ON p.customer_id = cu.customer_id
ORDER BY p.payment_id;

-- 3) customer ve rental: FULL JOIN ile tüm kiralamalar ve tüm müşteriler (eşleşsin/ eşleşmesin) birlikte
SELECT r.rental_id, cu.first_name, cu.last_name
FROM rental AS r
FULL JOIN customer AS cu ON r.customer_id = cu.customer_id
ORDER BY r.rental_id;
