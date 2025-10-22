CREATE TABLE testing (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),

    ErrorColumn AS CONVERT(INT, 'abc')  
);
select * from testing;
select Errorcolumn from testing;
select ID from testing;