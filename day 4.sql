
select * from emp;

SELECT fname, empid,
       ROW_NUMBER() OVER (PARTITION BY empid ORDER BY bday) AS RowNum
FROM emp;
use practice;
CREATE TABLE Trip2 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Trip1 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    DepartmentID INT,  -- Foreign Key
    HireDate DATE NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Trip2(DepartmentID)
);
INSERT INTO Trip2 (DepartmentID, DepartmentName)
VALUES 
(1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO Trip1 (EmployeeID, EmployeeName, DepartmentID, HireDate)
VALUES
(101, 'Alice', 1, '2020-01-10'),
(102, 'Bob',   1, '2021-03-05'),
(103, 'Carol', 2, '2019-06-20'),
(104, 'David', 2, '2022-01-15'),
(105, 'Eva',   3, '2018-07-30');
select * from trip2;
select * from trip1;


SELECT 
    t1.EmployeeName,
    t2.DepartmentName AS Department,
    ROW_NUMBER() OVER (
        PARTITION BY t2.DepartmentName 
        ORDER BY t1.HireDate
    ) AS RowNum
FROM Trip1 t1
JOIN Trip2 t2 ON t1.DepartmentID = t2.DepartmentID;


SELECT DATENAME(hour, GETDATE());  -- Returns: 'October'
SELECT DATEpart(hour, GETDATE()); -- Returns: 'Tuesday'

SELECT DATEADD(day, 5, GETDATE());

-- Subtract 2 months
SELECT DATEADD(month, -2, GETDATE());