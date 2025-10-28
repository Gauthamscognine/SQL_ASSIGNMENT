create database profiler;
go
use profiler ;
go
select * from sys.tables;
select* from customers;
select * from orders;

-- Customers table
CREATE TABLE Customers (
    CustomerID INT,
    CustomerName NVARCHAR(50),
    City NVARCHAR(50)
);
GO

-- Orders table
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderAmount DECIMAL(10,2)
);
GO

;WITH Numbers AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO Orders (OrderID, CustomerID, OrderAmount)
SE+LECT
    ABS(CHECKSUM(NEWID())) % 1000000,
    ABS(CHECKSUM(NEWID())) % 1000000,
    CAST((ABS(CHECKSUM(NEWID())) % 10000) / 1.0 AS DECIMAL(10,2))
FROM Numbers
WHERE rn <= 1000000;   -- 10 lakh rows
GO



INSERT INTO Orders (OrderID, CustomerID, OrderAmount)
SELECT
    ABS(CHECKSUM(NEWID())) % 1000000,    -- Random OrderID
    ABS(CHECKSUM(NEWID())) % 1000000,    -- Random CustomerID
    CAST((ABS(CHECKSUM(NEWID())) % 10000) / 1.0 AS DECIMAL(10,2))
FROM sys.all_objects a
CROSS JOIN sys.all_objects b
WHERE ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) <= 1000000;
GO

select * from customers where customerid  = 527277;

select * from customers order by customerid;
CREATE CLUSTERED INDEX Ix_Customers_CustomerID
ON Customers(CustomerID);

select * from customers order by customerid;


