
-- ORDER BY - 
-- Bir SORGU deyimi icerisinde belli bir SUTUN'a gore siralama yapmak icin kullanilir.

CREATE TABLE kisiler (
	id int PRIMARY KEY,
	ssn CHAR(9) ,
	isim VARCHAR(50), 
	soyisim VARCHAR(50), 
	maas int,
	adres VARCHAR(50) 
);
    
INSERT INTO kisiler VALUES(1,123456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(2,234567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(3,345678901, 'Mine','Bulut',4200,'Adiyaman');
INSERT INTO kisiler VALUES(4,256789012, 'Mahmut','Bulut',3150,'Adana');
INSERT INTO kisiler VALUES(5,344678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES(6,345458901, 'Veli','Yilmaz',7000,'Istanbul');
INSERT INTO kisiler VALUES(7,113456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(8,224567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(9,335678901, 'Mine','Bulut',4200,'Ankara');
INSERT INTO kisiler VALUES(10,446789012, 'Mahmut','Bulut',3150,'Istanbul');
INSERT INTO kisiler VALUES(11,554678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES(12,665458901, 'Veli','Yilmaz',7000,'Istanbul');

Select * From kisiler;

 -- TASK-1 : kisiler tablosunu adres'e göre sıralayarak sorgulayınız.

 Select * From kisiler Order By adres;
 Select * From kisiler Order By adres asc; -- Ascending(asc) yazmasak da sirali olarak verir. a-z..
 
 
 
 -- TASK-2 : kisiler tablosunu adres'e gore tersten siralayarak sorgulayin
 
 Select * From kisiler Order By adres desc; -- Descending(desc) tersten sirali olarak verir. z-a..
 
 
 
 -- TASK-3 : kisiler tablosunda maasi buyukten kucuge siralayiniz.
 
 Select * From kisiler Order By maas desc;  -- desc yazmazsak kucukten buyuge dogru siralar.!
 
 

 --TASK-4 : ismi Mine olanlari maas'a gore azalan sirada sorgulayin.
 
 Select * From kisiler Where isim='Mine' Order By maas desc;
 
 
 
 --TASK-5 : soyismi 'i Bulut olanları maas sıralı olarak sorgulayınız.
 
 Select * From kisiler Where soyisim='Bulut' Order By maas;
