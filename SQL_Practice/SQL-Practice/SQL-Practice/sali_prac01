create table calisanlar
(
id char (4),
isim varchar(50),
maas int,
CONSTRAINT id_pk PRIMARY KEY(id)
);

INSERT INTO CALISANLAR VALUES ('1001', 'Ahmet Aslan',7000);
INSERT INTO CALISANLAR VALUES ('1002', 'Mehmet Yılmaz',12000);
INSERT INTO CALISANLAR VALUES ('1003', 'Meryem',7215);
INSERT INTO CALISANLAR VALUES ('1004', 'Veli Han',5000);

create table aileler
(
id char(4),
cocuk_sayis int,
ek_gelir int,
 FOREIGN KEY (id) references calisanlar (id)
);

insert into aileler values ('1001',4,2000);
insert into aileler values ('1002',2,1500);
insert into aileler values ('1003',1,2200);
insert into aileler values ('1004',3,2400);

select * from aileler;
select * from calisanlar;

 -- 2) Veli Han'ın maaşına %20 zam yapınız.
 update calisanlar  set maas=maas*1.2 where isim='veli han';
select * from aileler;
select * from calisanlar;

 -- 3) Maaşı ortalamanın altında olanlara %20 zam yapınız.  
update calisanlar set maas=maas*1.2 where  maas<(select avg(maas) from calisanlar);


-- 4) calisanların isim ve cocuk_sayisi'ni listeyen sorguyu yazınız.
select c.isim, a.cocuk_sayis from aileler as a left join calisanlar as c on a.id=c.id;
        
-- 5) calisanlar' ın  isim ve toplam_gelir'lerini gösteren bir sorgu yazınız. 
-- toplam_gelir = calisanlar.maas + aileler.ek_gelir 
select c.isim, c.maas+a.ek_gelir as toplam_gelir  from aileler as a left join calisanlar as c on a.id=c.id;

-- 6) eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın  maaşına ek %10 aile yardım zammı yapınız. 
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
  select isim,  (c.maas+a.ek_gelir)/(a.cocuk_sayis+2) kisibasigelir  from aileler as a 
  left join calisanlar as c on a.id=c.id;-- kisi basi dusen gelir

   update calisanlar set maas = maas*1.1
   where  (select (calisanlar.maas+aileler.ek_gelir)/(aileler.cocuk_sayis+2)  
		   from aileler where calisanlar.id=aileler.id)<20000; 

   select * from aileler;
select * from calisanlar;
