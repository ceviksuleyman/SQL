/*
 DML - Data Manipulation Lang.(Veri Kullanma Dili)
   INSERT -> Tabloya Veri Ekleme
   UPDATE -> Veri Guncelleme
   DELETE -> Veri Silme
*/


-- INSERT -> Tabloya Veri Ekleme

create table student(
	id varchar(4),
	st_name varchar(30),
	age int
);

INSERT INTO student Values ('1001','Ali Can',25);
INSERT INTO student Values ('1002','Veli Can',35);
INSERT INTO student Values ('1003','Ayse Can',45);
INSERT INTO student Values ('1004','Derya Can',55);

--Tabloya parcali veri ekleme
INSERT INTO student (st_name,age) Values('Murtaza Can',65);

/*
  DQL - Data Query Lang.(Veri Sorgulama Dili)
  
  SELECT -> Verileri secme,gorme
*/
Select * From student; --> TABLOYU GETIRIR

Select st_name From student; --> Tablodaki isimleri bize getirir

-- SELECT komutu WHERE kosulu
Select * From student Where age>35;--> yas 35 uzeri olanlari getirir
