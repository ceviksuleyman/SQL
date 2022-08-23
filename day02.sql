--Personel isminde bir tablo oluşturalım
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--Varolan personel tablosundan pers_id,sehir,adres field'larina sahip personel_adres adında yeni tablo olusturalım
create table personel_adres
as
select pers_id, sehir, adres from personel;
select * from personel




--DML -> Data Manupulatiyon Lang.
-- INSERT -UPDATE - DELETE
-- Tabloya veri ekleme tablodan veri guncelleme ve silme islemlerinde kullanilan komutlar
-- INSERT
create table student
(
id varchar(4),
st_name varchar(30),
age int
);
INSERT into student VALUES('1001','Ali Can',25);
INSERT into student VALUES('1002','Veli Can',35);
INSERT into student VALUES('1003','Ayse Can',45);
INSERT into student VALUES('1004','Derya Can',55);
--tabloya parcali veri ekleme
insert into student(st_name,age) values ('Murat Can',65);


--DQL -Data Query Lang.
--SELECT
SELECT * from student; -- tabloyu getirir
select st_name from student; -- sadece isimleri getirir
-- SELECT komutu WHERE kosulu
SELECT * from student WHERE age>35; -- yası 35 uzeri olanlari getir




-- TCL - Transaction Control Lang.
--Begin- SAVEPOINT - ROLLBACK - COMMIT
-- Transaction veritabani sistemlerinde bir islem basladiginda baslar ve islem bitince sona erer.
-- Bu islemler veritabani olusturma, veri silme, veri guncelleme, veriyi getirme gibi islemler olabilir.
CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real
);
Begin;
INSERT into ogrenciler2 VALUES (default,'Ali Can','Hasan Can',75.5);
INSERT into ogrenciler2 VALUES (default,'Canan Gul','Ayse Gul',90.5);
SAVEPOINT x;
INSERT into ogrenciler2 VALUES (default,'Kemal Can','Ahmet Can',90.5);
INSERT into ogrenciler2 VALUES (default,'Ahmet Sen','Ayse Sen',90.5);
ROLLBACK TO x;
SELECT * from ogrenciler2;
COMMIT;
--Transaction kullaniminda SERIAL data turu kullanimi tavsiye edilmez savepoint'ten son ekledigimiz veride
--sayac mantigi ile calistigi icin sayacta en son hangi sayida kaldiysa ordan devam eder
--NOTE => PostgreSQL de transaction kullanimi icin BEGIN komutuyla baslariz,sonrasinda tekrar yanlis bir veriyi
--duzeltmek veya bizim icim onemli olan verilerden sonra ekleme yapabilmek icin 'SAVEPOINT  savepointAdi' komutunu
--kullaniriz ve bu savepointte donebilmek icin 'ROLLBACK TO savepointAdi' komutunu kullaniriz ve rollback calistirildiginda
--savepoint yazdigimiz satirin ustundeki verileri tabloda bize verir.
--Son olarak transaction'u sonlandirmak icin mutlaka 'COMMIT' komutu kullaniriz.
--MySQL de transaction olmadan da kulllanilir.




-- DML - DELETE
--DELETE FROM tablo_adi --> tablonun tum icerigini siler.
--Veriyi secerek silmek icin WHERE kosulu kullanilir --> DELETE FROM tablo_adi WHERE sutun_adi = veri
CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * from ogrenciler;

--Soru ; id'si 124 olan ogrenciyi silin
DELETE from ogrenciler WHERE id=124;
--Soru ; ismi Kemal Yasa olan satiri silin
DELETE from ogrenciler WHERE isim= 'Kemal Yasa';
--Soru ; ismi Nesibe Yilmaz veya Mustafa Bak olan kayitlari silelim.
DELETE FROM ogrenciler Where isim= 'Nesibe Yilmaz' or isim = 'Mustafa Bak';
--Soru ; ismi Ali Can ve id'si 123 olan kaydi silin
delete from ogrenciler where isim = 'Ali Can' or id=123;
-- Tablodaki tum verileri silelim
delete from ogrenciler

--DELETE - TRUNCATE -
-- TRUNCATE komutu Delete komutu gibi bir verilerin tamamini siler, ancak secmeli silme yapmaz.

select * from ogrenciler;
truncate table ogrenciler;

--DDL - Data Definition Lang.
--CREATE - ALTER - DROP
-- ALTER TABLE --
-- ALTER TABLE tabloda ADD, TYPE, SET ,RENAME veya DROP COLUMNS islemleri icin kullanilir.

select * from isciler;
--Soru: personel tablosuna cinsiyet varchar(20) ve yas int seklinde yeni sutunlar ekleyin.

alter table personel add cinsiyet varchar(20),add yas int;

--Soru: personel tablosundan sirket field'ini  silin
alter table personel drop column sirket;

-- personel tablosundaki sehir sutunun adini ulke olarak degistirelim
alter table personel rename column sehir to ulke;

--personel tablosunun adini isciler olarak degistirelim
alter table personel rename to isciler;

--DDL - DROP komutu
drop table isciler;


--CONSTRANINT - Kisitlamalar
--Primary Key --> Bir sutunun null icermemesini ve sutundaki verilerin benzersiz(unique) olmasini saglar.(NOT NULL -UNIGUE)
--Foreign Key --> Baska bir tablodaki Primary Key'i referans gostermek icin kullanilir boylelikle tablolar arasinda iliski kurmus oluruz.

--UNIQUE --> Bir sutundaki tum degerlerin tum degerlerin benzersiz yani tek olmasini saglar.

--NOT NULL --> Bir sutunun NULL icermemesini yani bos olmamasini saglar,Not Null kisitlamasi icin COONSTRAINT ismi TANIMLANMAZ.
--Bu kisitlama veri turunden hemen sonra yerlestirilir.

--CHECK --> Bir sutuna yerlestirilebilecek deger araligini sinirlamak icin kullanilir.
CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);

create table calisanlar2(
id CHAR(5), 
isim VARCHAR(50),
maas int NOT NULL,
ise_baslama DATE,
	CONSTRAINT pk_id primary key(id),
	CONSTRAINT ism_unq UNIQUE(isim)
);



