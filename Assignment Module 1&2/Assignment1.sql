use assignment1


--1. Insert a new record in your Orders table.
insert into Orders values(5005,3456,102,'2023-09-08',330)
select * from Orders
--2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
--constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
--column in Customer table. Add not null constraint in Customer_name column for the
--Customer table.

--first making Salesman not null and then setting it as primary key
alter table Salesman alter column SalesmanId int NOT NULL
alter table Salesman add constraint primary_key_constraint primary key (SalesmanId)

alter table Salesman add constraint default_key default 'Canada' for City 

--first making CustomerId not null and then making it as primary key , after that Foreign key constraint for SalesmanId
--column in Customer table is added
alter table Customer alter column CustomerId int NOT NULL
alter table Customer add constraint primary_key1 primary key(CustomerId)
alter table Customer add constraint foreign_key_constraint1 foreign key (SalesmanId) references Salesman (SalesmanId)

alter table Customer alter column CustomerName varchar(255) NOT NULL
--3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
--amount value greater than 500.
Select * from Customer 
where CustomerName like '%N' and
PurchaseAmount>500
--4. Using SET operators, retrieve the first result with unique SalesmanId values from two
--tables, and the other result containing SalesmanId with duplicates from two tables.
select SalesmanId from Salesman
UNION
select SalesmanId from Customer

select SalesmanId from Salesman
UNION ALL
select SalesmanId from Customer
--5. Display the below columns which has the matching data.
--Orderdate, Salesman Name, Customer Name, Commission, and City which has the
--range of Purchase Amount between 500 to 1500.

Select  O.OrderDate,S.[Name],C.CustomerName,S.Commission,S.City
from Salesman as S inner join Customer as C
on S.SalesmanId=C.SalesmanId inner join Orders as O
on C.SalesmanId=O.SalesmanId
where C.PurchaseAmount between 500 and 1500


--6. Using right join fetch all the results from Salesman and Orders table

select * from
Salesman S right join Orders O
on S.SalesmanId=O.SalesmanId