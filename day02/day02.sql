-- personel isimli tablo
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
As --gibi
SELECT pers_id,sehir,adres FROM personel;

SELECT * FROM personel; -- personel tablosunu goster

----------------------------------------------------------------------------------------------------------------

/*
DML -> Data Manipulation Lang.(Veri Kullanma Dili)
Tabloya veri ekleme,tablodan veri guncelleme ve silme islemlerinde kullanilan komutlar
INSERT - UPDATE - DELETE
*/
--INSERT
create table student(
	id varchar(4),
	st_name varchar(30),
	age int
);

INSERT INTO student Values ('1001','Ali Can',25);
INSERT INTO student Values ('1002','Veli Can',35);
INSERT INTO student Values ('1003','Ayse Can',45);
INSERT INTO student Values ('1004','Derya Can',55);
--Tabloya parcali veri ekleme
INSERT INTO student (st_name,age) Values('Murtaza Can',65);



/*
DQL -> Data Query Lang.(Veri Sorgulama Dili)
SELECT
*/
Select * From student; --> TABLOYU GETIRIR
Select st_name From student; --> Tablodaki isimleri bize getirir

-- SELECT komutu WHERE kosulu
Select * From student Where age>35;--> yas 35 uzeri olanlari getirir

-----------------------------------------------------------------------------------------------------------------

/*
TCL -> Transaction Control Lang.(Islem Kontrol Dili)
  Begin - Savepoint - Rollback - Commit
Transaction veritabani sistemlerinde bir islem basladiginda baslar ve islem bitince sona erer.
Bu islemler veri tabani olusturma,veri silme, veri guncelleme, veriyi geri getirme gibi islemler olabilir.
*/
CREATE TABLE ogrenciler2(
	id serial,
	isim VARCHAR(50),
	veli_isim VARCHAR(50),
	yazili_notu real
);
--id serial dedigimiz icin ilk default ile basladik

Begin; -- Transaction'a baslat

insert into ogrenciler2 values (default,'Ali Can','Ahmet Can',75.5);
insert into ogrenciler2 values (default,'Veli Gul','Hasan Gul',90.5);

savepoint x; -- begin olmazsa savepoint calismazdi

insert into ogrenciler2 values (default,'Kemal Can','Murtaza Can',75.5);
insert into ogrenciler2 values (default,'Mahmut Gul','Hilal Gul',90.5);

Rollback to x; -- geri aldik savepoint oncesine dondu
Commit;-- transaction'dan cikmak icin mutlaka calismalidir

select * from ogrenciler2;
/*
Transaction kullaniminda Serial data turu kullanimi tavsiye edilmez.
Savepoint'ten sonra ekledigimiz veride sayac mantigi ile calistigi icin sayacta en son hangi sayida kaldiysa ordan devam eder.


NOTE=> PostgreSQL de transaction kullanimi icin 'Begin' komutuyla baslariz,sonrasinda tekrar yanlis bir veriyi duzeltmek
veya bizim icin onemli olan verilerden sonra ekleme yapabilmek icin 'Savepoint savepointismi' komutunu kullaniriz ve bu
savepoint'te donebilmek icin 'Rollback To savepointismi' komutunu kullaniriz ve Rollback calistirildiginda savepoint 
yazdigimiz satirin ustundeki verileri tabloda bize verir ve son olarak transaction'i sonlandirmak icin mutlaka 'Commit' komutu kullaniri.
MySQL'de transaction olmadan da kullanilir.
*/
--------------------------------------------------------------------------------------------------------------

--DML -DELETE 

-- DELETE FROM tablo_adi --> Tablonun tum icerigini siler

