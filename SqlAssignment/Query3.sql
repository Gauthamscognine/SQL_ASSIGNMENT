use joins;

select * from sys.tables;
select * from emp;

select max(e.sal) , d.dname from emp e join dept d on e.did = d.did group by dname;
