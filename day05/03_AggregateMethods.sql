/* 
AGGREGATE METHOD KULLANIMI

=> Aggregate Methodlari (SUM,COUNT,MIN,MAX,AVG)
=> Subquery icinde de kullanilir,ancak sorgu tek bir deger donduruyor olmalidir.
=> Syntax : sum() seklinde olmali , sum () arasinda bosluk kabul etmez.
*/

   Select * From calisanlar2;
   Select * From markalar;
   
   
   -- TASK-1 : calisanlar2 tablosundaki en yuksek maas degerini listeleyin.
   
   Select max(maas) From calisanlar2;
   
   
   
   -- TASK-2 : calisanlar2 tablosundaki maaslarin toplamini listeleyin.
   
   Select sum(maas) From calisanlar2;
   
   
   
   -- TASK-3 : calisanlar2 tablosundaki maas ortalamasini listeleyin.
   
   Select avg(maas) From calisanlar2;
   Select round(avg(maas)) From calisanlar2; -- ortalamada virgulden sonrasini siler.
   Select round(avg(maas),2) From calisanlar2; -- virgulden sonra 2 rakam verir. 
   
   
   
   -- TASK-4 : calisanlar2 tablosundaki en dusuk maas degerini listeleyin.
   
   Select min(maas) From calisanlar2;
   
   
   
   -- TASK-5 : calisanlar tablosunda kac kisinin maas aldigini listeleyin.
   
   Select count(maas) From calisanlar2;
   
   
   
   -- TASK-6 : Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
   
   Select marka_isim,calisan_sayisi,(Select sum(maas) From calisanlar2 Where marka_isim=isyeri) As toplam_maas From markalar;

   
   
   
   
   
   
   
   
   