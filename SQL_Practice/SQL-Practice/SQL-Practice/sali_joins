
CREATE TABLE sirketler 
(
	sirket_id int, 
	sirket_isim VARCHAR(20)
);
    
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');
  
CREATE TABLE siparisler
(
	siparis_id int,
	sirket_id int, 
	siparis_tarihi DATE
);
    
INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

select * from sirketler;
select * from siparisler;
    
  
/* -----------------------------------------------------------------------------
  SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id ve 
  siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
select a.sirket_id, a.sirket_isim, b.siparis_id, b.siparis_tarihi 
from siparisler as b 
inner join sirketler as a 
on a.sirket_id=b.sirket_id;
-- sirketler tablosuna  = A 
-- siparisler tablosuna = B 
       
/* -----------------------------------------------------------------------------
  SORU2: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/   
-- 1. yol left join
select a.sirket_isim, b.siparis_id, b.siparis_tarihi from sirketler 
as a left join siparisler  as b on a.sirket_id=b.sirket_id;
-- 2 yol rihgt
select b.sirket_isim, a.siparis_id, a.siparis_tarihi from siparisler 
as a right join sirketler as b on a.sirket_id=b.sirket_id;

-- 3 yol full join 
 select a.sirket_isim, b.siparis_id, b.siparis_tarihi from sirketler 
 as a left join siparisler  as b on a.sirket_id=b.sirket_id
union all
select a.sirket_isim, b.siparis_id, b.siparis_tarihi from sirketler
as a  right join siparisler  as b on a.sirket_id=b.sirket_id;


      
/* -----------------------------------------------------------------------------
  SORU3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile 
  bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/   
select b.sirket_isim ,a.siparis_id, a.siparis_tarihi      from siparisler 
as a   left join sirketler as b      on a.sirket_id=b.sirket_id
union
select b.sirket_isim  ,a.siparis_id,a.siparis_tarihi     from siparisler 
as a   right join sirketler as b      on a.sirket_id=b.sirket_id;
-- 2.yok
select A.sirket_isim, B.siparis_id, B.siparis_tarihi
from sirketler as A
full join siparisler as B
on A.sirket_id=B.sirket_id; 
    
/* -----------------------------------------------------------------------------
  SORU4: sirketler ve siparisler adındaki tablolarda yer alan sirket_isim, 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/ 
select A.sirket_isim, B.siparis_id, B.siparis_tarihi, A.sirket_id
from sirketler as A
left join siparisler as B
on A.sirket_id=B.sirket_id
union
select A.sirket_isim, B.siparis_id, B.siparis_tarihi, B.sirket_id
from sirketler as A 
right join siparisler as B
on A.sirket_id=B.sirket_id;  

====================================================
create table films
(film_id int,
film_name varchar(30),
category varchar(30)
);

insert into films values (1, 'Assassins Creed: Embers', 'Animations');
insert into films values (2, 'Real Steel(2012)', 'Animations');
insert into films values (3, 'Alvin and the Chipmunks', 'Animations');
insert into films values (4, 'The Adventures of Tin Tin', 'Animations');
insert into films values (5, 'Safe (2012)', 'Action');
insert into films values (6, 'Safe House(2012)', 'Action');
insert into films values (7, 'Marley and me', 'Romance');


create table actors
(id int,
actor_name varchar(30),
film_id int
);

insert into actors values (1, 'Adam Smith', 1);
insert into actors values (2, 'Ravi Kumar', 2);
insert into actors values (3, 'Susan Davidson', 5);
insert into actors values (4, 'Lee Pong', 6);
insert into actors values (5, 'Bruce Lee', NULL);



-- SORU1: Tüm filmleri, film türlerini ve filimlerde oynayan aktörleri listeleyiniz.
-- 1. YOL: LEFT JOIN
SELECT A.film_name, A.category, B.actor_name
FROM films AS A
LEFT JOIN actors AS B
ON B.film_id = A.film_id;

-- 2. YOL RIGHT JOIN
SELECT A.film_name,A.category, B.actor_name
FROM actors AS B
RIGHT JOIN films AS A
ON B.film_id = A.film_id;

-- SORU2: Tüm aktörleri ve filmlerini listeleyiniz.
-- 1. YOL: LEFT JOIN
SELECT  B.actor_name, A.film_name
FROM actors AS B
left JOIN films AS A
ON B.film_id = A.film_id;

-- 2. YOL RIGHT JOIN
SELECT  B.actor_name, A.film_name
FROM films AS A
right JOIN actors AS B
ON B.film_id = A.film_id;

-- =================================================================


	CREATE TABLE bolumler (
      bolum_id   int PRIMARY KEY,
      bolum_isim VARCHAR(14),
      konum      VARCHAR(13)
    );
    
    INSERT INTO bolumler VALUES (10,'MUHASEBE','IST');
    INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');

    CREATE TABLE personel (
      personel_id   int PRIMARY KEY,
      personel_isim VARCHAR(10),
      meslek        VARCHAR(9),
      mudur_id      int,
      maas          int,
      bolum_id      int
    );

  
    INSERT INTO personel VALUES (7369,'AHMET','KATIP',1111,800,20);
    INSERT INTO personel VALUES (7499,'BAHATTIN','SATISE',1222,1600,30);
    INSERT INTO personel VALUES (7521,'NESE','SATISE',1222,1250,30);
    INSERT INTO personel VALUES (1111,'MUZAFFER','MUDUR',7839,2975,20);
    INSERT INTO personel VALUES (7654,'MUHAMMET','SATISE',1222,1250,30);
    INSERT INTO personel VALUES (1222,'EMINE','MUDUR',7839,2850,30);
    INSERT INTO personel VALUES (1333,'HARUN','MUDUR',7839, 2450,10);
    INSERT INTO personel VALUES (7788,'MESUT','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,5000,10);
    INSERT INTO personel VALUES (7844,'DUYGU','SATISE',1222,1500,30);
    INSERT INTO personel VALUES (7876,'ALI','KATIP',1111,1100,20);
    INSERT INTO personel VALUES (7900,'MERVE','KATIP',1222,950,30);
    INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7934,'EBRU','KATIP',1333,1300,10);
    INSERT INTO personel VALUES (7956,'SIBEL','MIMAR',1333,3300,60);
    INSERT INTO personel VALUES (7933,'ZEKI','MUHENDIS',1333,4300,60);
    
select * from bolumler;
SELECT * FROM personel;
   
/* -----------------------------------------------------------------------------
  SORU1: SATIS ve MUHASEBE bolumlerinde calisan personelin isimlerini ve 
  bolumlerini, once bolum, sonra isim sıralı olarak listeleyiniz
------------------------------------------------------------------------------*/ 
-- P: personel tablo
-- B: bolumler tablo
select b.personel_isim, a.bolum_isim  from bolumler   as a 
 left join personel as b 
