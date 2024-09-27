use Assignment2ClauseandWildCards


--1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’,‘order_date’, ‘amount’, ‘customer_id’.
create table Orders(
order_id int,order_date date,amount decimal(5,2),customer_id int
)

--2. Insert 5 new records.
insert into Orders(order_id,order_date,amount,customer_id)values
(1, '2024-08-01', 150.75, 1),
(2, '2024-08-02', 230.50, 2),
(3, '2024-08-03', 99.99, 3),
(4, '2024-08-04', 275.00, 4),
(5, '2024-05-01', 160.75, 6)


--3. Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column.
select * from customer join Orders on Customer.customer_id=Orders.customer_id

--4. Make left and right joins on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column.
select * from customer left join Orders on Customer.customer_id=Orders.customer_id

select * from customer right join Orders on Customer.customer_id=Orders.customer_id

--5. Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column.
select * from customer full join Orders on Customer.customer_id=Orders.customer_id

--6. Update the ‘Orders’ table and set the amount to be 100 where ‘customer_id’ is 3.
update Orders set amount=100 where customer_id=3