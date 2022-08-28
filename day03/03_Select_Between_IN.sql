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

--TASK-1 : id'si 1003 ile 1005 arasinda olan personel bilgisini listeleyin.
select * from personel Where id Between '1003' and '1005';
-- 2.Yontem
Select * From personel Where id >= '1003' and id <= '1005';


-- TASK : Derya Soylu ile Yavuz Bal arasindaki personel bilgisini listeleyiniz.
Select * From personel Where isim Between 'Derya Soylu' And 'Yavuz Bal';


-- TASK : Maasi 70000 ve ismi Sena olan personeli listele
Select * From personel Where maas = 70000 OR isim = 'Sena Beyaz'; -- iki sarti birden saglayan veri olmadigi icin And'de bos gelir

-----------------*************************************------------------------********************-
/*
   IN : Birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutta yazabilme imkani verir.
   !! Farkli sutunlar icin IN KULLANILAMAZ
*/

-- TASK : id'si 1001, 1002 ve 1004 olan personelin bilgilerini listele
Select * From personel Where id = '1001' or id = '1002' or id = '1004';
-- 2.Yontem
Select * From personel Where id IN('1001','1002','1004');


-- TASK : maasi sadece 70000, 100000 olan personeli listele
Select * From personel Where maas in('70000','100000');
