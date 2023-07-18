--all table update
Create Procedure spPersonNew_Update
	@WorkerID int,
	@FirstName varchar(100),
	@LastName varchar(100),
	@Salary decimal(8,2),
	@JoiningDate datetime,
	@DepartmentID int,
	@DesignationID int
As
Begin
	Update PersonNew
	set	FirstName = @FirstName,
		LastName = @LastName,
		Salary = @Salary,
		JoiningDate = @JoiningDate,
		DepartmentID = @DepartmentID,
		DesignationID = @DesignationID
	where  WorkerID = @WorkerID 
End

--
Create Procedure spDesignation_Update
	@DesignationID int,
	@DesignationName varchar(100)
As
Begin
	Update Designation
	set DesignationName = @DesignationName
	where DesignationID = @DesignationID 
End

--
Create Procedure spDepartment_Update
	@DepartmentID int,
	@DepartmentName varchar(100)
As
Begin
	Update Department
	set DepartmentName = @DepartmentName
	where DepartmentID = @DepartmentID
End

--All Table Delete
Create Procedure spPersonNew_Delete
	@WorkerID int
As
Begin
	Delete From PersonNew
	where WorkerID = @WorkerID
End

--
Create Procedure spDesignation_Delete
	@DesignationID int
As
Begin
	Delete From Designation
	where DesignationID = @DesignationID
End

--
Create Procedure spDepartment_Delete
	@DepartmentID int
As
Begin
	Delete From Department
	where DepartmentID = @DepartmentID
End

--all Table Select Primary Key
Create Procedure spPersonNew_Select_Primary
	@WorkerID int
As
Begin
	Select * From PersonNew
	where WorkerID = @WorkerID
End

--
Create Procedure spDesignation_Select_Primary
	@DesignationID int
As
Begin
	Select * From Designation
	where DesignationID = @DesignationID
End

--
Create Procedure spDepartment_Select_Primary
	@DepartmentID int
As
Begin
	Select * From Department
	where DepartmentID = @DepartmentID
End

--all Table All Data Retrive
Create Procedure spDepartment_SelectAllData
As
Begin
	Select * From Department
End

--
Create Procedure spDesignation_SelectAllData
As
Begin
	Select * From Designation
End

--
Create Procedure spPersonNew_SelectAllData
As
Begin
	Select 
		P.WorkerID,
		P.FirstName,
		P.LastName,
		P.Salary,
		P.JoiningDate,
		Dep.DepartmentName,
		Desi.DesignationName
	From PersonNew P
	Left Outer Join Department Dep
	on P.DepartmentID = Dep.DepartmentID
	Left Outer Join Designation Desi
	on P.DesignationID = Desi.DesignationID
End

exec spPersonNew_SelectAllData

--Lab-3.1
Create Procedure spTop3PersonDetail
As
Begin
	Select Top(3) * From PersonNew 
End

exec spTop3PersonDetail


--Lab-3.2
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

--Lab-3.3
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

--Lab-3.4
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

--Lab-3.5
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

--Lab-3.6
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

--Practice
use Person_Info

