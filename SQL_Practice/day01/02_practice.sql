CREATE TABLE workers(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);
INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

Select * From workers;

--TASK-1 : Tabloya company_industry isminde sütun ekleyiniz
Alter Table workers
Add Column company_industry varchar(30);

--TASK-2 : TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
Alter Table workers
Add Column worker_address varchar(30) default 'Miami, FL, USA';

--TASK-3 : tablodaki worker_address sütununu siliniz
Alter Table workers
Drop Column worker_address;

--TASK-4 : Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
Alter Table workers
Rename Column company_industry To company_profession;

--TASK-5 : Tablonun ismini employees olarak değişitiriniz.
Alter Table workers Rename To employees;
Select * From employees;
