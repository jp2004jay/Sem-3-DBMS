create database Person_Info

use Person_Info

-- CREATE DEPARTMENT TABLE
CREATE TABLE Department(
DepartmentID Int Primary Key,
DepartmentName	Varchar (100) Not Null Unique,
DepartmentCode	Varchar (50) Not Null Unique,
Location Varchar (50) Not Null)

--INSERT DATA INTO DEPARTMENT
INSERT INTO Department VALUES(1,'Admin','Adm','A-Block')
INSERT INTO Department VALUES(2,'Computer','CE','C-Block')
INSERT INTO Department VALUES(3,'Civil','CI','G-Block')
INSERT INTO Department VALUES(4,'Electrical','EE','E-Block')
INSERT INTO Department VALUES(5,'Mechanical','ME','B-Block')

--CREATE Person TABLE
CREATE TABLE Person(
PersonID Int Primary Key,
PersonName Varchar(100) Not Null,
DepartmentID Int Null FOREIGN KEY REFERENCES Department(DepartmentID),
Salary Decimal(8,2) Not Null,
JoiningDate	Datetime Not Null,
City Varchar(100) Not Null)

-- INSERT DATA INTO PERSON
INSERT INTO Person VALUES(101,'Rahul Tripathi',2,56000,'01-01-2000','Rajkot')
INSERT INTO Person VALUES(102,'Hardik Pandya',3,18000,'25-sep-2001','Ahmedabad')
INSERT INTO Person VALUES(103,'Bhavin Kanani',4,25000,'14-may-2000','Baroda')
INSERT INTO Person VALUES(104,'Bhoomi Vaishnav',1,39000,'08-feb-2005','Rajkot')
INSERT INTO Person VALUES(105,'Rohit Topiya',2,17000,'23-jul-2001','Jamnagar')
INSERT INTO Person VALUES(106,'Priya Menpara',NULL,9000,'18-oct-2000','Ahmedabad')
INSERT INTO Person VALUES(107,'Neha Sharma',2,34000,'25-dec-2002','Rajkot')
INSERT INTO Person VALUES(108,'Nayan Goswami',3,25000,'01-jul-2001','Rajkot')
INSERT INTO Person VALUES(109,'Mehul Bhundiya',4,13500,'09-jan-2005','Baroda')
INSERT INTO Person VALUES(110,'Mohit Maru',5,14000,'25-may-2000','Jamnagar')

select * from Department

select * from Person

--1
Select P.PersonName, D.DepartmentName, D.DepartmentCode
from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID

--2
Select P.PersonName
from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.Location = 'C-Block'

--3
Select P.PersonName, P.Salary, D.DepartmentName
from Person p
Left outer join Department D
on P.DepartmentID = D.DepartmentID
where P.City = 'Jamnagar'

--4
Select P.PersonName, P.Salary, D.DepartmentName
from Person p
Left outer join Department D
on P.DepartmentID = D.DepartmentID
where P.City <> 'Rajkot'

--5
select * from Person P
Left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.DepartmentName = 'Computer'

--6
select * from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.DepartmentName is null

--7
select P.PersonName from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.DepartmentName = 'Civil'
and P.JoiningDate > '1/08/2001'

--8
select P.PersonName, D.DepartmentName from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where DATEDiff(DAY, P.JoiningDate, GetDate()) > 365

--9
select D.DepartmentName, count(P.PersonID) as Employee from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
Group by D.DepartmentName

--10
select D.DepartmentName, max(P.Salary) as Max_Salary, min(P.Salary) as Min_Salary from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
Group by D.DepartmentName

--11
select City, SUM(Salary) as [SUM], AVG(Salary) as [AVG], MAX(Salary) as [MAX], MIN(Salary) as [MIN]
from Person
group by City

--12
select D.DepartmentName, sum(P.Salary) as [Total] from Department D
left outer join Person P
on D.DepartmentID = P.DepartmentID
group by D.DepartmentName
having sum(P.Salary) > 100000

--13
select AVG(Salary) as [AVG Salary] from Person
where City = 'Ahmedabad'

--14
select D.DepartmentName, count(P.PersonID) as [Count] from Person P
left outer join Department D
on D.DepartmentID = P.DepartmentID
group by D.DepartmentName
having count(P.PersonID) is null

--15
select D.DepartmentName, count(P.PersonID) as [Count] from Person P
left outer join Department D
On D.DepartmentID = P.DepartmentID
group by D.DepartmentName
having COUNT(P.PersonID) > 2

--16
select P.PersonName + ' lives in ' + P.City + ' and works in ' + D.DepartmentName + ' Department.' from Person P
inner join Department D
on D.DepartmentID = P.DepartmentID

--17
select P.PersonName + ' earns ' + CAST(P.Salary as varchar) + ' from department ' + D.DepartmentName + ' monthly.' from Person P
inner join Department D
on D.DepartmentID = P.DepartmentID

--18 
select P.City, D.DepartmentName, SUM(P.Salary) as [Total Salary], AVG(P.Salary) as [AVG Salary], MAX(P.Salary) as [MAX Salary] 
from Person P
inner join Department D
on D.DepartmentID = P.DepartmentID
group by P.City, D.DepartmentName

--19
Update Person 
set Person.Salary = Person.Salary + (0.1*Person.Salary)
from Person
left outer join Department
on Department.DepartmentID = Person.DepartmentID
where Department.DepartmentName = 'Computer'

