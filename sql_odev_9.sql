-- dvdrental INNER JOIN örnekleri
-- 1) city ve country: şehir ve ülke adlarını birlikte listele
SELECT c.city AS city_name, co.country AS country_name
FROM city AS c
INNER JOIN country AS co ON c.country_id = co.country_id
ORDER BY co.country, c.city;

-- 2) customer ve payment: payment_id ile müşteri ad/soyadını birlikte listele
SELECT p.payment_id, cu.first_name, cu.last_name
FROM payment AS p
INNER JOIN customer AS cu ON p.customer_id = cu.customer_id
ORDER BY p.payment_id;

-- 3) customer ve rental: rental_id ile müşteri ad/soyadını birlikte listele
SELECT r.rental_id, cu.first_name, cu.last_name
FROM rental AS r
INNER JOIN customer AS cu ON r.customer_id = cu.customer_id
ORDER BY r.rental_id;
