
CREATE TABLE calisanlar( -- Parent Tablo
	
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


Select * From calisanlar;

-- FOREIGN KEY

Create Table adresler( -- Child Tablo
	adres_id char(5),
	sokak varchar(20),
	cadde varchar(30),
	sehir varchar(20),
	CONSTRAINT id_pk Foreign Key (adres_id) References calisanlar(id) -- adres_id  calisanlar id ye baglandi
);--CONSTRAINT id_pk bu olmadan da olur kendisi bi isim atar

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

SELECT * FROM adresler;

INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep'); -->Parent tabloda olmayan id ile child tabloya ekleme yapamayiz.!!!

INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep'); --> foreign key'e null deger ekledim


-- calisanlar id ile adresler tablosundaki adres_id ile eslesenlere gormek icin asagidaki komut
Select * From calisanlar, adresler Where calisanlar.id = adresler.adres_id;


-- NOTE : Parent tabloyu yani Primary key olan tabloyu silmek istedigimizde parent tabloyu silemeyiz once child tabloyu silmek gerekir.

Drop Table calisanlar; --> Parent tablo oldugu icin calisanlar tablosunu silemez.

Delete From calisanlar Where id = '10002';-- Parent tabloda oldugu icin once child'daki foreign'i silmeliyiz yoksa hata verir.

Delete From adresler Where adres_id ='10002'; -- Child tablo'dan once silersek sonra parent'ten de silebilir.



/* 
ON DELETE CASCADE 

Her defasinda once child tablodaki veirleri silmek yerine ON DELETE CASCADE silme ozelligini aktif hale getirebiliriz.
Bunun icin FOREIGN KEY olan satirin en sonuna ON DELETE CASCADE komutunu yazmamiz yeterlidir.
*/

CREATE TABLE talebeler( -- PARENT TABLO
	ID CHAR(3) Primary Key,
	isim VARCHAR(50),
	veli_isim VARCHAR(50),
	yazili_notu int
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE notlar( -- Child TABLO
	talebe_id char(3),
	ders_adi varchar(30),
	yazili_notu int,
	CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
	ON DELETE CASCADE -- >  Parent tablodan veri silinince direk burdan da silinecek.
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

Select * From talebeler;
Select * From notlar;

Select * From talebeler, notlar Where talebeler.id = notlar.talebe_id; -- Parent ve child tabloyu birlikte gosterir.


Delete from notlar Where talebe_id = '123'; -- child'den silince parentten silmez.

Delete from talebeler Where id = '126'; --Parent'ten silince child'den da direk sildi On Delete Cascade ile notlar tablosunu olusturdugumuz icin
                                        --Parent'ten veriler silinince child'den de silinmis oldu
										
Delete From talebeler; -- talebeler tablosundaki verileri sildi

Drop Table talebeler Cascade;-- Parent tabloyu kaldirmak istersek DROP TABLE tablo_adi'dan sonra CASCADE komutunu kullaniriz.

---------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-1 : Talebeler tablosundaki isim sutununa  NOT NULL kisitlamasi ekleyiniz ve veri tipini varchar(30) olarak degistirin.
Alter Table talebeler 
Alter column isim Type varchar(30), -- data turunu degistirdi
Alter column isim Set Not NULL; -- isim sutununa Not Null kisiti ekledi


-- TASK-2 : Talebeler tablosundaki yazili_notu sutununa 60 dan buyuk rakam girilebilsin
Alter Table talebeler
ADD CONSTRAINT sinir CHECK (yazili_notu > 60); -- CHECK => kisitlamasi ile tablodaki istedigimiz sutunu sinirlandirabiliriz.

INSERT INTO talebeler VALUES(128, 'Suleyman Cevik', 'Can',45);-- 60 not siniri oldugu icin eklemedi.

-- TASK-3 : yazili Notu 85 den buyuk olan talebe bilgilerini getirin
Select * From talebeler Where yazili_notu > 85;


-- TASK-4 : ismi Mustafa Bak olan talebenin tum bilgilerini getirin
Select * From talebeler Where isim = 'Mustafa Bak';
