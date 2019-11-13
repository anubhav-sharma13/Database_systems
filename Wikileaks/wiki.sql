drop database if exists project;

show databases;
create database project;
use project;



create table airport_vehicles ( airport_code int unique , vehicle_number int);
create table cities( Ccode int, country Varchar(15) , state Varchar(15) , city_name Varchar(15) , airport_code int );
create table vehicles (  vehicle_number  int , availability boolean ,  capacity int,  type Varchar(15) );
create table airport_airline ( airport_code int , airline_id int);
create table airlines ( airline_id int , airline_name Varchar(15) );
create table airport_employee ( airport_code int , employee_id varchar(20));
create table employee(  fname char (15),  mname char (15),  lname char(15), job_type int ,  dob date , address Varchar(100),  employee_id varchar(20) unique, emp_type int , sex char(5) );
create table employee_types( employee_type_id int ,  employee_type_name char(20) );
create table employee_job_type( employee_job_type_id int, employee_job_type_name char(15) );
create table employee_phone_numbers( employee_id varchar(20), phone_number int);
create table airline_flights( airport_code int, airline_id int, flight_code int );
create table flights( flight_code int,  destination int, source int, status char(10), duration int, flight_type int);
create table flight_types( flight_type_id int, flight_type_name char(10) );
create table food( food_type int, price int , food_type_name char(20));
create table flight_cargo( flight_code int,  cargo_type char(10), cargo_weight int);
create table flight_food( flight_code int, food_type int );
create table cargo( cargo_type_id int, cargo_type_name char(20));
create table flight_passengers( flight_code int ,  passenger_id int);
create table passengers( passenger_id int unique, fname char(15), mname char(15), lname char(15), dob date , address Varchar(100), sex char (5), date_of_booking date);
create table passenger_phone_numbers( passenger_id int, phone_number int);
--  create table passenger_tickets( passenger_id int, ticket_id int);
create table tickets( passenger_id int, ticket_id int, seat_number int, class int, source int, destination int, date_of_travel date);
create table ticket_class( class_type_id int, class_type_name char(15));



INSERT INTO  airline_flights values (0100, 91, 7890);
INSERT INTO  airline_flights values (0110, 92, 7892);
INSERT INTO  airline_flights values (0102, 93, 7894);

INSERT INTO  airlines values (91, 'Indigo');
INSERT INTO  airlines values (92, 'SpiceJet');
INSERT INTO  airlines values (93, 'AirIndia');

INSERT INTO  airport_airline values (0100, 91);
INSERT INTO  airport_airline values (0110, 92);
INSERT INTO  airport_airline values (0102, 93);


--  blahd a fdfa

