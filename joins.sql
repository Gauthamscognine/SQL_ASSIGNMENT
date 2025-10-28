create database joins;

use joins;
go

CREATE TABLE dept(
    did INT PRIMARY KEY,
    dname NVARCHAR(50),
    location NVARCHAR(50)
);

CREATE TABLE emp (
    eid INT PRIMARY KEY,
    EName NVARCHAR(50),
    DID INT NULL,            -- some employees may not belong to any department
    Sal DECIMAL(10,2),
    MID INT NULL          -- for self-join practice
);

INSERT INTO Dept (DID, DName, Location)
VALUES 
(1, 'HR', 'New York'),
(2, 'IT', 'San Francisco'),
(3, 'Finance', 'Chicago'),
(4, 'Marketing', 'Boston');
INSERT INTO Emp(EID, EName, DID, Sal, MID)
VALUES
(101, 'Alice', 1, 60000, NULL),        -- HR Manager
(102, 'Bob', 1, 45000, 101),
(103, 'Charlie', 2, 75000, NULL),      -- IT Manager
(104, 'David', 2, 55000, 103),
(105, 'Eva', 2, 50000, 103),
(106, 'Frank', 3, 80000, NULL),        -- Finance Manager
(107, 'Grace', 4, 47000, NULL),        -- Marketing Manager
(108, 'Helen', NULL, 40000, NULL);     -- Not assigned to any department



select e.eid , e.ename , d.did , d.dname from emp e  join dept d on e.did = d.did ;---inner join based upon the on condition.
--helen didnt been displayed beacuse her dept id doesnt match , dept id in departments table.

select e.eid , e.ename , d.did , d.dname from emp e  left join dept d on e.did = d.did where e.did in(1,2) or e.did is null;
--left join , only 1 and 2 and helen came into picture beacuse left is all and right is only common

select e.eid , e.ename , d.did , d.dname from emp e  full outer join dept d on e.did = d.did;
insert into dept values(5,'delivery' , 'hyderabad');    


select e.eid , e.ename , e1.mid from emp e join emp e1 on e.eid = e1.eid;               



select * from emp;
select * from dept;
select d.did , d.dname from dept d where (select count(*) from emp e where e.did = d.did) < 5


select * from emp;
select * from dept;
