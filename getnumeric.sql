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




DROP FUNCTION  dbo.getnumeric;



SELECT dbo.getage('2000-9-10') AS Age;

