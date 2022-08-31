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


--TASK-1 : Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.


