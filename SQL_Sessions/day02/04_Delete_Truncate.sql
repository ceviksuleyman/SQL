/*
   DML - DELETE 

 DELETE FROM tablo_adi => Tablonun tum icerigini siler

 DELETE FROM tablo_adi WHERE sutun_adi = veri --> Veriyi secerek silmek icin WHERE kosulu kullanilir.Tablodaki istedigimiz veriyi siler
*/
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

Select * From ogrenciler;

-- TASK-1 : id'si 124 olan ogrenciyi silin

Delete From ogrenciler Where id = 124;


-- TASK-2 : ismi Kemal Yasa olan satiri silin

Delete From ogrenciler Where isim = 'Kemal Yasa';


-- TASK-3 : ismi Nesibe Yilmaz veya Mustafa Bak olan kayitlari silelim

Delete From ogrenciler Where isim = 'Nesibe Yilmaz' Or isim = 'Mustafa Bak';


-- TASK-4 : ismi Ali Can ve id'si 123 olan kaydi silin.

Delete From ogrenciler Where isim = 'Ali Can' Or id = 123;


-- TASK-5 : Tablodaki tum verileri silelim

Delete From ogrenciler;


-- DELETE - TRUNCATE -

-- TRUNCATE komutu DELETE komutu gibi bir verilerin tamamini siler, ancak secmeli silme yapamaz.

Truncate Table ogrenciler;
