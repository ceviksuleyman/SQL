/*
DDL - DATA DEFINITION LANG.
CREATE - ALTER - DROP
*/
-- CREATE -TABLO OLUSTURMA --

CREATE TABLE ogrenci(
ogr_no INT, 
ogr_isimsoyisim VARCHAR(30),
notlar REAL,	
yas INT,
adress VARCHAR(50),	
kayit_tarih DATE
);

--VAR OLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogr_notlari
AS
SELECT ogr_no, notlar FROM ogrenci;

SELECT * FROM ogrenci; 
SELECT * from ogr_notlari; --tablo gormek icin
-- deneme 1 kayit
