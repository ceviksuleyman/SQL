CREATE TABLE sirketler(
	sirket_id int,                                -- sirket_id'ler ortak oldugu icin bu field'lardan baglanti kuruldu
	sirket_isim VARCHAR(20)                           --sirketler                           siparisler
);                                                     --100 null                              101++
INSERT INTO sirketler VALUES(100, 'Toyota');           --101++                                 102++
INSERT INTO sirketler VALUES(101, 'Honda');            --102++                                 103++
INSERT INTO sirketler VALUES(102, 'Ford');             --103++                                 104 -null
INSERT INTO sirketler VALUES(103, 'Hyundai');          --                                      105 -null                                  

CREATE TABLE siparisler(
	siparis_id int,
	sirket_id int,
	siparis_tarihi DATE
);
INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

SELECT * FROM sirketler;
SELECT * FROM siparisler;


--TASK-1 : Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id ,sirket_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT A.sirket_id,A.sirket_isim,B.siparis_id,B.siparis_tarihi 
FROM siparisler AS B
INNER JOIN sirketler AS A
ON B.sirket_id=A.sirket_id;


--TASK-2 : sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT B.sirket_id,B.sirket_isim,A.siparis_tarihi,A.siparis_id 
FROM sirketler AS B
LEFT JOIN siparisler AS A
ON A.sirket_id = B.sirket_id;

-- iki sorgu da ayni cevabi getirir.

SELECT A.sirket_id,A.sirket_isim,B.siparis_tarihi,B.siparis_id
FROM siparisler B 
RIGHT JOIN sirketler A
on A.sirket_id = B.sirket_id;


