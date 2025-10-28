use practice;
select * from sys.tables;
select * from chintu;

select * from sys.tables where name = 'chintu';

exec sp_help 'chintu';
alter table chintu drop column lname;
insert into chintu values(1,'gautam',getdate(),100);
insert into chintu values(10,'gautami',getdate(),100);
insert into chintu values(5,'gautamis',getdate(),100);

alter table chintu alter column empid int not null;
delete from chintu where empid = 1;
alter table chintu add constraint pkempid primary key (empid);


ALTER TABLE chintu ADD CONSTRAINT CHECKCONST CHECK (salary);



INSERT INTO chintu VALUES (2, 'gopal', GETDATE(), 110);
INSERT INTO chintu VALUES (3, 'ganesh', GETDATE(), 120);
INSERT INTO chintu VALUES (4, 'geeta', GETDATE(), 130);
INSERT INTO chintu VALUES (6, 'girish', GETDATE(), 100);
INSERT INTO chintu VALUES (7, 'govind', GETDATE(), 150);
INSERT INTO chintu VALUES (8, 'gargi', GETDATE(), 140);
INSERT INTO chintu VALUES (9, 'gauri', GETDATE(), 105);
INSERT INTO chintu VALUES (11, 'gita', GETDATE(), 160);
INSERT INTO chintu VALUES (12, 'gokul', GETDATE(), 100);
INSERT INTO chintu VALUES (13, 'gagan', GETDATE(), 115);
INSERT INTO chintu VALUES (14, 'guneet', GETDATE(), 125);
INSERT INTO chintu VALUES (15, 'girishma', GETDATE(), 135);
INSERT INTO chintu VALUES (16, 'gaya', GETDATE(), 100);
INSERT INTO chintu VALUES (17, 'gaurav', GETDATE(), 150);
INSERT INTO chintu VALUES (18, 'gulzar', GETDATE(), 155);



select top 2 * from chintu union  select * from chintu order by empid offset 5 rows  fetch next 10 rows only;

SELECT * FROM (
    SELECT TOP 2 * FROM chintu ORDER BY empid
) AS part1

UNION

SELECT * FROM (
    SELECT * FROM chintu
    ORDER BY empid
    OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY
) AS part2;


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    FOREIGN KEY (customer_name) REFERENCES Orders(customer_name)
);

drop table Payments;





SELECT  max(fname)
FROM emp
GROUP BY empid;

