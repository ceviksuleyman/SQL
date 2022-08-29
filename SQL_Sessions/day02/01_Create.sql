-- personel isimli tablo olusturun

-- CREATE

CREATE TABLE personel(
	pers_id int,
	isim varchar(30),
	sehir varchar(30),
	maas int,
	sirket varchar(20),
	adres varchar(50)
);

-- var olan personel tablosundan pers_id,sehir,adres field'larina sahip yeni bir tablo olusturalim.
CREATE TABLE personel_adres
As -- gibi
SELECT pers_id,sehir,adres FROM personel;

Select * From personel_adres;

SELECT * FROM personel; -- personel tablosunu goster
