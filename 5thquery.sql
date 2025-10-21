--QUERY 1
create function dbo.getage
(
	@bday date
)
returns int
as begin 
declare @age int;
set @age  = datediff(year , @bday , getdate());
if((month(@bday) > month(getdate())) or (month(@bday)= month(getdate()) and day(@bday) > day(getdate())))
	begin 
		set @age  = @age-1;
	end
return @age;

end;

--------------------------------------------------------------------
--QUERY 2
create function getnumeric(@input varchar(max))
returns varchar(max)
as 
begin
declare @i int =1 , @len int  = len(@input) , @output varchar(max) = ' ';
while(@i<=@len)
	begin 
		if(substring(@input,@i,1) like '[0-9]')
		begin set @output +=substring(@input,@i,1);
		end
	set @i = @i +1;
end 
return @output
end

select dbo.getnumeric('chintu23chintu56') as ans;
-------------------------------------------------------------------------------
--QUERY 3
CREATE TABLE testing (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),

    ErrorColumn AS CONVERT(INT, 'abc')  
);
-----------------------------------------------------------------------------
--QUERY 4
-------------------------------------------------------------------------------------------------------------------
declare @y int = 2017;
with calendar as(
select cast(concat(@y,'-01-01') as date) as calendardate
	union all 
select dateadd(day,1,calendardate) from calendar where calendardate < eomonth(concat(@y,'-12-01')) 
)
select 
	calendardate as [date],
	datepart(dayofyear,calendardate),
	datepart(week,calendardate),
	datepart(weekday,calendardate),
	datepart(month,calendardate),
	datepart(day,calendardate)
	from calendar
option(maxrecursion 366);
---------------------------------------------------------------
--QUERY5
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
DECLARE @InputEmpID INT = 4;

with ans as(
select e.empid , e.ename , e.managerid ,m.ename as managername , 1 as heirachi from cognine e 
LEFT JOIN cognine m ON e.managerid = m.empid where e.empid = @InputEmpID 
	union all 
select cc.empid , cc.ename ,  cc.managerid,ccc.ename ,  heirachi +1 from cognine cc 
 join ans ccc on cc.empid = ccc.managerid
)
select * from ans
