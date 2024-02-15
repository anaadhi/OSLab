-- CUSTOMER (cust#: int, cname: varchar(50), city: 
-- varchar(30))  
create table CUSTOMER(
    cust# int,
    cname varchar(50),
    city varchar(30),
    primary key(cust#));

-- ORDERS (order#:int, odate: date, cust#: int, ordamt: int) 
create table ORDERS(
    order# int,
    odate date,
    cust# int,
    ordamt int,
    primary key(order#),
    foreign key (cust#) references CUSTOMER);

insert into CUSTOMER values(1, 'John', 'New York');
insert into CUSTOMER values(2, 'Smith', 'Los Angeles');
insert into CUSTOMER values(3, 'Brown', 'Chicago');
insert into CUSTOMER values(4, 'Johnson', 'Houston');
insert into CUSTOMER values(5, 'Williams', 'Phoenix');

insert into ORDERS values(1, to_date('01/01/2019', 'mm/dd/yyyy'), 1, 100);
insert into ORDERS values(2, to_date('01/02/2019', 'mm/dd/yyyy'), 2, 200);
insert into ORDERS values(3, to_date('01/03/2019', 'mm/dd/yyyy'), 3, 300);
insert into ORDERS values(4, to_date('01/04/2019', 'mm/dd/yyyy'), 4, 400);
insert into ORDERS values(5, to_date('01/05/2019', 'mm/dd/yyyy'), 5, 500);

-- ITEM (item#: int, unitprice: int) 
create table ITEM(
    item# int,
    unitprice int,
    primary key(item#));

insert into ITEM values(1, 10);
insert into ITEM values(2, 20);
insert into ITEM values(3, 30);
insert into ITEM values(4, 40);
insert into ITEM values(5, 50);

-- ORDER_ITEMS (order#:int, qty:int, item#:int) 
create table ORDER_ITEMS(
    order# int,
    qty int,
    item# int,
    foreign key (order#) references ORDERS,
    foreign key (item#) references ITEM);

insert into ORDER_ITEMS values(1, 1, 1);
insert into ORDER_ITEMS values(1, 2, 2);
insert into ORDER_ITEMS values(2, 3, 3);
insert into ORDER_ITEMS values(2, 4, 4);
insert into ORDER_ITEMS values(3, 5, 5);

-- WAREHOUSE (warehouse#:int, city: varchar(30)) 
create table WAREHOUSE(
    warehouse# int,
    city varchar(30),
    primary key(warehouse#));

insert into WAREHOUSE values(1, 'New York');
insert into WAREHOUSE values(2, 'Los Angeles');
insert into WAREHOUSE values(3, 'Chicago');
insert into WAREHOUSE values(4, 'Houston');
insert into WAREHOUSE values(5, 'Phoenix');

-- SHIPMENT (order#: int, warehouse#: int, shipdate: date) 
create table SHIPMENT(
    order# int,
    warehouse# int,
    shipdate date,
    foreign key (order#) references ORDERS,
    foreign key (warehouse#) references WAREHOUSE);

insert into SHIPMENT values(1, 1, to_date('01/01/2019', 'mm/dd/yyyy'));
insert into SHIPMENT values(2, 2, to_date('01/02/2019', 'mm/dd/yyyy'));
insert into SHIPMENT values(3, 3, to_date('01/03/2019', 'mm/dd/yyyy'));
insert into SHIPMENT values(4, 4, to_date('01/04/2019', 'mm/dd/yyyy'));
insert into SHIPMENT values(5, 5, to_date('01/05/2019', 'mm/dd/yyyy'));

-- Produce a listing: CUSTNAME,  No.  of  Orders,  AVG_ORDER_AMT, 
-- where the middle column is the total number of orders by the customer and 
-- the last column is the average order amount for that customer. 
select cname as CUSTNAME, count(order#) as "No. of Orders", 
    avg(ordamt) as AVG_ORDER_AMT
from CUSTOMER c
join ORDERS o on c.cust# = o.cust#
group by cname;

-- List the order no for the orders that were shipped from all the warehouses that the company has in a specific city.
-- city = 'New York'
select order# from ORDERS
where order# in (select order# from SHIPMENT s
    join WAREHOUSE w on s.warehouse# = w.warehouse#
    where city = 'New York');
