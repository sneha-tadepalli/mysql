create table salespeople(
snum int,
sname varchar(15),
city varchar(15),
comm int,
primary key(snum),
unique(sname));

insert into salespeople(snum,sname,city,comm) values
(1001,'peel','london',12),
(1002 , 'Serres', 'Sanjose',13),
(1004,' Motika',' London',11),
(1007, 'Rifkin',' Barcelona',15),
(1003, 'Axelrod','Newyork', 10);

create table customers (
cnum int,
cname varchar(15),
city varchar(15) not null,
snum int,
primary key(cnum),
foreign key(snum),
references salespeople(snum));

insert into customers(cnum,cname,city,snum) values
(2001,'Hoffman', 'London', 1001),
(2002,'Giovanni',' Rome', 1003),
(2003,'Liu', 'Sanjose', 1002),
(2004,'Grass', 'Berlin', 1002),
(2006,'Clemens', 'London', 1001),
(2008,'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);

create table orders(
onum int,
amt float,
odate date,
cnum int,
snum int,
primary key(onum),
foreign key(cnum)
references customers (cnum),
foreign key(snum)
references salespeople (snum));


insert into orders(onum,amt,odate,cnum,snum) values 
(3001,18.69,'1990-10-3',2008,1007),
(3003,767.19,'1990-10-3',2001,1001),
(3002,1900.10,'1990-10-3',2007,1004),
(3005,5160.45,'1990-10-3',2003,1002),
(3006,1098.16,'1990-10-3',2008,1007),
(3009 ,1713.23, '1990-10-4', 2002, 1003),
(3007,  75.75, '1990-10-4' ,2004 ,1002),
(3008,  4273.00 ,1990-10-5', 2006, 1001),
(3010,  1309.95, '1990-10-6' ,2004, 1002),
(3011,  9891.88, '1990-10-6', 2006, 1001);

--1. Count the number of Salesperson whose name begin with ‘a’/’A’.
    
    select count(*) from salespeople where sname like 'A%' or sname like 'a%';
--2. Display all the Salesperson whose all orders worth is more than Rs. 2000.

    select salespeople.sname,salespeople.snum,orders.amt from salespeople inner join orders on salespeople.snum = orders.snum where amt >2000;
--3. Count the number of Salesperson belonging to Newyork.

    select count(*) from salespeople where city = 'newyork';

--4. Display the number of Salespeople belonging to London and belonging to Paris.

     select sname,city from salespeople where city = 'london' and city = 'paris';
--5.Display the number of orders taken by each Salesperson and their date of orders.

    select salespeople.sname,orders.snum,orders.odate from salespeople inner join orders on salespeople.snum = orders.snum;











