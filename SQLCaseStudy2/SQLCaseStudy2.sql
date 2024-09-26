--create all tables

create table LOCATION
(
Location_Id int primary key,
City varchar(50)
)

create table DEPARTMENT
(
Department_Id int primary key,
[Name]  varchar(50),
Location_Id int foreign key references LOCATION(Location_Id)
)

create table Job
(
Job_ID int primary key,
Designation varchar(50)
)

create table Employee
(
Employee_Id int,
Last_Name varchar(50),
First_Name varchar(50),
Middle_Name varchar(50),
Job_Id int foreign key references Job(Job_ID),
Hire_Date date,
Salary int,
Comm int,
Department_Id int foreign key references DEPARTMENT(Department_Id)
)
--insert data

insert into LOCATION
values(122,'New York'),
(123,'Dallas'),
(124,'Chicago'),
(167,'Boston')

insert into DEPARTMENT
values(10,'Accounting',122),
(20,'Sales',124),
(30,'Research',123),
(40,'Operations',167)

insert into JOB
values(667,'Clerk'),
(668,'Staff'),
(669,'Analyst'),
(670,'Sales Person'),
(671,'Manager'),
(672,'President')

insert into EMPLOYEE
values(7369,'Smith','John','Q',667,'1984-12-17',800,NULL,20),
(7499,'Allen','Kevin','J',670,'1985-02-20',1600,300,30),
(755,'Doyle','Jean','K',671,'1985-04-04',2850,NULL,30),
(756,'Dennis','Lynn','S',671,'1985-05-15',2750,NULL,30),
(757,'Baker','Leslie','D',671,'1985-06-10',2200,NULL,40),
(7521,'Wark','Cynthia','D',670,'1985-02-22',1250,50,30)




--Simple Queries:
--1. List all the employee details.
select * from employee
--2. List all the department details.
select * from DEPARTMENT
--3. List all job details.
select * from JOB
--4. List all the locations.
select * from LOCATION
--5. List out the First Name, Last Name, Salary, Commission for all Employees.
select First_Name,Last_Name,Salary,Comm from EMPLOYEE
--6. List out the Employee ID, Last Name, Department ID for all employees and alias
--Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".
select Employee_Id as [ID of the Employee],Last_Name as [Name of the Employee],Department_Id as Dep_id from employee
--7. List out the annual salary of the employees with their names only.
select First_Name,Salary from Employee


--WHERE Condition:
--1. List the details about "Smith".
select * from employee where Last_Name='Smith'
--2. List out the employees who are working in department 20.
select First_Name from employee where Department_id=20
--3. List out the employees who are earning salary between 2000 and 3000.
select First_Name from employee where salary between 2000 and 3000
--4. List out the employees who are working in department 10 or 20.
select First_Name from employee where department_Id in (10,20)
--5. Find out the employees who are not working in department 10 or 30.
select First_Name from employee where department_Id not in (10,30)
--6. List out the employees whose name starts with 'L'.
select First_Name from employee where First_Name like 'L%'
--7. List out the employees whose name starts with 'L' and ends with 'E'.
select First_Name from employee where First_Name like 'L%' and First_Name like '%E'
--8. List out the employees whose name length is 4 and start with 'J'.
select First_Name from employee where len(First_Name)=4 and First_Name like 'J%'
--9. List out the employees who are working in department 30 and draw the salaries more than 2500.
select First_Name from employee where Department_Id=30 and Salary>2500
--10. List out the employees who are not receiving commission.
select First_Name from employee where comm is null



--ORDER BY Clause:
--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
select Employee_Id,Last_Name from employee order by Employee_Id
--2. List out the Employee ID and Name in descending order based on salary.
select Employee_Id,First_Name from employee order by Salary desc
--3. List out the employee details according to their Last Name in ascending-order.
select * from employee order by Last_Name
--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
select * from employee order by Last_Name,Department_Id desc



--GROUP BY and HAVING Clause:
--1. List out the department wise maximum salary, minimum salary and average salary of the employees.
select Department_Id,max(Salary) as Max_Salary,min(Salary) as Min_Salary,avg(salary) as Average_Salary from employee group by Department_Id
--2. List out the job wise maximum salary, minimum salary and average salary of the employees.
select Job_Id,max(Salary) as Max_Salary,min(Salary) as Min_Salary,avg(Salary) as Avg_Salary from employee group by Job_Id
--3. List out the number of employees who joined each month in ascending order.
select month(Hire_Date) as Joining_Month,count(*) as No_of_employees from employee group by month(Hire_Date) order by month(Hire_Date)
--4. List out the number of employees for each month and year in ascending order based on the year and month.
select month(Hire_Date) as Joining_Month,year(Hire_Date) as Joining_Year,count(*) as No_of_employees from employee
group by month(Hire_Date),year(Hire_Date) order by month(Hire_Date),year(Hire_Date)
--5. List out the Department ID having at least four employees.
select Department_Id,count(*) as No_of_Employee from employee group by department_Id having count(*)>=4
--6. How many employees joined in February month.
select count(*) as No_of_Employee from employee where month(Hire_Date)='2'
--7. How many employees joined in May or June month.
select count(*) as No_of_Employee from employee where month(Hire_Date) in (5,6)
--8. How many employees joined in 1985?
select count(*) as No_of_Employee from employee where year(Hire_Date)='1985' 
--9. How many employees joined each month in 1985?
select month(Hire_Date) as Hire_Month,count(*) as No_of_Employee from employee where year(Hire_Date)='1985'
group by month(Hire_Date)
--10. How many employees were joined in April 1985?
select count(*) as No_of_Employee from employee where Hire_Date like '1985-04-%'
--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
select Department_Id,count(*) as No_of_Employee from employee where Hire_Date like '1985-04-%'group by Department_Id having count(*)>=3



