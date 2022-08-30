CREATE TABLE calisanlar(
	id int,
	isim VARCHAR(50),
	sehir VARCHAR(50),
	maas int,
	isyeri VARCHAR(20)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar(
	marka_id int,
	marka_isim VARCHAR(20),
	calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

SELECT * FROM calisanlar;

SELECT * FROM markalar;

-- TASK-1 : calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu
-- markada calisanlarin isimlerini ve maaşlarini listeleyin.

Select isim,maas,isyeri From calisanlar
Where isyeri -- 2 tablo arasindaki baglanti sutunu
in(Select marka_isim From markalar Where calisan_sayisi>15000);


-- TASK-2 : marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve
-- şehirlerini listeleyiniz.

Select isim,maas,sehir From calisanlar
Where isyeri 
in(Select marka_isim From markalar Where marka_id>101);


-- TASK-3 : Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
  
      
-- TASK-4 : Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyen bir Sorgu yaziniz.
 
-- TASK-5 : Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin ortalama maaşini listeleyen bir Sorgu yaziniz.
-- TASK-6 : Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
-- TASK-7 : Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

