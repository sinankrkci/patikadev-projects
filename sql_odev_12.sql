-- dvdrental: İstatistik ve sıralama sorguları
-- 1) Ortalama film uzunluğundan daha uzun kaç film var?
SELECT COUNT(*) AS films_longer_than_avg
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- 2) En yüksek rental_rate değerine sahip kaç film var?
SELECT COUNT(*) AS films_with_max_rental_rate
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

-- 3) En düşük rental_rate VE en düşük replacement_cost değerlerine sahip filmleri listeleyiniz
SELECT film_id, title, length, rental_rate, replacement_cost
FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film)
  AND replacement_cost = (SELECT MIN(replacement_cost) FROM film)
ORDER BY title;

-- 4) En fazla sayıda alışveriş (payment) yapan müşterileri sayısına göre sırala
SELECT cu.customer_id, cu.first_name, cu.last_name, COUNT(p.payment_id) AS payment_count
FROM customer AS cu
JOIN payment  AS p ON p.customer_id = cu.customer_id
GROUP BY cu.customer_id, cu.first_name, cu.last_name
ORDER BY payment_count DESC, cu.last_name, cu.first_name;
