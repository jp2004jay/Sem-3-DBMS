--1
CREATE FUNCTION printHelloWorld()
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @NAME VARCHAR(50)
	SET @NAME = 'HELLO WORLD'
	RETURN @NAME
END

SELECT DBO.printHelloWorld() as HI

--2
CREATE FUNCTION ADDITION(@NUM1 INT, @NUM2 INT)
RETURNS INT
AS 
BEGIN 
	RETURN @NUM1 + @NUM2
END

SELECT DBO.ADDITION(4, 9) AS [SUM]

--3
CREATE FUNCTION cubeFind(@NUM INT)
RETURNS INT
AS
BEGIN
	RETURN @NUM*@NUM*@NUM
END

SELECT DBO.cubeFind(3) as [CUBE]

--4
CREATE FUNCTION oddOrEven(@NUM INT)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @NAME VARCHAR(50)
	IF @NUM%2 = 0
		SET @NAME = 'EVEN'
	ELSE
		SET @NAME = 'ODD'
	RETURN @NAME
END


SELECT DBO.oddOrEven(5) AS [ODD & EVEN]
SELECT DBO.oddOrEven(10) AS [ODD & EVEN]

--5
CREATE FUNCTION compare(@A INT, @B INT)
RETURNS VARCHAR(50)
AS
BEGIN 
	DECLARE @NAME VARCHAR(50)
	IF @A = @B
		SET @NAME = 'EQUAL NUMBER'
	ELSE IF @A > @B
		SET @NAME = 'A IS GREATER'
	ELSE
		SET @NAME = 'B IS GREATER'
	RETURN @NAME
END

--6
CREATE FUNCTION print1toN(@NUM INT)
RETURNS VARCHAR(500)
AS
BEGIN
	DECLARE @RESULT VARCHAR(500),
			@I INT
	SET @I = 1
	SET @RESULT = ''
	WHILE @I <= @NUM
	BEGIN
		SET @RESULT = @RESULT + CAST(@I AS VARCHAR(10)) + ', '
		SET @I = @I+1;
	END
	RETURN @RESULT
END

SELECT DBO.print1toN(15) AS [LOOP]
SELECT DBO.print1toN(100) AS [LOOP]

--7
CREATE FUNCTION SumOfEven()
RETURNS INT
AS
BEGIN
	DECLARE @RESULT INT,
			@I INT
	SET @RESULT = 0
	SET @I = 1
	WHILE @I <= 20
	BEGIN
		IF @I%2 = 0
			SET @RESULT = @RESULT + @I
		ELSE
			SET @RESULT = @RESULT + 0
		SET @I = @I+1;
	END
	RETURN @RESULT
END

SELECT DBO.SumOfEven() as [SUM OF EVEN]

--8
CREATE FUNCTION PRIME(@NUM INT)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @isPrime VARCHAR(50) = 'NUMBER IS PRIME'
	DECLARE @I INT = 2;
	WHILE @I < @NUM
		BEGIN
			IF @NUM % @I = 0
				SET @isPrime = 'NUMBER IS NOT PRIME'
			SET @I = @I + 1
		END
	RETURN @isPrime
END

SELECT DBO.PRIME(5) AS [PRIME OF NOT]
SELECT DBO.PRIME(10) AS [PRIME OF NOT]

--9
CREATE FUNCTION DATEDIFFERENCE(@DATE1 DATE, @DATE2 DATE)
RETURNS INT
AS
BEGIN
	RETURN DATEDIFF(DAY, @DATE1, @DATE2)
END

SELECT DBO.DATEDIFFERENCE('20230810','20230805') AS [DATE DIFF]
SELECT DBO.DATEDIFFERENCE('20230801','20230805') AS [DATE DIFF]
SELECT DBO.DATEDIFFERENCE('20200810','20230805') AS [DATE DIFF]

--10
CREATE FUNCTION GetTotalDaysInMonth(@year INT,@month INT)
RETURNS INT
AS
BEGIN
    DECLARE @totalDays INT

    SET @totalDays = CASE
        WHEN @month = 2 THEN
            CASE
                WHEN (@year % 4 = 0 AND @year % 100 != 0) OR (@year % 400 = 0) THEN 29
                ELSE 28
            END
        WHEN @month IN (4, 6, 9, 11) THEN 30
        ELSE 31
    END
    RETURN @totalDays
END

SELECT DBO.GetTotalDaysInMonth(2021, 3) AS [DAYS]

--11
Create Function FirstNameStartWithB()
Returns Table
As
Return
	Select * From PersonNew
	Where FirstName like 'B%'
End

select * from DBO.FirstNameStartWithB()

--12
Create Function uniqueFirstName()
Returns Table
As
Return
	Select Distinct FirstName From PersonNew
End

select * from DBO.uniqueFirstName()

--13
Create Function DepartmentIdWithDetails(@DepartmentID int)
Returns Table
As
Return
	Select P.WorkerID, 
			P.FirstName, 
			P.LastName,
			P.Salary,
			D.DepartmentName
	From PersonNew P
	Inner Join Department D
	on P.DepartmentID = D.DepartmentID
	where D.DepartmentID = @DepartmentID
End

Select * from DBO.DepartmentIdWithDetails(2)