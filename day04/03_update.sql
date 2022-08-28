--DML -> UPDATE Tabloda veri guncelleme

CREATE TABLE tedarikciler( -- parent
	vergi_no int PRIMARY KEY,
	firma_ismi VARCHAR(50),
	irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler( --child
	ted_vergino int,
	urun_id int,
	urun_isim VARCHAR(50),
	musteri_isim VARCHAR(50),
	CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
	on delete cascade
);

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

Select * From tedarikciler;
Select * From urunler;


-- TASK-1 : vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.

Update tedarikciler
Set firma_ismi = 'Vestel' Where vergi_no = 102 ;



-- TASK-2 : vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

Update tedarikciler
Set firma_ismi = 'casper',irtibat_ismi = 'Ali Veli' Where vergi_no = 101; 


-- TASK-3 : urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.

Update urunler
Set urun_isim = 'TELEFON' Where urun_isim = 'Phone'; -- urun_ismi Phone olanlari TELEFON ile degistir



-- TASK-4 : urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.

Update urunler
Set urun_id = urun_id + 1  Where urun_id > 1004;



-- TASK-5 : urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.

Update urunler
Set urun_id=ted_vergino+urun_id;



-- TASK-6 : urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
-- Bu soruda tedarikciler ve urunler tablosunu yeniden olusturduk.

Update urunler
Set urun_isim = (Select firma_ismi From tedarikciler Where irtibat_ismi='Adam Eve')
Where musteri_isim = 'Ali Bak';



-- TASK-7 : Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.

Update urunler
Set musteri_isim = (Select irtibat_ismi From tedarikciler Where firma_ismi = 'Apple')
Where urun_isim = 'Laptop';
