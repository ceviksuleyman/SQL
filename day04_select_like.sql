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

Select * From personel;
/*
SELECT - LIKE kosulu
LIKE -> Sorgulama yaparken belirli (Pattern)kalip ifadeleri kullanabilmemizi saglar.
ILIKE -> Sorgulama yaparken buyuk/kucuk harfe duyarsiz olarak eslestirir.

-Isaret Olarak Karsiliklari-
LIKE -> ~~ 
ILIKE -> ~~*
NOT LIKE -> !~~
NOT ILIKE -> !~~*

% -> 0 veya daha fazla karakteri belirtir.
_ -> Tek bir karakteri belirtir.
*/

-- TASK : ismi A harfi ile baslayan personeli listele
Select * From personel Where isim Like 'A%';


-- TASK : ismi t harfi ile biten personeli listele
Select * From personel Where isim Like '%t';

-- TASK : isminin 2. harfi e olan personeli listeleyiniz.
Select * From personel Where isim like '_e%';

-- TASK :'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
Select isim From personel Where isim ~~* 'a%n';

-- TASK :ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
Select isim From personel Where isim ~~ '_a_u%';

-- TASK : İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
Select isim From personel Where isim ~~* '%e%' and isim ~~* '%r%';

-- TASK : 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
Select * From personel Where isim Like '_e%' and isim like '%y%'; -- 1.yontem
Select * From personel Where isim like '_e%y%'; -- 2.yontem

-- TASK : a harfi olmayan personeli listeleyin
Select * From personel Where isim not like '%a%';

-- TASK : 1. harfi A ve 7. harfi a olan personeli listeleyin
Select * From personel Where isim ~~*'A_____a%';

-- TASK : Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
Select * From personel Where isim like '%r_';





