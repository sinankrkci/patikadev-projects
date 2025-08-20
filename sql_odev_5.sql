-- 18) Title 'n' ile biten en uzun 5 film
SELECT title, length
FROM film
WHERE title ILIKE '%n'
ORDER BY length DESC, title ASC
LIMIT 5;

-- 19) Title 'n' ile biten en kısa filmlerden 6–10. sıradakiler
SELECT title, length
FROM film
WHERE title ILIKE '%n'
ORDER BY length ASC, title ASC
LIMIT 5 OFFSET 5;

-- 20) customer tablosunda store_id = 1 olanlar için last_name azalan sıralamada ilk 4 kayıt
SELECT customer_id, first_name, last_name, store_id
FROM customer
WHERE store_id = 1
ORDER BY last_name DESC, first_name DESC
LIMIT 4;
