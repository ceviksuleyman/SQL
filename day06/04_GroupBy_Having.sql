
/*
 - GROUP BY - HAVING

HAVING ifadesinin islevi WHERE ifadesi ile cok benzerdir, ancak kumeleme fonksiyonlari ile WHERE ifadesi birlikte
kullanilmadigindan HAVING ifadesine ihtiyac duyulmustur.

- GROUP BY ile kullanilir. Gruplamadan sonraki sart icin GROUP BY'dan sonra HAVING kullanilir.
*/

create table personel(
	id int primary key,
	ad varchar(20),
	soyad varchar(20),
	yas int,
	cinsiyet char,
	sehir varchar(20),
	ulke varchar(20),
	maas int
);
insert into personel values(100, 'Eymen',  'Bal', '25', 'E', 'Istanbul', 'Turkiye', '20000');
insert into personel values(101, 'Derya', 'Soylu', '35', 'K', 'Istanbul', 'Turkiye', '25000');
insert into personel values(102, 'Enes', 'Boz', '55', 'E', 'Istanbul', 'Turkiye', '22000');
insert into personel values(103, 'Nil', 'Naz', '45', 'K', 'Trabzon', 'Turkiye', '20000');
insert into personel values(104, 'Ali', 'Can', '28', 'E', 'Ankara', 'Turkiye', '15000');
insert into personel values(105, 'Yusuf', 'Cengiz', '46', 'E', 'Bolu', 'Turkiye', '30000');
insert into personel values(106, 'Ahmet', 'Aslan', '38', 'E', 'Adana', 'Turkiye', '28000');
insert into personel values(107, 'Mehmet', 'Aslan', '29', 'E', 'Gaziantep', 'Turkiye', '21000');
insert into personel values(108, 'Sena', 'Yavuz', '49', 'K', 'New York', 'USA', '40000');
insert into personel values(109, 'Zehra', 'Amber', '52', 'K', 'New York', 'USA', '45000');
insert into personel values(110, 'Fatma', 'Nur', '33', 'K', 'Berlin', 'Almanya', '35000');
insert into personel values(111, 'Mustafa', 'Bay', '44', 'E', 'Paris', 'Fransa', '34000');
insert into personel values(112, 'Murat', 'Kerem', '28', 'E', 'Istanbul', 'Turkiye', '29000');
insert into personel values(113, 'Sinan', 'Ay', '45', 'E', 'Izmir', 'Turkiye', '19000');
insert into personel values(114, 'Figen', 'Bal', '55', 'K', 'Istanbul', 'Turkiye', '25000');
insert into personel values(115, 'Serkan', 'Bayram', '36', 'E', 'Londra', 'Ingiltere', '50000');
insert into personel values(116, 'Hakan', 'Bacak', '29', 'E', 'Londra', 'Ingiltere', '55000');
insert into personel values(117, 'Zafer', 'Yanak', '47', 'E', 'Berlin', 'Almanya', '42000');
insert into personel values(118, 'Birol', 'Kara', '37', 'E', 'Paris', 'Fransa', '41000');
insert into personel values(119, 'Ayten', 'Tan', '32', 'K', 'Roma', 'Italya', '39000');


  -- TASK-1 : Maaş ortalaması 30000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
  
  --1.yontem
  Select ulke, Round(Avg(maas)) As ort_maas From personel
  Where cinsiyet='E'
  Group By ulke
  Having Round(Avg(maas))>30000;
  
  --2.yontem
  Select ulke,Round(Avg(maas)) As ort_maas From personel
  Where cinsiyet='E' And maas>30000
  Group By ulke
  
  
  
  --TASK-2 : Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu yazin
  
  Select ulke, Round(Avg(maas)) As ort_maas, Count(cinsiyet) As calisan_sayi From personel
  Where cinsiyet='E'
  Group By ulke 
  Having Count(cinsiyet)>1;
  