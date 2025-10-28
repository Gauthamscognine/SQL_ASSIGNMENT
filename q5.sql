use practice;
create table cognine(
empid int primary key,
ename nvarchar(100),
managerid int ,
foreign key(managerid) references cognine(empid)
);
select * from cognine;

INSERT INTO cognine (empID, ename, managerID) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Carol', 2),
(4, 'Dave', 2),
(5, 'Eve', 3);

select cc.empid , cc.ename , ccc.ename as managername from cognine cc 
left join cognine ccc on cc.managerid = ccc.empid




select * from cognine;
declare @inputId int=4;
With empHierarchy as
(
    select empid,ename,ManagerID,1 as HierarchyLevel
    from cognine where EmpID=@inputId
 
    Union all
 
    select e.EmpID,e.EName,e.ManagerID,eh.HierarchyLevel+1
    from cognine e join empHierarchy eh on e.EmpID=eh.ManagerID
)
 
select eh.empID,eh.eName,e.EName as ManagerName,eh.HierarchyLevel from empHierarchy eh 
left join cognine e on eh.ManagerID=e.EmpID order by eh.HierarchyLevel;
 
select * from empHierarchy;