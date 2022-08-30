CREATE TABLE my_companies( 
	company_id CHAR(3),
	company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');


CREATE TABLE orders( 
	company_id CHAR(3),  
	order_id CHAR(3), 
	order_date DATE
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');

/*
    JOINS
 
 1) INNER JOIN : Ortak(Common) datayi verir.
 
 2) LEFT JOIN  : Birinci table'in tum datasini verir.
 
 3) RIGHT JOIN : ikinci table'in tum datasini verir.
 
 4) FULL JOIN  : iki table'in da tum datasini verir.
 
 5) SELF JOIN  : Tek table uzerinde calisirken iki table varmis gibi calisilir.
 
*/

SELECT * FROM orders;
SELECT * FROM my_companies;


--1) INNER JOIN

--TASK : Ortak companyler için company_name, order_id ve order_date değerlerini çağırın.
SELECT mc.company_name,o.order_id,o.order_date
FROM my_companies mc INNER JOIN orders o
ON mc.company_id = o.company_id;




--2) LEFT JOIN

--TASK : my_companies table'ındaki companyler için order_id ve order_date değerlerini çağırın.
SELECT mc.company_name,o.order_id,o.order_date
FROM my_companies mc LEFT JOIN orders o
ON mc.company_id = o.company_id;




--3) RIGHT JOIN

--TASK : Orders table'ındaki company'ler için company_name, company_id ve order_date değerlerini çağırın.
SELECT mc.company_name,o.company_id,o.order_date
FROM my_companies mc RIGHT JOIN orders o
ON mc.company_id = o.company_id;




--4) FULL JOIN

--TASK : İki table'dan da company_name, order_id ve order_date değerlerini çağırın.
SELECT mc.company_name,o.order_id,o.order_date
FROM orders o FULL JOIN my_companies mc
ON mc.company_id = o.company_id;



--5) SELF JOIN

CREATE TABLE workers(  
	id CHAR(2), 
	name VARCHAR(20), 
	title VARCHAR(60), 
	manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

SELECT * FROM workers;

--TASK : workers tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.
SELECT employee.name, manager.name 
FROM workers employee FULL JOIN workers manager -- tek tabloda iki farkli tablo var gibi 
ON employee.manager_id = manager.id;