on a.bolum_id=b.bolum_id where bolum_isim in('MUHASEBE','SATIS')  
order by a.bolum_isim desc ,b.personel_isim desc ;

select p.personel_isim, B.bolum_isim
from bolumler as B
join personel as P
on B.bolum_id=p.bolum_id
where bolum_isim in ('satis','muhasebe')
order by B.bolum_isim desc ,P.personel_isim desc;

/* -----------------------------------------------------------------------------
  SORU2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin isimlerini,  
  bolumlerini  isim sıralı olarak listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
select personel_isim, bolum_isim
from bolumler as  B
left join personel as P
on B.bolum_id=p.bolum_id
where B.bolum_id in(30,40,50)
order by B.bolum_isim;


/* -----------------------------------------------------------------------------
  SORU3: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini ve 
  maaslarini, bolum ters ve maas sirali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
select personel_isim, bolum_isim ,maas
from bolumler as  B
left join personel as P
on B.bolum_id=p.bolum_id
order by B.bolum_isim desc,maas;

/* -----------------------------------------------------------------------------
  SORU4: SATIS ve MUDURLUK bolumlerinde calisan personelin maaslari 2000'den 
  buyuk olanlarinin isim,bolum ve maas bilgilerini bolume ve isme gore
  siralayarak listeleyiniz.
------------------------------------------------------------------------------*/   
select personel_isim, bolum_isim ,maas
from bolumler as B
left join personel as P
on B.bolum_id=p.bolum_id
where bolum_isim in('satis','mudurluk') and maas>2000
order by B.bolum_isim ,personel_isim;


/* -----------------------------------------------------------------------------
  SORU5: MUDUR'u Harun veya Emine olan personelin bolumlerini,isimlerini,  
  maaslarini ve ayrica MUDUR isimlerini 
  (emine kimin müdürüyse onun satirinda yazsin) 

------------------------------------------------------------------------------*/   
select bolum_isim,personel_isim , maas,
(select personel_isim from personel where P.mudur_id=personel_id) as mudur
from bolumler as B 
right join personel as P
on B.bolum_id=p.bolum_id
where P.mudur_id in (1222,1333);









