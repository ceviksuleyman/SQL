
-- PRIMARY KEY ATAMA

Create Table ogrenciler( -- Parent Tablo
	id int,
	isim varchar(45),
	adres varchar(100),
	sinav_notu int
);

Create Table ogrenci_adres
AS
SELECT id, adres From ogrenciler;

Select * From ogrenciler;

Select * From ogrenci_adres;

-- Tablodaki bir sutuna PRIMARY KEY ekleme 
ALTER TABLE  ogrenciler
Add Primary Key(id);

-- Primary Olusturmada 2. YONTEM
Alter Table ogrenciler 
Add Constraint pk_id Primary Key(id); -- constraint ismini kendimiz belirledik


-- PRIMARY KEY'DEN SONRA FOREIGN KEY ATAMASI 

Alter Table ogrenci_adres
Add Foreign Key(id) References ogrenciler;-- Child tabloyu parent tablodan olusturdugumuz icin kolon adi vermedik


-- Foreign Key'i silme
Alter Table ogrenci_adres Drop Constraint ogrenci_adres_id_fkey;


-- Primary Key'deki Constraint ismini silme
Alter Table ogrenciler Drop Constraint pk_id;
