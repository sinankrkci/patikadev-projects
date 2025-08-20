-- 13) film.replacement_cost sütunundaki birbirinden farklı değerleri listele
SELECT DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost;

-- 14) film.replacement_cost sütunundaki birbirinden farklı kaç değer var?
SELECT COUNT(DISTINCT replacement_cost) AS distinct_replacement_cost_count
FROM film;

-- 15) title 'T' ile başlayıp rating 'G' olan kaç film var?
SELECT COUNT(*) AS count_title_starts_T_and_rating_G
FROM film
WHERE title LIKE 'T%'  -- Büyük/küçük harf duyarlı. Harf duyarsız istenirse ILIKE kullanın.
  AND rating = 'G';

-- 16) country adlarından uzunluğu tam 5 karakter olan kaç tane?
SELECT COUNT(*) AS country_name_len_5_count
FROM country
WHERE LENGTH(country) = 5;

-- 17) city adlarından 'R' veya 'r' ile biten kaç tane? (harf duyarsız)
SELECT COUNT(*) AS city_ends_with_r_count
FROM city
WHERE city ILIKE '%r';
