use practice;
select * from sys.databases;
select * from chintu;
exec sp_spaceused 'chintu';
CREATE TABLE indexthing (
    EmpID INT,
    EmpName VARCHAR(50),
    Dept VARCHAR(20),
    Salary INt
);
GO

INSERT INTO indexthing VALUES
(101, 'Alice', 'HR', 50000),
(102, 'Bob', 'IT', 60000),
(103, 'Charlie', 'Sales', 55000),
(104, 'David', 'IT', 62000),
(105, 'Eve', 'HR', 53000);
EXEC sp_spaceused 'indexthing';

CREATE CLUSTERED INDEX IX_indexheap
ON indexthing(EmpID);

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT * 
FROM indexthing
WHERE EmpID = 103;


SELECT * FROM indexthing;

CREATE NONCLUSTERED INDEX IX_indexthing_Dept
ON indexthing(Dept);



alter table indexthing add constraint ix_primarykey_empid primary key on indexthing(EmpID);

GO
SELECT * 
FROM indexthing
WHERE Dept = 'IT';
select dept from indexthing where dept = 'it';
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
SELECT *
FROM indexthing WITH (INDEX(IX_indexthing_Dept))
WHERE Dept = 'IT';

GO

GO

--------------------------------------------------------------------------------------------------------
create sequence sequencething
as int 
start with 106
increment by 1
select * from indexthing;

alter table indexthing add constraint se_empid default next value for dbo.sequencething for empid;
insert into indexthing(empname,dept , salary) values('rishika','IT',20000);

insert into indexthing(empname,dept , salary) values('vishal','delivery',20000);


select * from indexthing;


SELECT name, is_cached, cache_size, current_value
FROM sys.sequences
WHERE name = 'sequencething';

----------------------------------------------------------------------------------------------------------------------


