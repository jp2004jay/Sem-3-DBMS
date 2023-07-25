-- CREATE DATABASE
CREATE DATABASE Worker_Info_ROLLNO
use Worker_Info

--Insert Procedure For Department Table With Executed
Create Procedure spDepartment_Insert
	@DepartmentId int,
	@DepartmentName varchar(100)
As
Begin
	Insert into Department(DepartmentID, DepartmentName)
	values (@DepartmentId, @DepartmentName)
End

Exec spDepartment_Insert 1, 'Admin'
Exec spDepartment_Insert 2, 'IT'
Exec spDepartment_Insert 3, 'HR'
Exec spDepartment_Insert 4, 'Account'

Select * from Department

--Insert Procedure For Designation Table With Executed
Create Procedure spDesignation_Insert
	@DesignationId int,
	@DesignationName varchar(100)
As
Begin
	Insert into Designation(DesignationID, DesignationName)
	values (@DesignationId, @DesignationName)
End

Exec spDesignation_Insert 11, 'Jobber'
Exec spDesignation_Insert 12, 'Welder'
Exec spDesignation_Insert 13, 'Clerk'
Exec spDesignation_Insert 14, 'Manager'
Exec spDesignation_Insert 15, 'CEO'

Select * from Designation

--Insert Procedure For Person Table With Executed
Create Procedure spPerson_Insert
	@FirstName varchar(100),
	@LastName varchar(100),
	@Salary Decimal(8,2),
	@JoiningDate Datetime,
	@DepartmentId int,
	@DesignationId int
AS
Begin
	Insert into PersonNew(FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID)
	values (@FirstName, @LastName, @Salary, @JoiningDate, @DepartmentId, @DesignationId)
END

Exec spPerson_Insert 'Rahul', 'Anshu', 56000, '01-01-1990', 1, 12
Exec spPerson_Insert 'Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11
Exec spPerson_Insert 'Bhavin', 'Kamani', 25000, '1991-05-14', null, 11
Exec spPerson_Insert 'Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13
Exec spPerson_Insert 'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15
Exec spPerson_Insert 'Priya', 'Mehta', 25000, '1990-10-18', 2, null
Exec spPerson_Insert 'Neha', 'Trivedi', 18000, '2014-02-20', 3, 15

select * from PersonNew

-- Personal Use Only
-- CREATE TABLE Department (Only For Personal Use)
CREATE TABLE Department(
DepartmentID Int Primary Key,
DepartmentName Varchar(100)	Not Null Unique)

-- CREATE TABLE Designation (Only For Personal Use)
CREATE TABLE Designation(
DesignationID Int Primary Key,
DesignationName	Varchar(100) Not Null Unique)

-- CREATE TABLE Person (Only For Personal Use)
CREATE TABLE Person(
WorkerID Int IDENTITY(101,1) PRIMARY KEY,
FirstName Varchar(100) Not Null,
LastName Varchar(100) Not Null,
Salary Decimal(8,2)	Not Null,
JoiningDate	Datetime Not Null,	
DepartmentID Int Null FOREIGN KEY REFERENCES Department(DepartmentID),
DesignationID Int Null FOREIGN KEY REFERENCES Designation(DesignationID))