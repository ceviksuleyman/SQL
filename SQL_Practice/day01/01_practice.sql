-- SQL PRACTICE DAY_1

create table personel(
	id serial primary key,  -- Serial id'yi auto increment seklinde artirir.
	isim varchar(20), 
	yas int,
	maas int,
	email varchar(30) 
); 
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.
insert into personel(isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel(isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel(isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel(isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel(isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel(isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel(isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel(isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel(isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel(isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

--TASK-1 : Tum tabloyu listeleyin.
Select * From personel;

--TASK-2 : isim, yaş ve maaş bilgilerini listeleyiniz
Select isim,yas,maas From personel;

--TASK-3 : id'si 8 olan personel bilgilerini listeleyiniz
Select * From personel Where id=8;

--TASK-5 : id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
Select isim,yas,email From personel Where id=5;

--TASK-6 : 30 yaşından büyük personel bilgilerini listeleyiniz.
Select * From personel Where yas>30;

--TASK-6 : maası 21000 olmayan personel bilgilerini listeleyiniz.
Select * From personel Where maas <> 21000;

--TASK-7 : ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
Select * From personel Where isim ~~* 'a%'; -- (~~*)ILIKE  %-> a'dan sonra ne varsa getir.

--TASK-8 : ismi n harfi ile biten personel bilgilerini listeleyiniz.
Select * From personel Where isim ~~* '%n'; 

--TASK-9 : email adresi gmail olan personel bilgilerini listeleyiniz.
Select * From personel Where email ~~ '%gmail.com';

--TASK-10 : email adresi gmail olmayan personel bilgilerini listeleyiniz.
Select * From personel Where email Not Like '%gmail.com'; -- ifade aradigimiz icin Null gelmedi

--TASK-11 : id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
Select * From personel Where id IN(3,5,7,9);
Select * From personel Where id= 3 or id=5 or id=7 or id=9;

--TASK-12 : yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
Select * From personel Where yas Not IN(39,48,54);

--TASK-13 : yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
Select * From personel Where yas Between 30 And 40;
Select * From personel Where yas>30 And yas<40

--TASK-14 : yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
Select * From personel Where yas NOT Between 30 And 40;

--TASK-15 : emaili null olan personel bilgilerini listeleyiniz.
Select * From personel Where email is Null;

--TASK-16 : personel bilgilerini yaşa göre sıralayınız.
Select * From personel Order By yas; -- naturel order - kucukten buyuge siralar - asc yazmasakta siralar.

--TASK-17 : personel bilgilerini maaşa göre sıralayınız.
Select * From personel Order By maas;

--TASK-18 : personelin yaşlarını büyükten küçüğe doğru sıralayınız.
Select * From personel Order By yas desc; -- buyukten kucuge siralar - desc

--TASK-19 : personelin maaşlarını büyükten küçüğe doğru sıralayınız.
Select * From personel Order By maas desc;

--TASK-20 : En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
Select * From personel Order By maas desc Limit 3;