INSERT INTO  airport_employee values (0100, 'A1');
INSERT INTO  airport_employee values (0100, 'A2');
INSERT INTO  airport_employee values (0110, 'B1');
INSERT INTO  airport_employee values (0102, 'C1');
INSERT INTO  airport_employee values (0102, 'C2');
--  airport_vehicles-- 
INSERT INTO airport_vehicles  values (0100, 0001);
INSERT INTO airport_vehicles  values (0110, 1002);
INSERT INTO airport_vehicles  values (0102, 1003);
--  cargo-- 
INSERT INTO cargo  values (01, 'baggage');
INSERT INTO cargo  values (02, 'electronic');
INSERT INTO cargo  values (03, 'jewellery');
-- cities-- 
INSERT INTO cities  values (01, 'INDIA', 'RJ', 'kota', 0100);
INSERT INTO cities  values (02, 'INDIA', 'RJ', 'jaipur', 0110);
INSERT INTO cities  values (03, 'INDIA', 'TS', 'hyderabad', 0102);
-- employee-- 
INSERT INTO employee  values ('Anu','shyam','sharma',1,'2000-01-01', 'BLN road','A1',1,'M');
INSERT INTO employee  values ('An',NULL,'sharma',2,'2000-02-02', 'LN road','A2',2,'F');
INSERT INTO employee  values ('Radhe','shyam','jalan',1,'2002-02-01', 'ABC road','B1',3,'M');
INSERT INTO employee  values ('Akshay',NULL,'hola',2,'2001-01-09', 'AB road','C1',4,'M');
INSERT INTO employee  values ('Sam','kr','tib',1,'2003-03-08','ZYX road','C2',1, 'M');
-- employee_job_type-- 
INSERT INTO employee_job_type values (1, 'full');
INSERT INTO employee_job_type values (2, 'intern');
-- employee_phone_numbers-- 
INSERT INTO employee_phone_numbers values ('A1', 987654321);
INSERT INTO employee_phone_numbers values ('A2', 123456789);
INSERT INTO employee_phone_numbers values ('A2', 111112222);
INSERT INTO employee_phone_numbers values ('B1', 999999999);
INSERT INTO employee_phone_numbers values ('C1', 123412341);
INSERT INTO employee_phone_numbers values ('C2', 987659876);
-- employee_types-- 
INSERT INTO employee_types values (2,('ENGINEER'));
INSERT INTO employee_types values (1,('ADMIN SUPPORT'));
INSERT INTO employee_types values (3,('TRAFFIC MONITOR'));
INSERT INTO employee_types values (4,('AIRPORT_AUTHORITY'));
-- flight_cargo-- 
INSERT INTO flight_cargo values (7890,01,20);
INSERT INTO flight_cargo values (7892,02,21);
INSERT INTO flight_cargo values (7894,03,20);
-- flight_food-- 
INSERT INTO flight_food values (7890,1);
INSERT INTO flight_food values (7892,2);
INSERT INTO flight_food values (7894,1);
-- flight_passengers-- 
INSERT INTO flight_passengers values (7890,12345);
INSERT INTO flight_passengers values (7892,12344);
INSERT INTO flight_passengers values (7894,12346);
-- flight_types-- 
INSERT INTO flight_types values (1,('Connecting'));
INSERT INTO flight_types values (2,('Direct'));
-- flights-- 
INSERT INTO flights values (7890,0110,0100,'on_time',3,2);
INSERT INTO flights values (7892,0100,0110,'on_time',2,2);
INSERT INTO flights values (7894,0102,0100,'on_time',4,1);
-- food-- 
INSERT INTO food values (1,200 , "veg");
INSERT INTO food values (2,300 , "non veg");
-- passenger_phone_numbers-- 
INSERT INTO passenger_phone_numbers values (12345,997098799);
INSERT INTO passenger_phone_numbers values (12344,987098799);
INSERT INTO passenger_phone_numbers values (12345,999098799);
INSERT INTO passenger_phone_numbers values (12346,997048799);
-- passenger_tickets-- 
-- INSERT INTO passenger_tickets values (12345,01);
-- INSERT INTO passenger_tickets values (12344,02);
-- INSERT INTO passenger_tickets values (12346,03);
-- passengers-- 
INSERT INTO passengers values (12344,'rauhgh','ranghghjan','shaghgha','1995-02-19',('23,Sector-9,delhi'),'M','2019-11-09');
INSERT INTO passengers values (12346,'rau','ranjan','shaa','1995-02-12',('23,Sector-9'),'F','2019-11-12');
INSERT INTO passengers values (12345,'raum','ranhjan','shhhaa','1995-02-18',('236,Sector-9'),'F','2019-10-12');
-- ticket_class-- 
INSERT INTO ticket_class values (1, 'ECONOMY');
INSERT INTO ticket_class values (2, 'BUSINESS');
-- tickets-- 
INSERT INTO tickets values (12344,01,01,1,0100,0110,'2019-11-08');
INSERT INTO tickets values (12345,02,02,1,0100,0102,'2019-11-05');
INSERT INTO tickets values (12346,03,03,2,0110,0102,'2019-11-12');
INSERT INTO tickets values (12346,04,03,2,0102,0100,'2019-11-12');
-- vehicles-- 1 for available
INSERT INTO vehicles values (0001,TRUE,4,'LMV');
INSERT INTO vehicles values (1002,TRUE,48,'BUS');
INSERT INTO vehicles values (1003,TRUE,45,'BUS');
INSERT INTO vehicles values (1004,FALSE,45,'BUS');






















