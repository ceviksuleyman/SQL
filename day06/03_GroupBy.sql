
/*
 GROUP BY
 
- Bir SELECT ifadesinde satirlari,sutunlari degerlerine gore ozet olarak gruplamak icin kullanilir.
- Group By , her grup basina satir döndurur.
- Group By genelde AVG(),COUNT(),MAX(),MIN() ve SUM() gibi Aggregate fonksiyonlari ile birlikte kullanilir.
*/

CREATE TABLE manav (
    isim varchar(50), 
    urun_adi varchar(50), 
    urun_miktari int 
);
    
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', null, 2);

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

Select * From manav;


   --TASK-1 : kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu yazınız.

   Select isim,sum(urun_miktari) From manav Group By isim;
   
   
   
   --TASK-2 : satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren-- sorguyu yazınız.
   --NULL olarak girilen meyveyi listelemesin.
   
   Select urun_adi,Count(isim) As kisi_sayisi From manav Where urun_adi is Not Null
   Group By urun_adi;
   
   
   
   --TASK-3 : satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve -- MAX urun miktarlarini, 
   --MAX urun miktarina göre sıralayarak listeyen sorguyu yazınız.

   Select urun_adi,Min(urun_miktari) As minimum_urun_miktari,Max(urun_miktari) As maksimum_urun_miktari From manav
   Where urun_adi is Not Null
   Group By urun_adi
   Order By maksimum_urun_miktari desc;
   
   
   
   --TASK-4 : kisi ismine ve urun adına göre satılan ürünlerin toplamını gruplandıran ve isime göre ters sırasıda listeyen sorguyu yazınız.
   
   Select isim,urun_adi,Sum(urun_miktari) As toplam_urun From manav
   Group By isim,urun_adi
   Order By isim desc;
   
   
   
   Select * From personel;
   
   --TASK-5 : personelin calıştığı ülkeleri listeleyiniz
   
   Select ulke From personel Group By ulke;
   
   
   
   --TASK-6 : Ülkelere göre ortalama maaşları listeleyiniz
   
   Select ulke,Round(Avg(maas),2) As ort_maas From personel -- Round -> virgulden sonrasini ayarla 
   Group By ulke;


