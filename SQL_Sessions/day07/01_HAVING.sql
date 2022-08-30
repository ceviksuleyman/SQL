CREATE TABLE workers(
  	id CHAR(9),	
	name VARCHAR(50), 
	state VARCHAR(50),
	salary SMALLINT,
	company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

--TASK-1 : Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.
SELECT name,Sum(salary) As "Total Salary" 
FROM workers
Group By name
Having Sum(salary)>2500; --> Group BY ardindan Where kullanilmaz. !


--TASK-2 : Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.
SELECT state, Count(state) As "Number Of Employees"
FROM workers
Group By state
Having Count(state)>1; -- Having, Group By ardindan filtreleme icin kullanilir.


--TASK-3 : Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
SELECT state, Max(salary) As "Max Salary"
FROM workers
Group By state
Having Max(salary)<3000;


--TASK-4 : Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
SELECT company, Min(salary) As "Min Salary"
FROM workers
Group By company
Having Min(Salary)>2000;


--TASK-5 : Tekrarsız isimleri çağırın.
SELECT Distinct name 
FROM workers; -->DISTINCT => Cagirilan terimlerden tekrarli olanlarin sadece ilkini alir.


--TASK-6 : Name değerlerini company kelime uzunluklarına göre sıralayın.
SELECT name,company 
FROM workers
Order By Length(company);

