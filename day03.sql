CREATE TABLE calisanlar(
	id CHAR(5) PRIMARY KEY, -- not null + unique
	isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
	maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
	ise_baslama DATE
);


INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY


--FOREIGN KEY
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


Delete from calisanlar where id = '10002';--Parent table oldugu icin once child'daki foreign'i silemeyiz.
Delete from adresler where adres_id ='10002'; --Child

drop table calisanlar; -- Parent oldugu icin calisanlar tabloyu silemez.


-- ON DELETE CASCADE 
-- Her defasinda once child tablodaki veirleri silmek yerine ON DELETE CASCADE silme ozelligini aktif hale getirebiliriz.
-- Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmamiz yeterlidir.
CREATE TABLE talebeler(
	id CHAR(3) primary key,
	isim VARCHAR(50),
	veli_isim VARCHAR(50),
	yazili_notu int
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

select * from talebeler;

CREATE TABLE notlar(
	talebe_id char(3),
	ders_adi varchar(30),
	yazili_notu int,
	CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
	on delete cascade --Parent tablodan veri silinince direk burdan da silinecek.
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar;

select * from talebeler, notlar Where talebeler.id = notlar.talebe_id; -- Parent ve child tabloyu birlikte gosterir.


Delete from notlar Where talebe_id = '123'; -- child'den silince parentten silmez.
Delete from talebeler Where id = '126'; --Parent'ten silince child'den da direk sildi On Delete Cascade ile notlar tablosunu olusturdugumuz icin

Delete from talebeler; -- Parent'ten veriler silinince child'den de silinmis oldu

Drop table talebeler Cascade;-- Parent tabloyu kaldirmak istersek DROP TABLE tablo_adi'dan sonra CASCADE komutunu kullaniriz.



-- TASK : Talebeler tablosundaki isim sutununa  NOT NULL kisitlamasi ekleyiniz ve veri tipini varchar(30) olarak degistirin.
Alter Table talebeler 
Alter column isim Type varchar(30), --data turunu degistirdi
Alter column isim Set Not NULL; -- isim sutununa NOt Null kisiti ekledi


-- TASK : Talebeler tablosundaki yazili_notu sutununa 60 dan buyuk rakam girilebilsin

Alter Table talebeler
ADD CONSTRAINT sinir CHECK (yazili_notu > 60);
-- CHECK => kisitlamasi ile tablodaki istedigimiz sutunu sinirlandirabiliriz.

INSERT INTO talebeler VALUES(128, 'Suleyman Cevik', 'Can',45);-- 60 not siniri oldugu icin eklemedi.

------------------------------------------------------------------------------------


-- PRIMARY KEY ATAMA
create table ogrenciler(
	id int,
	isim varchar(45),
	adres varchar(100),
	sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;

select * from ogrenciler;
select * from ogrenci_adres;
--Tablodaki bir sutuna PRIMARY KEY ekleme *******************************
ALTER TABLE  ogrenciler
Add Primary Key(id);

-- Primary Olusturmada 2. YONTEM
Alter Table ogrenciler
Add Constraint pk_id Primary Key(id);

-- PK'DAN SONRA FOREIGN KEY ATAMASI 

Alter Table ogrenci_adres
Add Foreign Key(id) References ogrenciler;-- Child tabloyu parent tablodan olusturdugumuz icin kolon adi vermedik

-- Foreign Key'i silme
Alter Table ogrenci_adres Drop Constraint ogrenci_adres_id_fkey;
-- Primary Key'i Constraint silme
Alter Table ogrenciler Drop Constraint pk_id;

--------------------------------------------------------------------------

-- TASK : Yazili Notu 85 den buyuk olan talebe bilgilerini getirin
Select * from talebeler Where yazili_notu > 85;


-- TASK : ismi Mustafa Bak olan talebenin tum bilgilerini getirin
select * from talebeler Where isim = 'Mustafa Bak';




/*
SELECT komutunda  BETWEEN kosulu
 * Between belirttigimiz 2 veri arasidaki bilgileri listeler
 * Between de belirttigimiz degerlerde listelemeye dahildir.
*/
create table personel(
	id char(4),
	isim varchar(50),
	maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

/*
 AND (ve) : Belirtilen sartlarin her ikisi de gerceklesiyorsa o kayit listelenir.Bir tanesi gerceklesmezse listelemez.
 Select * From matematik sinav1 > 50 AND sinav2 > 50, hem sinav1 hem de sinav2 alani 50 den buyuk olan kayitlari listeler.
 
 OR (veya) : Belirtilen sartlardan biri gerceklesirse, kayit listelenir.
 Select * From matematik sinav1 > 50 OR sinav2 > 50, Hem sinav1 veya sinav2 alani, 50 den buyuk olan kayitlari listeler.
*/

select * from personel;

--TASK : id'si 1003 ile 1005 arasinda olan personel bilgisini listeleyin.
select * from personel Where id Between '1003' and '1005';
-- 2.Yontem
Select * From personel Where id >= '1003' and id <= '1005';


-- TASK : Derya Soylu ile Yavuz Bal arasindaki personel bilgisini listeleyiniz.
Select * From personel Where isim Between 'Derya Soylu' And 'Yavuz Bal';


-- TASK : Maasi 70000 ve ismi Sena olan personeli listele
Select * From personel Where maas = 70000 OR isim = 'Sena Beyaz'; -- iki sarti birden saglayan veri olmadigi icin And'de bos gelir

-----------------*************************************------------------------********************-
/*
=> IN : Birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutta yazabilme imkani verir.
Farkli sutunlar icin IN KULLANILAMAZ
*/
-- TASK : id'si 1001, 1002 ve 1004 olan personelin bilgilerini listele
Select * From personel Where id = '1001' or id = '1002' or id = '1004';
-- 2.Yontem
Select * From personel Where id IN('1001','1002','1004');



