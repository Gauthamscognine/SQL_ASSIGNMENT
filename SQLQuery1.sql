CREATE DATABASE practice;
GO

USE practice;
GO

CREATE TABLE employees (
    empid INT PRIMARY KEY,
    fname NVARCHAR(50),
    lname NVARCHAR(50),
    bday DATE,
    salary DECIMAL(18,2)
);
GO

ALTER TABLE employees
ADD email NVARCHAR(20);
GO

select * from employees;

EXEC sp_rename 'employees', 'emp';
select * from emp;

insert into emp(empid,fname,lname,bday,salary ) values(1,'gautam','kedia',getdate(),20000);

select * from emp;

update emp set email = 'chintu@gmail.com' where empid = 1;
select * from emp;

delete from emp where empid = 2;

alter table emp drop column email;

select  * from emp;


create login gautham with password  = 'gautamkedia';
create user gautamuser for login gautham;

grant select on emp to gautamuser;

revoke select on emp from gautamuser;
GO
USE PRACTICE;
GO

REVOKE SELECT ON emp FROM gautamuser;

select * from emp;


USE practice;
GO

DENY SELECT ON emp TO gautamuser;
select * from emp;

