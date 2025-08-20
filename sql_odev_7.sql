-- 25) film tablosunda filmleri rating değerlerine göre gruplayın (adetlerini verin)
SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY rating;

-- 26) replacement_cost'a göre grupladığımızda, film sayısı 50'den fazla olan değerler ve sayıları
SELECT replacement_cost, COUNT(*) AS film_count
FROM film
GROUP BY replacement_cost
HAVING COUNT(*) > 50
ORDER BY film_count DESC, replacement_cost;

-- 27) store_id değerlerine karşılık gelen müşteri sayıları
SELECT store_id, COUNT(*) AS customer_count
FROM customer
GROUP BY store_id
ORDER BY store_id;

-- 28) city tablosunu country_id'ye göre gruplayıp en fazla şehir sayısına sahip country_id ve şehir sayısı
SELECT country_id, COUNT(*) AS city_count
FROM city
GROUP BY country_id
ORDER BY city_count DESC, country_id
LIMIT 1;
