CREATE TABLE customers_products
( 
  product_id int,
  customer_name varchar(50),
  product_name varchar(50)
);
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');

CREATE TABLE customers_likes
( 
  product_id int,
  customer_name varchar(50),
  liked_product varchar(50)
);
INSERT INTO customers_likes VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES (60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES (30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');

--* EXISTS komutu SUBQUERY'ler ile beraber kullanilir.
--* IN komutu OR komutunun kisa yazilmis halidir. 
--* IN komutunu tek basina SUBQUERY'lerle beraber kullanmayiz.
--* SUBQUERY kullanacaksaniz EXISTS kullanmaniz gerekir.

--* Product_id'leri ayni olan musterilerin isimlerini gosteriniz.
    SELECT customer_name
    FROM customers_products
    WHERE EXISTS (SELECT product_id
                                FROM customers_likes
                                WHERE customers_products.product_id=customers_likes.product_id);

--* Product_name ile liked_product'i ayni olan musterilerin isimlerini gosteren kod
SELECT customer_name
FROM customers_products
WHERE EXISTS (SELECT customer_name
               FROM customers_likes
               WHERE customers_likes.liked_product=customers_products.product_name);


--Kac farkli meyve var?
SELECT COUNT(DISTINCT product_name) AS meyve_cesit_sayisi
FROM customers_products;

--Her iki tablodaki ortak id ve isimleri gosteren kodu yaziniz.
SELECT product_id ,
  customer_name
FROM customers_products

INTERSECT

SELECT  product_id ,
  customer_name
FROM customers_products;




