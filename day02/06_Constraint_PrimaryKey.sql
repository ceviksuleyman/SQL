/*
CONSTRAINT -- Kisitlamalar

Primary Key => Bir sutunun NULL icermemesini ve sutundaki verilerin BENZERSIZ olmasini saglar(NOT NULL - UNIQUE)

Foreign Key => Baska bir tablodaki Primary Key'i referans gostermek icin kullanilir. Boylelikle,tablolar arasinda iliski kurulmus olur.

UNIQUE      => Bir sutundaki tum degerlerin Benzersiz yani tek olmasini saglar.

NOT NULL    => Bir sutunun Null icermemesini yani bos olmamasini saglar.Not Null kisitlamasi icin CONSTRANINT ismi tanimlanmaz,bu kisitlama
veri turunden hemen sonra yerlestirilir.

CHECK       => Bir sutuna yerlestirilebilecek deger araligini sinirlamak icin kullanilir.
*/
CREATE TABLE calisanlar2(
	id CHAR(5), 
	isim VARCHAR(50),
	maas int NOT NULL,
	ise_baslama DATE,
	CONSTRAINT pk_id Primary Key(id), -- Constraint ismi vererek Primary Key olusturma
	CONSTRAINT ism_unq UNIQUE(isim) -- Constraint ismi vererek Unique sutun olusturma
);

CREATE TABLE calisanlar(
	id CHAR(5) PRIMARY KEY,  -- not null + unique
	isim VARCHAR(50) UNIQUE, -- Bu sutundaki tum degerler unique olmali
	maas int NOT NULL, -- Bu sutunun null icermemesini saglar yani bos olmamasi
	ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); --unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- constraint Not NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- Can iki defa kabul etmedi unique
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --  Not Null , maas bos oldugu icin kabul etmedi
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- hiclik 2 defa kabul etmedi unique primary key
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- primary key unique iki defa 10002 eklemedi
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- primary key null kabul etmez.

Select * From calisanlar;
