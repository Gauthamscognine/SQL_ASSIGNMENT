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

select dbo.getage('2004-09-10') as age;

