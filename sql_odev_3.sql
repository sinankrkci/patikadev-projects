-- 9) country adları 'A' ile başlayıp 'a' ile bitenler
SELECT country
FROM country
WHERE country LIKE 'A%a'
ORDER BY country;

-- 10) country adları en az 6 karakter uzunluğunda olup 'n' ile bitenler
SELECT country
FROM country
WHERE LENGTH(country) >= 6
  AND country LIKE '%n'
ORDER BY country;

-- 11) film.title içinde en az 4 defa 'T' veya 't' içeren film adları
SELECT title
FROM film
WHERE (LENGTH(UPPER(title)) - LENGTH(REPLACE(UPPER(title), 'T', ''))) >= 4
ORDER BY title;

-- 12) film tablosunda title 'C' ile başlayan, length > 90 ve rental_rate = 2.99 olan kayıtlar
SELECT *
FROM film
WHERE title LIKE 'C%'
  AND length > 90
  AND rental_rate = 2.99
ORDER BY title;
