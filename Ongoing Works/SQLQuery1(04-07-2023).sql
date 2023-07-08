use Worker_Info

--1
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

--1
Create Procedure spDepartment_Insert
	@DepartmentId int,
	@DepartmentName varchar(100)
As
Begin
	Insert into Department(DepartmentID, DepartmentName)
	values (@DepartmentId, @DepartmentName)
End

--1
Create Procedure spDesignation_Insert
	@DesignationId int,
	@DesignationName varchar(100)
As
Begin
	Insert into Designation(DesignationID, DesignationName)
	values (@DesignationId, @DesignationName)
End

Exec spDepartment_Insert 1, 'Admin'
Exec spDepartment_Insert 2, 'IT'
Exec spDepartment_Insert 3, 'HR'
Exec spDepartment_Insert 4, 'Account'

Select * from Department

Exec spDesignation_Insert 11, 'Jobber'
Exec spDesignation_Insert 12, 'Welder'
Exec spDesignation_Insert 13, 'Clerk'
Exec spDesignation_Insert 14, 'Manager'
Exec spDesignation_Insert 15, 'CEO'

Select * from Designation

Exec spPerson_Insert 'Rahul', 'Anshu', 56000, '01-01-1990', 1, 12
Exec spPerson_Insert 'Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11
Exec spPerson_Insert 'Bhavin', 'Kamani', 25000, '1991-05-14', null, 11
Exec spPerson_Insert 'Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13
Exec spPerson_Insert 'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15
Exec spPerson_Insert 'Priya', 'Mehta', 25000, '1990-10-18', 2, null
Exec spPerson_Insert 'Neha', 'Trivedi', 18000, '2014-02-20', 3, 15

select * from PersonNew


