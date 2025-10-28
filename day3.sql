--select datalength(null) as uppertext;
--use practice;
--select * from emp;
--select datalength(bday) from emp ;
--select * from emp;

--SELECT COALESCE(fname , lname) from emp;

-- Output: Hello
insert into emp values(8,'anjala' ,'manga' , getdate() ,1888 );
SELECT FLOOR(CAST(GETDATE() AS FLOAT)); -- Works

--select isnumeric();

select * from emp;
select count_big(fname) from emp;