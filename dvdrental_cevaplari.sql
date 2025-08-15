-- 1) film tablosunda title ve description sütunlarını sırala
SELECT title, description
FROM film
ORDER BY title, description;

-- 2) length 60'tan büyük ve 75'ten küçük olan kayıtlar
SELECT *
FROM film
WHERE length > 60
  AND length < 75
ORDER BY length, title;

-- 3) rental_rate 0.99 ve replacement_cost 12.99 veya 28.99 olan kayıtlar
SELECT *
FROM film
WHERE rental_rate = 0.99
  AND replacement_cost IN (12.99, 28.99)
ORDER BY replacement_cost, title;

-- 4) first_name 'Mary' olan müşterilerin last_name değeri
SELECT last_name
FROM customer
WHERE first_name = 'Mary'
ORDER BY last_name;

-- 5) length 50'den büyük olmayan ve rental_rate 2.99 veya 4.99 olmayan kayıtlar
SELECT *
FROM film
WHERE length <= 50
  AND rental_rate NOT IN (2.99, 4.99)
ORDER BY length, rental_rate, title;
