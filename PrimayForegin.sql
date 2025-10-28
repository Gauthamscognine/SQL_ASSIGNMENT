use practice;
select * from sys.tables;
EXEC sp_help 'employees';

 ------- JOINING TWWO TABLES WITHOUT A PRIMARY KEY .
create table t1(t1id int  , t1name varchar(100) ,  t2id int );

create table t2 (t2id int , t2name varchar(100));

INSERT INTO t1 VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 10),
(4, 'David', NULL); -- No department assigned

-- Departments table
INSERT INTO t2 VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance');
select * from t2;

select e.t1name , t.t2name from t1 e join t2 t on e.t2id  = t.t2id;

select t1id ,  t1name from t1 where t2id is null ;