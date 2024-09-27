create database Assignment2ClauseandWildCards

use Assignment2ClauseandWildCards


--1. Create a customer table which comprises of these columns: ‘customer_id’,
--‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
create table customer(
customer_id int,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
address varchar(50),
city varchar(50),
state varchar(50),
zip varchar(50)
)

--2. Insert 5 new records into the table
insert into customer(customer_id,first_name,last_name,email,address,city,state,zip)
values(1,'Gina','A','Gina.A@abc.com','ABC street','San Jose','AC','1234'),
(2,'Irene','Rose','Irene.Rose@gmail.com','QWE street','QW','ASCV','5678'),
(3,'Raj','B','Raj.B@gmail.com','RTH street','JH','ERYT','4567'),
(4,'Linda','C','Linda.C@hotmail.com','RFG street','GHJ','RTG','4532'),
(5,'Swapnil','S','Swapnil.S@outlook.com','ERF street','GVD','GHB','8765')
--3. Select only the ‘first_name’ and ‘last_name’ columns from the customer table
select first_name,last_name from customer
--4. Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’.
select * from customer where first_name like'G%' and city='San Jose'
--5. Select those records where Email has only ‘gmail’.
select * from customer where email like '%@gmail.com'
--6. Select those records where the ‘last_name’ doesn't end with “A”.
select * from customer where last_name not like '%A'