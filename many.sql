use practice;

select * from emp;
select * from chintu;
select * from sys.tables;
drop table chintu;

----------------QUERY 1
select * into chintu from emp;
truncate table chintu;

-------------QUERY 2

if EXISTS(select * from sys.tables where name  = 'HELLO')
 begin
	select * from HELLO;
end
else
begin 
	create table HELLO(cid int);
end

------------------------------------------------
SELECT * from sys.tables;
--to get all the tables with the same column name .
select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = 'cid';
------------------------------------------------------------INDENTITY
drop table HELLO;

CREATE TABLE hello (
cid int identity(1,10),
name varchar(3),
);

select * from hello;
insert into hello values('gau');
insert into hello values('hel');

set identity_insert hello on;
insert into hello(cid , name )values(12,'cnc');
set identity_insert hello off;

drop table if exists hello;
	

----------------------------------COMPUTE COLUMNS
create table computec(pid int , buy int , sell int , profit as (sell - buy));

drop table if exists computec;
select * from computec;
insert into computec values(1,100,200);
--------------------------------------------

select * from emp;

INSERT INTO emp(empid, fname, lname, bday, salary)
VALUES
(3, 'Anjali', 'Sharma', '1998-03-25', 25000.00),
(4, 'Rohan',  'Verma',  '1995-08-17', 18000.00),
(5, 'Meera',  'Joshi',  '1990-01-10', 30000.00),
(6, 'Sahil',  'Patel',  '1992-12-02', 22000.00),
(7, 'Priya',  'Nair',   '1999-07-19', 17000.00);
--3rd highest and lowest sal
select  salary from emp order by salary asc offset 2 rows fetch next 1 row only;
--top n records from a table 
select top 3 * from emp ;




select * from emp;