-- DELETE FROM tablo_adi WHERE sutun_adi = veri -- > Veriyi secerek silmek icin WHERE kosulu kullanilir.Tablodaki istedigimiz veriyi siler
CREATE TABLE ogrenciler(
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


-- TASK : id'si 124 olan ogrenciyi silin
Delete from ogrenciler where id = 124;

-- TASK : ismi Kemal Yasa olan satiri silin
Delete From ogrenciler where isim = 'Kemal Yasa';

-- TASK : ismi Nesibe Yilmaz veya Mustafa Bak olan kayitlari silelim
Delete From ogrenciler where isim = 'Nesibe Yilmaz' or isim = 'Mustafa Bak';

-- TASK : ismi Ali Can ve id'si 123 olan kaydi silin.
Delete From ogrenciler Where isim = 'Ali Can' or id = 123;

-- Tablodaki tum verileri silelim
Delete From ogrenciler;

-- DELETE - TRUNCATE -
-- TRUNCATE komutu Delete komutu gibi bir verilerin tamamini siler, ancak secmeli silme yapamaz.

select * from ogrenciler;

Truncate Table ogrenciler;

---------------------------------------------------------------------------------------------------------------------

/*
--DDL - Data Definition Lang.(Veri Tanimlama Dili)
CREATE - ALTER - DROP
*/

-- ALTER TABLE => Tabloda ADD,TYPE(MySQL de MODIFY olarak kullanilir),SET,RENAME veya DROP COLUMNS islemleri icin kullanilir.

CREATE TABLE personel(
	pers_id int,
	isim varchar(30),
	sehir varchar(30),
	maas int,
	sirket varchar(20),
	adres varchar(50)
);

select * from personel;

-- TASK : Personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyin.
Alter table personel add cinsiyet varchar(20), add yas int;


-- TASK : Personel tablosundan sirket field'ini silin
Alter table personel drop column sirket;

-- TASK : Personel tablosundaki sehir sutunun adini ulke olarak degistirelim
Alter table personel rename column sehir to ulke;

-- TASK : Personel tablosunun adini isciler olarak degistirin
Alter table personel rename to isciler;

select * from isciler;

--DDL -DROP Tabloyu tamamen siler.
Drop Table isciler;

-----------------------------------------------------------------------------------------------------------------------

/*
CONSTRANINT -- Kisitlamalar
Primary Key => Bir sutunun NULL icermemesini ve sutundaki verilerin BENZERSIZ olmasini saglar(NOT NULL - UNIQUE)

Foreign Key => Baska bir tablodaki Primary Key'i referans gostermek icin kullanilir. Boylelikle,tablolar arasinda iliski kurulmus olur.

Unique => Bir sutundaki tum degerlerin Benzersiz yani tek olmasini saglar.

NOT NULL => Bir sutunun Null icermemesini yani bos olmamasini saglar.Not Null kisitlamasi icin CONSTRANINT ismi tanimlanmaz,bu kisitlama
veri turunden hemen sonra yerlestirilir.

CHECK => Bir sutuna yerlestirilebilecek deger araligini sinirlamak icin kullanilir.
*/

CREATE TABLE calisanlar2(
	id CHAR(5), 
	isim VARCHAR(50),
	maas int NOT NULL,
	ise_baslama DATE,
	CONSTRAINT pk_id primary key(id),
	CONSTRAINT ism_unq UNIQUE(isim)
);



CREATE TABLE calisanlar(
	id CHAR(5) PRIMARY KEY, -- not null + unique
	isim VARCHAR(50) UNIQUE,
	maas int NOT NULL,
	ise_baslama DATE
);


INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- constraint Not NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- Can ikidefa kabul etmedi unique
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- Not Null
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- hiclik 2 defa kabul etmedi unique primary key
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- primary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- primary key null kabul etmez.

Select * from calisanlar;

--Foreign Key
Create Table adresler(
	adres_id char(5),
	sokak varchar(20),
	cadde varchar(30),
	sehir varchar(20),
	CONSTRAINT id_pk foreign key (adres_id) references calisanlar(id) -- adres_id  calisanlar id ye baglandi
);--CONSTRAINT id_pk bu olmadan da olur kendisi bi isim atar

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;


INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
--Parent tabloda olmayan id ile child tabloya ekleme yapamayiz.

INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');-- foreign key'e null deger ekledim.

--calisanlar id ile adresler tablosundaki adres_id ile eslesenlere bakmaak icin
select * from calisanlar, adresler Where calisanlar.id = adresler.adres_id;

 
--Parent tabloyu yani Primary key olan tabloyu silmek istedigimizde tabloyu silmez once child tabloyu silmek gerekir.
Drop Table calisanlar;


