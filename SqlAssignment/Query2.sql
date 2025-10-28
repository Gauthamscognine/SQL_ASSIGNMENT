use joins;

select * from sys.tables;
select * from emp;
--Query 1
select sal from emp order by sal desc  offset  1 rows fetch next 1 rows only;