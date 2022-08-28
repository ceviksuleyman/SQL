/*
  TCL -> Transaction Control Lang.(Islem Kontrol Dili)
  
  BEGIN - SAVEPOINT - ROLLBACK - COMMIT
  
  Transaction, veritabani sistemlerinde bir islem basladiginda baslar ve islem bitince sona erer.
  Bu islemler veri tabani olusturma,veri silme, veri guncelleme, veriyi geri getirme gibi islemler olabilir.
*/

CREATE TABLE ogrenciler2(
	id serial,
	isim VARCHAR(50),
	veli_isim VARCHAR(50),
	yazili_notu real
);

Begin; -- Transaction'i baslat

--id serial dedigimiz icin ilk default ile basladik 

insert into ogrenciler2 values (default,'Ali Can','Ahmet Can',75.5);
insert into ogrenciler2 values (default,'Veli Gul','Hasan Gul',90.5);

savepoint x; -- begin olmazsa savepoint calismazdi, x -> savepoint'e verdigimiz herhangi bir isim 

insert into ogrenciler2 values (default,'Kemal Can','Murtaza Can',75.5);
insert into ogrenciler2 values (default,'Mahmut Gul','Hilal Gul',90.5);

Rollback To x; -- geri aldik savepoint oncesine dondu

Commit; -- transaction'dan cikmak icin mutlaka calismalidir

select * from ogrenciler2;
/*
Transaction kullaniminda Serial data turu kullanimi tavsiye edilmez.
Savepoint'ten sonra ekledigimiz veride sayac mantigi ile calistigi icin sayacta en son hangi sayida kaldiysa ordan devam eder.


NOTE => 

PostgreSQL de transaction kullanimi icin 'Begin' komutuyla baslariz,sonrasinda tekrar yanlis bir veriyi duzeltmek
veya bizim icin onemli olan verilerden sonra ekleme yapabilmek icin 'Savepoint savepointismi' komutunu kullaniriz. 

Bu savepoint'te donebilmek icin 'Rollback To savepointismi' komutunu kullaniriz ve Rollback calistirildiginda savepoint 
yazdigimiz satirin ustundeki verileri tabloda bize verir ve son olarak transaction'i sonlandirmak icin mutlaka 'Commit' komutu kullaniriz.

MySQL'de transaction olmadan da kullanilir.
*/