--Joins:
--1. List out employees with their department names.
select E.First_Name,D.[Name]
from department as D inner join employee as E
on E.Department_Id=D.Department_Id
--2. Display employees with their designations.
select First_Name,Designation
from employee inner join job
on Job.Job_Id=Employee.Job_Id
--3. Display the employees with their department names and city.
select E.First_Name,D.[Name],L.City from
Employee as E inner join Department as D
on E.Department_Id=D.Department_Id
inner join Location as L
on L.Location_Id=D.Location_Id
--4. How many employees are working in different departments? Display with department names.
select D.[Name],count(*) as No_of_Employee
from Employee as E inner join Department as D
on E.Department_Id=D.Department_Id 
group by D.[Name]
--5. How many employees are working in the sales department?
select count(*) as No_of_Employee
from Employee as E inner join Department as D
on E.Department_Id=D.Department_Id 
where D.[Name]='Sales'
--6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order.
select D.[Name],count(*) as No_of_Employee
from Employee as E inner join Department as D
on E.Department_Id=D.Department_Id 
group by D.[Name] having count(*)>=3
order by D.[Name] asc
--7. How many employees are working in 'Dallas'?
select count(*) as No_of_employee from
Employee as E inner join Department as D
on E.Department_Id=D.Department_Id
inner join Location as L
on L.Location_Id=D.Location_Id
where L.City='Dallas'
--8. Display all employees in sales or operation departments.
select E.First_Name,D.[Name]
from Employee as E inner join Department as D
on E.Department_Id=D.Department_Id 
where D.Name in ('Sales','Operations')





--CONDITIONAL STATEMENT
--1. Display the employee details with salary grades. Use conditional statement to
--create a grade column.
select *,
case
	when Salary>2500 then 'A'
	when Salary>1500 and Salary<=2500 then 'B'
	when Salary>500 and Salary<=1500 then 'C'
	else 'D' end as Salary_Grade
from employee
--2. List out the number of employees grade wise. Use conditional statement to
--create a grade column.
select Salary_Grade,count(*) as No_of_employee from (select *,
case
	when Salary>2500 then 'A'
	when Salary>1500 and Salary<=2500 then 'B'
	when Salary>500 and Salary<=1500 then 'C'
	else 'D' end as Salary_Grade
from employee) as Employee_Grade group by Salary_Grade

--3. Display the employee salary grades and the number of employees between
--2000 to 5000 range of salary.
select Salary_Grade,count(*) as no_of_employee from (select *,
case
	when Salary>2500 then 'A'
	when Salary>1500 and Salary<=2500 then 'B'
	when Salary>500 and Salary<=1500 then 'C'
	else 'D' end as Salary_Grade
from employee where Salary between 2000 and 5000) as Employee_Grade group by Salary_Grade 




--Subqueries:
--1. Display the employees list who got the maximum salary.
select * from employee where salary=(Select max(Salary) from employee)
--2. Display the employees who are working in the sales department.
select * from employee where Department_Id=(select
Department_Id from Department where [Name]='Sales')
--3. Display the employees who are working as 'Clerk'.
select count(*) as No_of_employee from employee
where Job_Id=(select Job_Id from Job where Designation='Clerk')
--4. Display the list of employees who are living in 'Boston'.
select * from employee where
Department_Id=(select D.Department_Id from
Department as D inner join Location as L
on D.Location_Id=L.Location_Id where L.City='Boston')
--5. Find out the number of employees working in the sales department.
select count(*) as No_of_employee from employee
where Department_Id=(select Department_Id from Department where
[Name]='Sales')
--6. Update the salaries of employees who are working as clerks on the basis of 10%.
update Employee set Salary=Salary*(110/100) where Job_Id=
(select Job_ID from Job where Designation='Clerk')
select * from Employee
--7. Display the second highest salary drawing employee details.
select top 1* from employee
where Salary<(select max(Salary) from employee)
order by Salary desc
--8. List out the employees who earn more than every employee in department 30.
select * from employee where Salary>(select max(salary) from employee where Department_Id=30)
--9. Find out which department has no employees.
select [Name] from Department where Department_Id not in(select Department_Id
from employee)
--10. Find out the employees who earn greater than the average salary for their department.
select * from Employee as O
where Salary>(select avg(Salary) from employee as I
where I.Department_Id=O.Department_Id)





