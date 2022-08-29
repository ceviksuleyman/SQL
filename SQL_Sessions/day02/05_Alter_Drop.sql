/*
  DDL - Data Definition Lang.(Veri Tanimlama Dili)
  
  CREATE - ALTER - DROP
  
  Tabloda yapilacak degisiklikler icin : Tablo olusturma, sutun ekleme ve silme,ismini degistirme,data turunu degistirme,tabloyu silme... 
  
  ALTER TABLE => Tabloda ADD,TYPE(MySQL de MODIFY olarak kullanilir),SET,RENAME veya DROP COLUMNS islemleri icin kullanilir.
*/
CREATE TABLE personel(
	pers_id int,
	isim varchar(30),
	sehir varchar(30),
	maas int,
	sirket varchar(20),
	adres varchar(50)
);

Select * From personel;

-- TASK-1 : Personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyin.

Alter Table personel Add cinsiyet varchar(20), add yas int;


-- TASK-2 : Personel tablosundan sirket field'ini silin

Alter Table personel Drop Column sirket;


-- TASK-3 : Personel tablosundaki sehir sutunun adini ulke olarak degistirelim

Alter Table personel Rename Column sehir to ulke;


-- TASK-4 : Personel tablosunun adini isciler olarak degistirin

Alter Table personel Rename To isciler;

Select * From isciler;


-- DDL - DROP Tabloyu tamamen siler.

Drop Table isciler;
