create database const;

use const;

CREATE TABLE Student (
    id INT NOT NULL,                  -- NOT NULL constraint
    email VARCHAR(100) UNIQUE,       -- UNIQUE constraint
    age INT CHECK (Age >= 18),       -- CHECK constraint
    country VARCHAR(50) DEFAULT 'India' -- DEFAULT constraint
);

select * from sys.tables;

insert into Student(id,email , age , country) values(1,'gautam@gmail.com' , 20 , 'india');
select * from Student;

update Student set age=19 where id=1;
select * from Student;


delete from Student where id = 2;

insert into Student(id,email , age) values(2,'vishal@cognine.com' , 20 );
select * from Student;