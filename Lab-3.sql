--Create Procedure that show detail of first 3 persons.
Create Procedure spTop3PersonDetail
As
Begin
	Select Top(3) * From PersonNew 
End

exec spTop3PersonDetail

--Create Procedure that takes department dame as input and returns a table with all workers working in that department.
Create Procedure spDepartmentNameReturnAll
	@DepartmentName varchar(100)
As
Begin
	Select 
		P.WorkerID,
		P.FirstName,
		P.LastName,
		P.Salary,
		P.JoiningDate,
		Dep.DepartmentName
	From PersonNew P
	Left Outer Join Department Dep
	on P.DepartmentID = Dep.DepartmentID
	Where DepartmentName = @DepartmentName
End

exec spDepartmentNameReturnAll 'IT'

--Create Procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name.
Create Procedure spDepartmentNameAndDesignationNameReturnAll
	@DepartmentName varchar(100),
	@DesignationName varchar(100)
As
Begin
	Select 
		P.FirstName,
		P.Salary,
		P.JoiningDate,
		Dep.DepartmentName
	From PersonNew P
	Left Outer Join Department Dep
	on P.DepartmentID = Dep.DepartmentID
	Left Outer join Designation Desi
	on P.DesignationID = Desi.DesignationID
	Where DepartmentName = @DepartmentName and
			DesignationName = @DesignationName
End

exec spDepartmentNameAndDesignationNameReturnAll 'admin', 'welder'

--Create Procedure that takes first name as an input parameter and display all the details of the worker with their department & designation name.
Create Procedure spSelectFromName
	@FirstName varchar(100)
As
Begin
	Select 
		P.FirstName,
		P.LastName,
		P.Salary,
		P.JoiningDate,
		Dep.DepartmentName,
		Desi.DesignationName
	From PersonNew P
	Left Outer Join Department Dep
	on P.DepartmentID = Dep.DepartmentID
	Left Outer join Designation Desi
	on P.DesignationID = Desi.DesignationID
	Where P.FirstName = @FirstName
End

Exec spSelectFromName 'Rahul'

--Create Procedure which displays department wise maximum, minimum & total salaries.
Create Procedure spDepartmentWiseMaxMinTotal
As
Begin
	Select 
		Dep.DepartmentName,
		Max(P.Salary) As [Max Salary],
		Min(P.Salary) As [Min Salary],
		Sum(P.Salary) As [Total Salary]
	From PersonNew P
	Left Outer Join Department Dep
	on P.DepartmentID = Dep.DepartmentID
	Group By Dep.DepartmentName
End

exec spDepartmentWiseMaxMinTotal

--Create Procedure which displays designation wise maximum, minimum & total salaries.
Create Procedure spDesignationWiseMaxMinTotal
As
Begin
	Select 
		Dep.DesignationName,
		Max(P.Salary) As [Max Salary],
		Min(P.Salary) As [Min Salary],
		Sum(P.Salary) As [Total Salary]
	From PersonNew P
	Left Outer Join Designation Dep
	on P.DesignationID = Dep.DesignationID
	Group By Dep.DesignationName
End

exec spDesignationWiseMaxMinTotal