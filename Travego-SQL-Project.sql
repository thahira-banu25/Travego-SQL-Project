create database travego;
show databases;
use travego;
create table passenger(
passenger_id int primary key,
passenger_name varchar(30),
category varchar(30),
gender varchar(10),
boarding_city varchar(30),
destination varchar(30),
distance int(20),
bus_type varchar(30)
);
create table price(
id int primary key,
bus_type varchar(30),
distance int,
price decimal(10,2)
);

insert into passenger (passenger_id,passenger_name ,category ,gender,boarding_city,destination,distance, bus_type)
 values (1,'sejal', 'AC','F','Bengaluru', 'Chennai',350,'sleeper');
 insert into passenger (passenger_id,passenger_name ,category ,gender,boarding_city,destination,distance, bus_type)
 values (2,'anmol', 'Non-AC','M','Mumbai', 'Hyderabad',700,'sitting');
 insert into passenger (passenger_id,passenger_name ,category ,gender,boarding_city,destination,distance, bus_type)
 values (3,'pallavi', 'AC','F','Panaji', 'Bengaluru',600,'sleeper');
 insert into passenger (passenger_id,passenger_name ,category ,gender,boarding_city,destination,distance, bus_type)
 values (4,'kushboo', 'AC','F','Chennai', 'Mumbai',1500,'sleeper');
 insert into passenger (passenger_id,passenger_name ,category ,gender,boarding_city,destination,distance, bus_type)
 values (5,'Udit', 'Non-AC','M','trivandrum', ' Panaji',1000,'sleeper');
 insert into passenger (passenger_id,passenger_name ,category ,gender,boarding_city,destination,distance, bus_type)
 values (6,'Ankur', 'AC','M','Nagpur', ' Hyderabad',500,'sitting');
 insert into passenger (passenger_id,passenger_name ,category ,gender,boarding_city,destination,distance, bus_type)
 values (7,'Hemant', 'Non-AC','M','Panaji', 'Mumbai',700,'sleeper');
 insert into passenger (passenger_id,passenger_name ,category ,gender,boarding_city,destination,distance, bus_type)
 values (8,'Manish', 'Non-AC','M','hyderabad', 'Bengaluru',500,'sitting');
 insert into passenger (passenger_id,passenger_name ,category ,gender,boarding_city,destination,distance, bus_type)
 values (9,'piyush', 'AC','M','Pune', 'Nagpur',700,'sitting');
 
 insert into price (id, bus_type,distance,price)
 values (1,'Sleeper',350,770);
  insert into price (id, bus_type,distance,price)
 values (2,'Sleeper',500,1100);
  insert into price (id, bus_type,distance,price)
 values (3,'Sleeper',600,1320);
  insert into price (id, bus_type,distance,price)
 values (4,'Sleeper',700,1540);
  insert into price (id, bus_type,distance,price)
 values (5,'Sleeper',1000,2200);
  insert into price (id, bus_type,distance,price)
 values (6,'Sleeper',1200,2640);
  insert into price (id, bus_type,distance,price)
 values (7,'Sleeper',1500,2700);
  insert into price (id, bus_type,distance,price)
 values (8,'sitting',500,620);
  insert into price (id, bus_type,distance,price)
 values (9,'sitting',600,744);
  insert into price (id, bus_type,distance,price)
 values (10,'sitting',700,868);
  insert into price (id, bus_type,distance,price)
 values (11,'sitting',1000,1240);
  insert into price (id, bus_type,distance,price)
 values (12,'sitting',1200,1488);
  insert into price (id, bus_type,distance,price)
 values (13,'sitting',1500,1860);
 
select * from passenger;
select * from price;

-- a. How many female passengers traveled a minimum distance of 600 KM?

SELECT COUNT(*) AS female_passengers
FROM passenger
WHERE gender='F'
AND distance >= 600;
-- b. Passenger details whose distance is
-- greater than 500 and traveling in sleeper bus

SELECT *
FROM passenger
WHERE distance > 500
AND bus_type='sleeper';

-- c. Passenger names starting with 'S'

SELECT passenger_name
FROM passenger
WHERE passenger_name LIKE 'S%';

-- d. Display passenger name, boarding city,
-- destination city, bus type and price

SELECT 
p.passenger_name,
p.boarding_city,
p.destination,
p.bus_type,
pr.price
FROM passenger p
JOIN price pr
ON p.distance = pr.distance
AND p.bus_type = pr.bus_type;

-- e. Passenger names and ticket price
-- who traveled 1000 KM in sitting bus

SELECT
p.passenger_name,
pr.price
FROM passenger p
JOIN price pr
ON p.distance = pr.distance
AND p.bus_type = pr.bus_type
WHERE p.distance = 1000
AND p.bus_type = 'sitting';

-- f. Sitting and Sleeper bus charge for
-- Pallavi to travel from Bengaluru to Panaji

SELECT bus_type, price
FROM price
WHERE distance = 600;

-- g. Update category as Non-AC
-- where bus type is sleeper

UPDATE passenger
SET category = 'Non-AC'
WHERE bus_type='sleeper';

SELECT * FROM passenger;

-- h. Delete record where passenger name is piyush

DELETE FROM passenger
WHERE passenger_name='piyush';

COMMIT;

SELECT * FROM passenger;

-- i. Truncate passenger table

TRUNCATE TABLE passenger;

SELECT * FROM passenger;

-- j. Delete passenger table

DROP TABLE passenger;