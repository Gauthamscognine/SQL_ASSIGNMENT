create database transac
use transac;

select * from sys.databases;

CREATE TABLE emp (
    eid INT PRIMARY KEY,
    name VARCHAR(100),
    sal DECIMAL(10, 2)
);

BEGIN TRANSACTION;

INSERT INTO emp (eid, name, sal)
VALUES (1, 'John', 50000.00);

INSERT INTO emp (eid , name , sal)
VALUES (2, 'Jane', 60000.00);

SAVE TRANSACTION SavePoint1;

INSERT INTO emp (eid , name , sal)
VALUES (3, 'Jim', 55000.00);

select * from emp;

rollback transaction SavePoint1;

COMMIT TRANSACTION;

SELECT * FROM emp;