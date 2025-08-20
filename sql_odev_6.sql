-- 21) film.rental_rate sütunundaki değerlerin ortalaması
SELECT AVG(rental_rate) AS avg_rental_rate
FROM film;

-- 22) 'C' karakteri ile başlayan film sayısı
SELECT COUNT(*) AS count_title_starts_with_c
FROM film
WHERE title LIKE 'C%';

-- 23) rental_rate = 0.99 olan filmler içerisindeki en uzun (dakika) süre
SELECT MAX(length) AS max_length_when_rental_rate_099
FROM film
WHERE rental_rate = 0.99;

-- 24) length > 150 olan filmler için farklı replacement_cost sayısı
SELECT COUNT(DISTINCT replacement_cost) AS distinct_replacement_cost_when_length_gt_150
FROM film
WHERE length > 150;
