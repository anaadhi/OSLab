-- **SETTINGS
-- set pagesize 200
-- set linesize 500
-- **

create table Person(
   driver_id varchar(30),
    name varchar(50),
    address varchar(100),
    primary key(driver_id));

create table car(
    regno varchar(20),
    model varchar(30),
    year int,
    primary key(regno));

create table accident(
    report_number int,
    accd_date date,
    location varchar(50),
    primary key(report_number));

create table owns(
    driver_id varchar(30),
    regno varchar(20),
    foreign key(driver_id) references person,
    foreign key(regno) references car
    );

create table participated(
driver_id varchar(30),
regno varchar(20),
report_number int,
damage_amount int,
primary key(driver_id, regno, report_number),
foreign key (driver_id) references person,
foreign key (regno) references car,
foreign key (report_number) references accident);

insert into person values('1a','patrick','Ghaziabad');
insert into person values('2a','squidward','gotham');
insert into person values('3a','jotaro','Lucknow');
insert into person values('4a','joester','Delhi');
insert into person values('5a','iggy','Delhi');

insert into car values('1c', 'Airbus a380',2000);
insert into car values('2c', 'toyota hyryder',2001);
insert into car values('3c', 'kia sonet', 2002);
insert into car values('4c', 'honda city', 2003);
insert into car values('5c', 'maruti 800', 2004);


insert into accident values(12, '01-JAN-23', 'Delhi');
insert into accident values(13, '01-FEB-22', 'Ghaziabad');
insert into accident values(14, '01-MAR-22', 'gotham');
insert into accident values(15, '01-APR-04', 'Lucknow');
insert into accident values(16, '01-MAY-12', 'Ghaziabad');

insert into owns values('1a','1c');
insert into owns values('1a','2c');
insert into owns values('2a','3c');
insert into owns values('3a','4c');
insert into owns values('4a','5c');
insert into owns values('5a','1c');

insert into participated values('1a','1c',12, 25000);
insert into participated values('1a','1c',13, 22222);
insert into participated values('2a','2c',14, 30000);
insert into participated values('3a','3c',15, 40000);
insert into participated values('1a','2c',16, 50000);

update participated set damage_amount = 25000 where regno = '1c' and report_number = 12;

delete from accident where extract(year from accd_date)=2004;

-- first delete from participated since it contains foreign keys from accident
delete from participated where report_number in (select report_number from accident where extract(year from accd_date)=2004);
delete from accident where extract(year from accd_date)=2004;

-- add a unique id to owns
alter table person add license_no varchar(30);
alter table person drop column license_no;

-- add an integrity constraint such that damage amount is always greater than 0
alter table participated add constraint check_damage_amount check(damage_amount > 0);

-- Create a procedure to display total damage caused due to an accident for a particular 
-- driver on a particular year. The procedure should take driver_id and year as input

create or replace procedure total_damage(
    driver_id_in in varchar,
    year_in in int,
    total_damage_out out int
) as
begin
    select sum(damage_amount) into total_damage_out
    from participated natural join accident
    where driver_id = driver_id_in and extract(year from accd_date) = year_in;
end;
/

-- call total damage with id 1a and year 2023
declare
    total_damage_out int;
begin
    total_damage('1a', 2023, total_damage_out);
    dbms_output.put_line('Total damage: ' || total_damage_out);
end;

