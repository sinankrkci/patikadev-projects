-- dvdrental: actor ve customer tablolarında first_name için kümeler ve çoklu-kümeler (multiset) işlemleri

-- 1a) Tüm first_name verileri birlikte (tekrarları KORU) + kaynağı göster
SELECT first_name, 'actor'    AS source FROM actor
UNION ALL
SELECT first_name, 'customer' AS source FROM customer
ORDER BY first_name, source;

-- 1b) Tüm first_name verileri birlikte (TEKRARSIZ birleşim)
SELECT first_name
FROM actor
UNION
SELECT first_name
FROM customer
ORDER BY first_name;

-- 2a) Kesişim (TEKRARSIZ): her iki tabloda da bulunan first_name'ler
SELECT first_name
FROM actor
INTERSECT
SELECT first_name
FROM customer
ORDER BY first_name;

-- 2b) Kesişim (TEKRARLI): her iki tabloda ortak olanları, tekrar sayılarıyla
SELECT first_name
FROM actor
INTERSECT ALL
SELECT first_name
FROM customer
ORDER BY first_name;

-- 3a) Fark (TEKRARSIZ): actor'de olup customer'da olmayan first_name'ler
SELECT first_name
FROM actor
EXCEPT
SELECT first_name
FROM customer
ORDER BY first_name;

-- 3b) Fark (TEKRARLI): actor'de olup customer'da bulunmayanlar (tekrar sayılarıyla)
SELECT first_name
FROM actor
EXCEPT ALL
SELECT first_name
FROM customer
ORDER BY first_name;
