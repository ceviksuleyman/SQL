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
