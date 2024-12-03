        -- Creating table and inserting values:

CREATE TABLE EmployeeExample (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2));

INSERT INTO EmployeeExample (Name, Department, Salary)
VALUES ('Kavs', 'HR', 55000), ('Sree', 'IT', 75000) , ('Ram','ACC',50000);

Select * From EmployeeExample;


          --Stored Procedure:

create procedure getname @Name VARCHAR(50)
As
select * FROM EmployeeExample
WHERE Name= @Name;

EXEC getname @Name = 'sree';

           --Trigger:

ALTER TABLE EmployeeExample
ADD SalaryStatus  varchar(50);

CREATE TRIGGER trigger_InsertMsg
ON EmployeeExample
AFTER UPDATE
AS
BEGIN
    UPDATE EmployeeExample
    SET SalaryStatus = 'YES'
    WHERE EmployeeID IN (SELECT EmployeeID FROM INSERTED);
END;


UPDATE EmployeeExample
SET Salary = Salary + 5000
WHERE EmployeeID = 1;

SELECT * FROM EmployeeExample;

      --Cursor


DECLARE EmployeCursor CURSOR SCROLL FOR
SELECT Name, Salary
FROM EmployeeExample;

OPEN EmployeCursor;

FETCH FIRST FROM EmployeCursor;
     --UDF





















