--SELECT - SIMILER TO - REGEX(REGULAR EXSPRESSIONS)
/*
SIMILAR TO : Daha karmasik pattern(kalip) ile sorgulama islemi icin SIMILER TO kullanilabilir.
Sadece PostgreSQL'de kullanilir.
Buyuk kucuk harf onemlidir.


REGEX : Herhangi bir kod,metin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini saglayan kendine ait
bir soz dizimi olan bir yapidir. MySQL'de (REGEXP_LIKE) olarak kullanilir.

* PostgreSQL'de '~' karakteri ile kullanilir.
*  ~  => kucuk harf
*  ~* => buyuk kucuk harf  
*/


   CREATE TABLE kelimeler(
	id int,
	
	kelime VARCHAR(50),
	
	harf_sayisi int
   );

   INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
   
   Select * From kelimeler;
   
   -- TASK-1 :  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
   
   -- 1.yontem SIMILAR TO
   Select * From kelimeler Where kelime Similar To '%(at|ot)%'; --> veya islemi icin  | kullanilir
   
   -- 2.yontem LIKE 
   Select * From kelimeler Where kelime ilike '%at%' or kelime ilike '%ot%';
   Select * From kelimeler Where kelime ~~* '%at%' or kelime ~~* '%ot%';
   
   -- 3.yontem REGEX
   Select * From kelimeler Where kelime ~* 'ot' or kelime ~* 'at';
   
   
   
   -- TASK-2 : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz    ******************************************
   
   -- 1.yontem Similar To
   Select * From kelimeler Where kelime Similar To'ho%|hi%';
   
   -- 2.yontem Like
   Select * From kelimeler Where kelime ~~* 'ho%' or kelime ~~* 'hi%';
   
   -- 3.yontem Regex => Regex'te ".(nokta) bir karakteri temsil eder".Regex'te ikinci karakter icin koseli parantez[] kullanilir.
   Select * From kelimeler Where kelime ~* 'h[oi](.*)';
   
   
   
   -- TASK-3 : Sonu 't' veya 'm' ile bitenleri listeleyeniz ********************************************
   
   -- 1.yontem Similar To
   Select * From kelimeler Where kelime Similar To '%t|%m';
   
   -- 2.yontem Regex
   Select * From kelimeler Where kelime ~* '(.*)[tm]$'; -- $ => karakteri bitisi gosterir.
   
   
   
   -- TASK-4 : h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz  ********************************************
   
   -- 1.yontem Similar To
   Select * From kelimeler Where kelime Similar To 'h[a-z,A-Z,0-9]t';
   
   -- 2.yontem Like
   Select * From kelimeler Where kelime ~~* 'h_t';
   
   -- 3.yontem Regex
   Select * From kelimeler Where kelime ~* 'h[a-z,A-Z,0-9]t';
   
   
   
   -- TASK-5 : İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
   
   --1.yontem Similar To
   Select kelime From kelimeler Where kelime Similar To 'h[a-e]%t';
   
   --2.yontem Regex
   Select kelime From kelimeler Where kelime ~* 'h[a-e](.*)t';
   
   
  
   -- TASK-6 : İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
   
   Select * From kelimeler Where kelime ~ '^[say](.*)'; -- ^ bastaki karakteri temsil eder.
   
   
   
   -- TASK-7 : Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.

   Select * From kelimeler Where kelime ~'(.*)[maf]$'; -- (.*) kullanmasak da ayni sonucu verir.
   
   
   
   -- TASK-8 : İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
   
   Select * From kelimeler Where kelime Similar To 'h[a|i]t';
   
   Select * From kelimeler Where kelime ~ '^h[a|i]t$';
   
   
   
   -- TASK-9 : İlk harfi 'b' den ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
   
   Select kelime From kelimeler Where kelime ~ '^[b-s].l(.*)';
   
   Select kelime From kelimeler where kelime Similar To '[b-s]_l%';
   
   
   
   
   -- TASK-10 : içerisinde en az 2 adet oo barindiran kelimelerin tüm bilgilerini listeleyiniz.
   
   Select * From kelimeler Where kelime Similar To '%[o][o]%';
   
   Select * From kelimeler Where kelime Similar To '%[o]{2}%'; -- {} icinde belirttigimiz rakam bir onceki [] icinde kactane oldugunu belirtir.
   
   
   
   -- TASK-11 : içerisinde en az 4 adet oooo barindiran kelimelerin tüm bilgilerini listeleyiniz.
   
   Select * From kelimeler Where kelime Similar To '%[o]{4}%'; -- yan yana 4 o
   
   Select * From kelimeler Where kelime ~~* '%o%o%o%o%' -- kelime de 4 o

   
   
   
   -- TASK-12 : 'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
   
   Select * From kelimeler Where kelime ~ '^[a|s|y](.*)[m|f]$';

   

   