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